import matplotlib.pyplot as plt
import logging
import os
from typing import List, Tuple
import subprocess
from enum import Enum
import shlex
import time

PATH_BENCHMARKS = [
    "benchmarks/blocksworld",
    "benchmarks/logistics",
    "benchmarks/gripper",
    "benchmarks/depot"
]

PATH_OUTPUT = "stats_first_15_levels_with_imcrement.txt"

# Path to the binary of the pddl4j lib
PATH_PDDL4J_LIB = "app/libs/pddl4j-4.0.0.jar"
PATH_CLASS_HSP_IN_PDDL4J = "fr.uga.pddl4j.planners.statespace.HSP"

# Path to the binary of the library used to check if a plan is valid
PATH_VAL_LIB = "VAL/bin/Validate"

# Timeout of the planner in second
TIMEOUT_S = 1800

# Flag to check the plan validity for the planner SAT
CHECK_SAT_PLAN_VALIDITY = True


class Planner(Enum):
    HSP = 0,
    SAT = 1


def extract_plan_from_output(output_command: str) -> List[str]:
    """ Extract plan from the output of command line which launch a planner. If no plan is found, return None

    Args:
        output_command (str): stdout of the command line which launch a planner

    Returns:
        List[str]: The plan as a list of strings where each value of the list as index i correspond to the action of the plan at index i. Return None if no plan is found
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


def launch_planner(planner: Planner, full_path_file_domain: str, full_path_file_problem: str) -> Tuple[List[str], float]:
    """ Launch the planner specified and return the plan if found as well as the total runtime of the planner

    Args:
        planner (Planner): Planner to launch
        full_path_file_domain (str): Full path of the domain file
        full_path_file_problem (str): Full path of the problem file

    Returns:
        Tuple[List[str], float]: A tuple where the first argument contains the plan (or None if no plan is found), and the second argument contains the total runtime of the planner)
    """

    if (planner == Planner.SAT):
        command = "./gradlew run --args \"{domain_file} {problem_file}\"".format(
            domain_file=full_path_file_domain, problem_file=full_path_file_problem)

    elif (planner == Planner.HSP):
        command = "java -cp {pddl4_lib} {path_hsp_class} {domain_file} {problem_file}".format(
            pddl4_lib=PATH_PDDL4J_LIB, path_hsp_class=PATH_CLASS_HSP_IN_PDDL4J, domain_file=full_path_file_domain, problem_file=full_path_file_problem
        )

    else:
        logging.error("Incorrect planner provided")
        return (None, None)

    logging.info("Command: {command}".format(command=command))

    begin_time_command = time.time()
    try:
        output = subprocess.run(
            shlex.split(command), check=True, stdout=subprocess.PIPE, universal_newlines=True, timeout=TIMEOUT_S)
        end_time_command = time.time()
        plan = extract_plan_from_output(output_command=output.stdout)
    except subprocess.TimeoutExpired:
        end_time_command = time.time()
        plan = None

    # Keep only 3 decimals for the runtime
    total_runtime = round(end_time_command - begin_time_command, 3)

    return (plan, total_runtime)


def check_plan_validity(full_path_file_domain: str, full_path_file_problem: str, full_path_file_plan: str) -> bool:
    """Check if a plan is valid using the VAL library (see https://github.com/KCL-Planning/VAL)

    Args:
        full_path_file_domain (str): Full path of the domain file
        full_path_file_problem (str): Full path of the problem file
        full_path_file_plan (str): Full path of the plan file 

    Returns:
        bool: True if the plan is valid for this problem with this domain, False otherwise
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
    logging.basicConfig(
        format='%(asctime)s %(levelname)s:%(message)s', level=logging.DEBUG)

    for path_benchmark in PATH_BENCHMARKS:
        logging.info(
            "Test benchmark {benchmark_name}".format(benchmark_name=path_benchmark))

        # Load all the problems
        files_in_benchmark = sorted(os.listdir(path_benchmark))

        if ("domain.pddl" not in files_in_benchmark):
            logging.error(
                "Domain file does not exist for benchmark path: {benchmark_path}. Skip this benchmark".format(benchmark_path=path_benchmark))
            continue

        logging.info("Domain file found for benchmark path: {benchmark_path}".format(
            benchmark_path=path_benchmark))

        full_path_benchmark = os.path.abspath(path_benchmark)

        full_path_file_domain = os.path.join(
            full_path_benchmark, "domain.pddl")

        files_in_benchmark.remove("domain.pddl")

        # Keep only the first 15 level of each benchmark
        files_in_benchmark = files_in_benchmark[:15]

        for problem_file in files_in_benchmark:

            full_path_file_problem = os.path.join(
                full_path_benchmark, problem_file)

            logging.info("For problem: {full_path_file_problem}".format(
                         full_path_file_problem=full_path_file_problem))

            logging.info("Launch SAT planner")
            plan_sat, total_run_time_sat = launch_planner(planner=Planner.SAT,
                                                          full_path_file_domain=full_path_file_domain,
                                                          full_path_file_problem=full_path_file_problem)

            if (plan_sat == None):
                logging.error("Failed to find a plan for problem {problem_name} of benchmark {benchmark_name} with SAT planner".format(
                    problem_name=problem_file, benchmark_name=path_benchmark))
                plan_sat = []

            elif (CHECK_SAT_PLAN_VALIDITY):
                # Write the plan into a file to be able to check the plan validity with VAL
                plan_file_name = "tmp_plan_{}".format(problem_file)
                full_path_file_plan = os.path.join(
                    full_path_benchmark, plan_file_name)
                with open(full_path_file_plan, 'w') as f:
                    f.writelines(plan_sat)

                plan_is_valid = check_plan_validity(full_path_file_domain=full_path_file_domain,
                                                    full_path_file_problem=full_path_file_problem,
                                                    full_path_file_plan=full_path_file_plan)

                # Delete the plan file
                os.remove(os.path.join(full_path_benchmark, plan_file_name))

                if (not plan_is_valid):
                    logging.error("SAT Plan is invalid for problem {problem_name} of benchmark {benchmark_name}".format(
                        problem_name=problem_file, benchmark_name=path_benchmark))
                    exit(1)
                else:
                    logging.info("SAT Plan is valid for problem {problem_name} of benchmark {benchmark_name}".format(
                        problem_name=problem_file, benchmark_name=path_benchmark))

            logging.info("Size plan: {size_plan}, total time: {total_runtime} s".format(
                size_plan=len(plan_sat), total_runtime=total_run_time_sat))

            logging.info("Launch HSP planner")
            plan_hsp, total_run_time_hsp = launch_planner(Planner.HSP, full_path_file_domain=full_path_file_domain,
                                                          full_path_file_problem=full_path_file_problem)

            if (plan_hsp == None):
                logging.error("Failed to find a plan for problem {problem_name} of benchmark {benchmark_name} with HSP planner".format(
                    problem_name=problem_file, benchmark_name=path_benchmark))
                plan_hsp = []

            logging.info("Size plan: {size_plan}, total time: {total_runtime} s".format(
                size_plan=len(plan_hsp), total_runtime=total_run_time_hsp))

            with open(PATH_OUTPUT, 'a') as f:
                line_to_write = "{benchmark_name},{problem_name},{size_plan_sat},{total_run_time_sat},{size_plan_hsp},{total_run_time_hsp}\n".format(
                    benchmark_name=path_benchmark,
                    problem_name=problem_file,
                    size_plan_sat=len(plan_sat),
                    total_run_time_sat=total_run_time_sat,
                    size_plan_hsp=len(plan_hsp),
                    total_run_time_hsp=total_run_time_hsp
                )
                f.write(line_to_write)
