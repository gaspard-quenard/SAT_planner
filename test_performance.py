import matplotlib.pyplot as plt
import numpy as np
import logging
import os
import subprocess

PATH_BENCHMARKS = ["benchmarks/ipc1/gripper"]  # , "benchmarks/ipc1/logistics",
# "benchmarks/ipc2/blocksworld", "benchmarks/ipc3/depot"]
PATH_OUTPUT = ""

if __name__ == '__main__':

    # Initialize logging
    logging.basicConfig(level=logging.DEBUG)

    for path_benchmark in PATH_BENCHMARKS:
        logging.info(
            "Test benchmark {benchmark_name}".format(benchmark_name=path_benchmark))

        # Load all the problems
        files_in_benchmark = os.listdir(path_benchmark)

        if ("domain.pddl" not in files_in_benchmark):
            logging.error(
                "Domain file does not exist for benchmark path: {benchmark_path}".format(benchmark_path=path_benchmark))
            continue

        logging.info("Domain file found for benchmark path: {benchmark_path}".format(
            benchmark_path=path_benchmark))

        full_path_benchmark = os.path.abspath(path_benchmark)

        files_in_benchmark.remove("domain.pddl")

        for problem_file in files_in_benchmark:
            # Launch gradlew run
            command = ["./gradlew", "run", "--args=\"{domain_file} {problem_file}\"".format(domain_file=os.path.join(
                full_path_benchmark, "domain.pddl"), problem_file=os.path.join(full_path_benchmark, problem_file))]

            print(command)

            output = subprocess.run(
                command, check=True, stdout=subprocess.PIPE, universal_newlines=True)

            exit(0)
