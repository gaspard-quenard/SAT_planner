# SAT planner

## 1. Description

This library use planning as satisfiabily to solve a planning problem. To do that, the problem is first encoded into a CNF formula and then a SAT solver is launched on this formula to check if the problem is satisfiable and, if so, extract a model. The plan is then generated from the model. 

## 2. Dependencies

  * [Java JDK](https://adoptopenjdk.net/>) version 8 or higher.
  * [Gradle](https://gradle.org/>) to build the library.

## 3. How to run 

You can run run the class SAT with the command:

```bash
./gradlew run --args="<full_path_domain_file> <full_path_problem_file>"
```

To see all the available options, check the documentation

## 4 How to access the documentation?

All the documentations are contained in the `app/build/docs/javadoc` directory.

To generate the javadoc just type:

```bash
./gradlew javadoc
```

To open the documentation, open the file `index.html` with your navigator. 

## Check performance

This repository contains as well a python script to compare the performance of the SAT planner with an HSP planner. This script will launch the SAT planner and the HSP planner on the 20 first problems of the 4 benchmarks, and store the total number of seconds to run the planner and the size of the plan found into a csv file in the folder specified by the variable `PATH_OUTPUT` in the script. Once this is done, this script will generate as well figures to show thoses metrics. 

You can launch this script with the command:

```bash
python3 test_performance.py
```

| :warning: WARNING          |
|:---------------------------|
| This script can take multiple hours to complete ...      |
