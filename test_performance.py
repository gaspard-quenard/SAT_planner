import matplotlib.pyplot as plt
import numpy as np
import logging
import os
import subprocess

PATH_BENCHMARKS = ["benchmarks/blocksworld"]  # , "benchmarks/ipc1/logistics",
# "benchmarks/ipc2/blocksworld", "benchmarks/ipc3/depot"]
PATH_OUTPUT = ""

PATH_PDDL4J_LIB = "app/libs/pddl4j-4.0.0.jar"
PATH_CLASS_HSP_IN_PDDL4J = "fr.uga.pddl4j.planners.statespace.HSP"


def launch_sat_planner(full_path_file_domain: str, full_path_file_problem: str) -> None:

    command = ["./gradlew",
               "run",
               "--args",
               "{domain_file} {problem_file}".format(
                   domain_file=full_path_file_domain, problem_file=full_path_file_problem)
               ]

    print(command)

    output = subprocess.run(
        command, check=True, stdout=subprocess.PIPE, universal_newlines=True)

    print(output.stdout)


def launch_hsp_planner(full_path_file_domain: str, full_path_file_problem: str) -> None:

    command = ["java",
               "-cp",
               PATH_PDDL4J_LIB,
               PATH_CLASS_HSP_IN_PDDL4J,
               full_path_file_domain,
               full_path_file_problem]

    print(command)

    output = subprocess.run(
        command, check=True, stdout=subprocess.PIPE, universal_newlines=True)

    print(output.stdout)


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

            launch_sat_planner(full_path_file_domain=full_path_file_domain,
                               full_path_file_problem=full_path_file_problem)
            exit(0)
