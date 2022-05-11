import enum
from xmlrpc.client import Boolean
import matplotlib.pyplot as plt
import numpy as np
import logging
import os
from typing import List, Tuple
import subprocess
import re
from enum import Enum

PATH_BENCHMARKS = ["benchmarks/blocksworld"]  # , "benchmarks/ipc1/logistics",
# "benchmarks/ipc2/blocksworld", "benchmarks/ipc3/depot"]
PATH_OUTPUT = ""

PATH_PDDL4J_LIB = "app/libs/pddl4j-4.0.0.jar"
PATH_CLASS_HSP_IN_PDDL4J = "fr.uga.pddl4j.planners.statespace.HSP"

PATH_VAL_LIB = "VAL/bin/Validate"

# Flag to check the plan validity for the planner SAT
CHECK_SAT_PLAN_VALIDITY = True


class Planner(Enum):
    HSP = 0,
    SAT = 1


def extract_plan_from_output(output_command: str) -> str:
    """
    Extract plan from the output of command line. If no plan is found, return None
    """

    all_lines_output = output_command.splitlines()

    try:
        idx_line_state_plan = all_lines_output.index(
            "found plan as follows:") + 2
        i = 0
        plan = []
        while (idx_line_state_plan + i < len(all_lines_output) and all_lines_output[idx_line_state_plan + i] != ''):
            plan.append(all_lines_output[idx_line_state_plan + i])
            i += 1

        return plan

    except ValueError:
        return None


def extract_total_runtime_from_output(output_command: str) -> float:
    """
    Extract total runtime from the output of command line. If the total runtime is not found, return 0
    """

    all_lines_output = output_command.splitlines()

    line_total_runtime = [
        line for line in all_lines_output if "seconds total time" in line]

    if (len(line_total_runtime) == 0):
        logging.error(
            "Failed to find line containing the total runtime in output of command")
        return 0

    line_total_runtime = line_total_runtime[0].strip()

    total_runtime = float(line_total_runtime[:line_total_runtime.index(' ')])

    return total_runtime


def launch_planner(planner: Planner, full_path_file_domain: str, full_path_file_problem: str) -> Tuple[List[str], float]:
    """
    Launch the planner specified and return the plan if found as well as the total runtime
    """

    if (planner == Planner.SAT):
        command = ["./gradlew",
                   "run",
                   "--args",
                   "{domain_file} {problem_file}".format(
                       domain_file=full_path_file_domain, problem_file=full_path_file_problem)
                   ]
    elif (planner == Planner.HSP):
        command = ["java",
                   "-cp",
                   PATH_PDDL4J_LIB,
                   PATH_CLASS_HSP_IN_PDDL4J,
                   full_path_file_domain,
                   full_path_file_problem]
    else:
        logging.error("Incorrect planner provided")
        return (None, None)

    output = subprocess.run(
        command, check=True, stdout=subprocess.PIPE, universal_newlines=True)

    plan = extract_plan_from_output(output_command=output.stdout)
    total_runtime = extract_total_runtime_from_output(
        output_command=output.stdout)

    return (plan, total_runtime)


def check_plan_validity(full_path_file_domain: str, full_path_file_problem: str, full_path_file_plan: str) -> Boolean:
    """
    Check if a plan is valid using the VAL library (see https://github.com/KCL-Planning/VAL)
    """

    command_check_plan = [
        "./{val_binary}".format(val_binary=PATH_VAL_LIB),
        full_path_file_domain,
        full_path_file_problem,
        full_path_file_plan
    ]

    output = subprocess.run(
        command_check_plan, check=True, stdout=subprocess.PIPE, universal_newlines=True)

    if ("Plan valid" in output.stdout):
        return True
    else:
        return False


if __name__ == '__main__':

    # Initialize logging
    logging.basicConfig(level=logging.DEBUG)

    for path_benchmark in PATH_BENCHMARKS:
        logging.info(
            "Test benchmark {benchmark_name}".format(benchmark_name=path_benchmark))

        # Load all the problems
        files_in_benchmark = sorted(os.listdir(path_benchmark))

        if ("domain.pddl" not in files_in_benchmark):
            logging.error(
                "Domain file does not exist for benchmark path: {benchmark_path}".format(benchmark_path=path_benchmark))
            continue

        logging.info("Domain file found for benchmark path: {benchmark_path}".format(
            benchmark_path=path_benchmark))

        full_path_benchmark = os.path.abspath(path_benchmark)

        full_path_file_domain = os.path.join(
            full_path_benchmark, "domain.pddl")

        files_in_benchmark.remove("domain.pddl")

        for problem_file in files_in_benchmark:

            full_path_file_problem = os.path.join(
                full_path_benchmark, problem_file)

            logging.info("For problem: {full_path_file_problem}".format(
                         full_path_file_problem=full_path_file_problem))

            logging.info("Launch SAT planner")
            plan_sat, total_run_time_sat = launch_planner(planner=Planner.SAT,
                                                          full_path_file_domain=full_path_file_domain,
                                                          full_path_file_problem=full_path_file_problem)

            if (CHECK_SAT_PLAN_VALIDITY):
                # We need to write the plan into a file to be able to check the plan validity with VAL
                plan_file_name = "tmp_plan_{}".format(problem_file)
                full_path_file_plan = os.path.join(
                    full_path_benchmark, plan_file_name)
                with open(full_path_file_plan, 'w') as f:
                    f.writelines(plan_sat)

                plan_is_valid = check_plan_validity(full_path_file_domain=full_path_file_domain,
                                                    full_path_file_problem=full_path_file_problem,
                                                    full_path_file_plan=full_path_file_plan)

                # Delete the file
                os.remove(os.path.join(full_path_benchmark, plan_file_name))

                print("SAT plan is valid: {}".format(plan_is_valid))

            # logging.info("Launch HSP planner")
            # launch_planner(Planner.HSP, full_path_file_domain=full_path_file_domain,
            #                full_path_file_problem=full_path_file_problem)
            exit(0)
