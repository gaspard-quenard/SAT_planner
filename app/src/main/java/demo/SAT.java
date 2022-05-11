package demo;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.InvalidPathException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.sat4j.core.Vec;
import org.sat4j.core.VecInt;
import org.sat4j.minisat.SolverFactory;
import org.sat4j.specs.ContradictionException;
import org.sat4j.specs.IProblem;
import org.sat4j.specs.ISolver;
import org.sat4j.specs.IVecInt;
import org.sat4j.specs.TimeoutException;

import fr.uga.pddl4j.parser.ParsedProblem;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.plan.SequentialPlan;
import fr.uga.pddl4j.planners.AbstractPlanner;
import fr.uga.pddl4j.problem.ADLProblem;
import fr.uga.pddl4j.problem.Fluent;
import fr.uga.pddl4j.problem.operator.Action;
import fr.uga.pddl4j.util.BitVector;
import picocli.CommandLine;

/**
 * This class implements a SAT solver.
 *
 *
 * <p>
 * The command line syntax to launch the planner is as follow:
 * </p>
 *
 * <pre>
 * {@code
 * FF [-hV] [-l=<logLevel>] [-t=<timeout>] [-o=<writePlanTo>] <domain>
 *             <problem>
 *
 * Description:
 *
 * Solves a specified planning problem by encoding it into its CNF form and 
 * launching a solver SAT (taken from the library sat4j) on the CNF encoding 
 * generated
 *
 * Parameters:
 *       <domain>              The domain file.
 *       <problem>             The problem file.
 *
 * Options:
 *   -l, --log=<logLevel>      Set the level of trace: ALL, DEBUG, INFO, ERROR,
 *                               FATAL, OFF, TRACE (preset INFO).
 *   -t, --timeout=<timeout>   Set the time out of the planner in seconds (
 *                               preset 600s).
 *   -o, --write-plan-to=<outputFullPath>  If a plan is found write the plan to the file path provided
 *   -h, --help                Show this help message and exit.
 *   -V, --version             Print version information and exit.
 *  }
 * </pre>
 *
 * <p>
 * Command line example:
 * </p>
 * 
 * <pre>
 * {@code
 *    ./gradlew run --args="<domain> <problem>"
 * }
 * </pre>
 *
 * @author Gaspard Quenard
 * @version 1.0 - 10.05.2022
 *
 */
@CommandLine.Command(name = "SAT", version = "SAT 1.0", description = "Solves a specified planning problem using a SAT solver.", sortOptions = false, mixinStandardHelpOptions = true, headerHeading = "Usage:%n", synopsisHeading = "%n", descriptionHeading = "%nDescription:%n%n", parameterListHeading = "%nParameters:%n", optionListHeading = "%nOptions:%n")
public class SAT extends AbstractPlanner<ADLProblem> {

    /**
     * The class logger.
     */
    private static final Logger LOGGER = LogManager.getLogger(SAT.class.getName());

    /**
     * Full path of file to store plan found.
     */
    private String outputFullFileName = null;

    /**
     * Instantiates the planning problem from a parsed problem.
     *
     * @param problem the problem to instantiate.
     * @return the instantiated planning problem or null if the problem cannot be
     *         instantiated.
     */
    @Override
    public ADLProblem instantiate(ParsedProblem problem) {
        LOGGER.info("Instantiate ADL problem");
        final ADLProblem pb = new ADLProblem(problem);
        pb.instantiate();
        return pb;
    }

    /**
     * Command line option to set the full path of the file to store the plan found.
     * 
     * @param outputFullPathFile Full path of the file to store the plan found
     */
    @CommandLine.Option(names = { "-o",
            "--write-plan-to" }, paramLabel = "<outputFullPathFile>", description = "If a plan is found write the plan to the file path provided")
    public void setOutputFullPathFile(final String outputFullPathFile) {
        try {
            Paths.get(outputFullPathFile);
        } catch (InvalidPathException | NullPointerException ex) {
            throw new IllegalArgumentException("Incorrect path provided");
        }
        this.outputFullFileName = outputFullPathFile;
    }

    /**
     * Write a plan to the full path specified by the variable outputFullFileName
     * which can be set with the command line option: --write-plan-to.
     *
     * @param plan Plan to write into file
     */
    private void writePlanToFile(String plan) {
        File file = new File(this.outputFullFileName);

        // Create the file to store the plan
        try {
            if (file.exists() && file.isFile()) {
                LOGGER.info("The file {} already exist. Delete it\n", this.outputFullFileName);
                file.delete();
            }
            file.createNewFile();

            // Write plan into the file
            FileWriter writer = new FileWriter(file);
            writer.write(plan);
            writer.close();
        } catch (IOException e) {
            LOGGER.error("Failed to write plan into file {}\n", this.outputFullFileName);
            e.printStackTrace();
        }
    }

    /**
     * Display a fluent in easily readable format
     * (for example: at r1 l1).
     * 
     * @param f       The fluent to display in easily readable format
     * @param problem The problem to solve
     */
    private void prettyPrintFluent(Fluent f, ADLProblem problem) {
        StringBuilder fluentToDisplay = new StringBuilder();

        // Add the fluent name (e.g "at" for the fluent at ?r - robot ?l - location)
        fluentToDisplay.append(problem.getPredicateSymbols().get(f.getSymbol()));

        // Then for each argument of this fluent, add the argument into the string
        for (int fluentArg : f.getArguments()) {
            fluentToDisplay.append(" " + problem.getConstantSymbols().get(fluentArg));
        }

        LOGGER.info("Fluent: {}\n", fluentToDisplay);
    }

    /**
     * Display an action in easily readable format
     * (for example: move r1 l1 l2).
     * 
     * @param a       The action to display in easily readable format
     * @param problem The problem to solve
     */
    public void prettyPrintAction(Action a, ADLProblem problem) {
        StringBuilder actionToDisplay = new StringBuilder();

        // Add the action name (e.g "move" for the action move r1 l1 l2)
        actionToDisplay.append(a.getName());

        // Then for each argument of this action, add the argument into the string
        for (int actionArg : a.getInstantiations()) {
            actionToDisplay.append(" " + problem.getConstantSymbols().get(actionArg));
        }

        LOGGER.info("Action: {}\n", actionToDisplay);
    }

    /**
     * Get the fluent unique ID for the time step specified. To encode a problem as
     * a CNF formula, there must be an unique ID for each state
     * and each action at each time step.
     * The encodage of the unique ID for a state or an action is as follow:
     * <ul>
     * <li>1 -> idx of fluent 0 at time step 0</li>
     * <li>2 -> idx of fluent 1 at time step 0</li>
     * <li>...</li>
     * <li>N + 1-> idx of fluent N at time step 0</li>
     * <li>N + 2-> idx of action 0 at time step 0</li>
     * <li>...</li>
     * <li>N + M + 1 -> idx of action M at time step 0</li>
     * <li>N + M + 2 -> idx of fluent 0 at time step 1</li>
     * <li>...</li>
     * <li>(N + M) * n + 1-> idx of action M at time step n</li>
     * </ul>
     * 
     * @param problem  The problem to solve
     * @param state    The state to find the unique ID
     * @param timeStep The time step of the fluent
     * @return The unique ID of the fluent (i.e unique ID of the state at the given
     *         time step)
     */
    private int getFluentUniqueIDforTimeStep(ADLProblem problem, Fluent state, int timeStep) {
        int idxState = problem.getFluents().indexOf(state);
        return (problem.getFluents().size() + problem.getActions().size()) * timeStep + 1 + idxState;
    }

    /**
     * Get the action unique ID for the time step specified. To encode a problem as
     * a CNF formula, there must be an unique ID for each state
     * and each action at each time step.
     * The encodage of the unique ID for a state or an action is as follow:
     * <ul>
     * <li>1 -> idx of fluent 0 at time step 0</li>
     * <li>2 -> idx of fluent 1 at time step 0</li>
     * <li>...</li>
     * <li>N + 1-> idx of fluent N at time step 0</li>
     * <li>N + 2-> idx of action 0 at time step 0</li>
     * <li>...</li>
     * <li>N + M + 1 -> idx of action M at time step 0</li>
     * <li>N + M + 2 -> idx of fluent 0 at time step 1</li>
     * <li>...</li>
     * <li>(N + M) * n + 1-> idx of action M at time step n</li>
     * </ul>
     * 
     * @param problem  The problem to solve
     * @param action   The action to find the unique ID
     * @param timeStep The time step of the action
     * @return The unique ID of the action at the given time step
     */
    private int getActionUniqueIDforTimeStep(ADLProblem problem, Action action, int timeStep) {
        int idxAction = problem.getActions().indexOf(action);
        return (problem.getFluents().size() + problem.getActions().size()) * timeStep + 1 + problem.getFluents().size()
                + idxAction;
    }

    /**
     * Given an unique ID (each state and each action are given an unique ID for
     * each
     * time step of the problem to allow the encoding of the problem into a CNF
     * formula), find the action linked to this ID.
     * 
     * @param problem        The problem to solve
     * @param actionUniqueID Unique ID of an action
     * @return The action object linked to this ID if exist, else null
     */
    private Action getActionWithIdx(ADLProblem problem, int actionUniqueID) {

        if (actionUniqueID <= 0) {
            return null;
        }

        int idx = (actionUniqueID - 1) % (problem.getFluents().size() + problem.getActions().size());

        if (idx >= problem.getFluents().size()) {
            return problem.getActions().get(idx - problem.getFluents().size());
        } else {
            return null;
        }
    }

    /**
     * Encode the initial state as a CNF formula in dimacs format.
     * 
     * @param problem  The problem to solve
     * @param planSize Size of the plan
     * @return A vector of set (VecInt) of litterals in the Dimacs format
     */
    private Vec<IVecInt> encodeInitialState(final ADLProblem problem, int planSize) {

        Vec<IVecInt> clausesInitState = new Vec<IVecInt>();

        // Get all the fluent at the initial state
        BitVector initStatePosFluents = problem.getInitialState().getPositiveFluents();

        HashSet<Integer> fluentsNotInInitState = new HashSet<Integer>();
        for (int i = 0; i < problem.getFluents().size(); i++) {
            fluentsNotInInitState.add(i);
        }

        for (int p = initStatePosFluents.nextSetBit(0); p >= 0; p = initStatePosFluents.nextSetBit(p + 1)) {
            // Some debugging infos
            Fluent f = problem.getFluents().get(p);
            prettyPrintFluent(f, problem);

            fluentsNotInInitState.remove(p);

            // Add the fluent into the clauseInitState
            int idxFluent = getFluentUniqueIDforTimeStep(problem, f, 0);
            VecInt clause = new VecInt(new int[] { idxFluent });
            clausesInitState.push(clause);

            initStatePosFluents.set(p);
        }

        for (Integer stateNotInInitState : fluentsNotInInitState) {
            VecInt clause = new VecInt(new int[] { -(stateNotInInitState + 1) });
            clausesInitState.push(clause);
        }

        LOGGER.debug("Clause init state: {}\n", clausesInitState);

        return clausesInitState;
    }

    /**
     * Encode the final state as a CNF formula in dimacs format.
     * 
     * @param problem  The problem to solve
     * @param planSize Size of the plan
     * @return A vector of set (VecInt) of litterals in the Dimacs format
     */
    private Vec<IVecInt> encodeFinalState(final ADLProblem problem, int planSize) {

        Vec<IVecInt> clausesGoalState = new Vec<IVecInt>();

        // Get all the fluents at the goal state
        BitVector goalPosFluents = problem.getGoal().getPositiveFluents();

        for (int p = goalPosFluents.nextSetBit(0); p >= 0; p = goalPosFluents.nextSetBit(p + 1)) {
            // Some debugging infos
            Fluent f = problem.getFluents().get((int) p);
            prettyPrintFluent(f, problem);

            // Add the fluent into the clauseGoalState
            int idxFluent = getFluentUniqueIDforTimeStep(problem, f, planSize);
            VecInt clause = new VecInt(new int[] { idxFluent });
            clausesGoalState.push(clause);

            goalPosFluents.set(p);
        }

        LOGGER.debug("Clause goal state: {}\n", clausesGoalState);

        return clausesGoalState;
    }

    /**
     * Encode the action as a CNF formula in dimacs format.
     * 
     * @param problem  The problem to solve
     * @param planSize Size of the plan
     * @return A vector of set (VecInt) of litterals in the Dimacs format
     */
    private Vec<IVecInt> encodeActions(final ADLProblem problem, int planSize) {

        Vec<IVecInt> clausesActions = new Vec<IVecInt>();

        Fluent f;

        // TODO NOT OPTIMAL AT ALL, WE HAVE TO FIND AGAIN THE PRECONDITIONS AND EFFECT
        // OF THE
        // ACTION AT EACH TIME STEPS HERE...
        for (int timeStep = 0; timeStep < planSize; timeStep++) {
            for (Action action : problem.getActions()) {

                /*
                 * For each action at each time step, we have: a_i -> (^p for p in
                 * precondition__a_i) ^ (^e+ for e+ in effect+__a_i+1) ^ (^e- for e- in
                 * effect-__a_i+1)
                 */
                int actionUniqueIDforTimeStep = getActionUniqueIDforTimeStep(problem, action, timeStep); // Gives a_i

                prettyPrintAction(action, problem);

                LOGGER.info("Precondition + action: \n");

                // Get the states preconditions
                BitVector precondPos = action.getPrecondition().getPositiveFluents();
                for (int p = precondPos.nextSetBit(0); p >= 0; p = precondPos.nextSetBit(p + 1)) {
                    f = problem.getFluents().get(p);
                    prettyPrintFluent(f, problem);

                    // Add the fluent
                    int fluentUniqueIDforTimeStep = getFluentUniqueIDforTimeStep(problem, f, timeStep);
                    VecInt clause = new VecInt(new int[] { -actionUniqueIDforTimeStep, fluentUniqueIDforTimeStep });
                    clausesActions.push(clause);
                    precondPos.set(p);
                }

                LOGGER.info("Precondition - action: \n");
                BitVector precondNeg = action.getPrecondition().getNegativeFluents();
                for (int p = precondNeg.nextSetBit(0); p >= 0; p = precondNeg.nextSetBit(p + 1)) {
                    // Some debugging infos
                    f = problem.getFluents().get(p);
                    prettyPrintFluent(f, problem);

                    // Add the fluent
                    int idxFluent = getFluentUniqueIDforTimeStep(problem, f, timeStep);
                    VecInt clause = new VecInt(new int[] { -actionUniqueIDforTimeStep, -idxFluent });
                    clausesActions.push(clause);
                    precondNeg.set(p);
                }

                LOGGER.info("Effect + action: \n");
                BitVector effectPos = action.getUnconditionalEffect().getPositiveFluents();
                for (int p = effectPos.nextSetBit(0); p >= 0; p = effectPos.nextSetBit(p + 1)) {
                    // Some debugging infos
                    f = problem.getFluents().get(p);
                    prettyPrintFluent(f, problem);

                    // Add the fluent
                    int idxFluent = getFluentUniqueIDforTimeStep(problem, f, timeStep + 1);
                    VecInt clause = new VecInt(new int[] { -actionUniqueIDforTimeStep, idxFluent });
                    clausesActions.push(clause);

                    effectPos.set(p);
                }

                LOGGER.info("Effect - action: \n");
                BitVector effectNeg = action.getUnconditionalEffect().getNegativeFluents();
                for (int p = effectNeg.nextSetBit(0); p >= 0; p = effectNeg.nextSetBit(p + 1)) {
                    // Some debugging infos
                    f = problem.getFluents().get(p);
                    prettyPrintFluent(f, problem);

                    // Add the fluent
                    int idxFluent = getFluentUniqueIDforTimeStep(problem, f, timeStep + 1);
                    VecInt clause = new VecInt(new int[] { -actionUniqueIDforTimeStep, -idxFluent });
                    clausesActions.push(clause);

                    effectNeg.set(p);
                }
                LOGGER.info("\n");

            }
        }

        LOGGER.debug("Clauses action: {}\n", clausesActions);

        return clausesActions;
    }

    /**
     * Encode the explanatory frame axioms as a CNF formula in dimacs format.
     * 
     * @param problem  The problem to solve
     * @param planSize Size of the plan
     * @return A vector of set (VecInt) of litterals in the Dimacs format
     */
    private Vec<IVecInt> encodeExplanatoryFrameAxioms(final ADLProblem problem, int planSize) {

        Vec<IVecInt> clausesExplanatoryFrameAxioms = new Vec<IVecInt>();

        // For each fluent, initialize a list which will contains all the actions that
        // have this fluent as positive effects
        ArrayList<Action>[] positiveEffectOnFluent = (ArrayList<Action>[]) new ArrayList[problem.getFluents().size()];
        ArrayList<Action>[] negativeEffectOnFluent = (ArrayList<Action>[]) new ArrayList[problem.getFluents().size()];

        for (int i = 0; i < problem.getFluents().size(); i++) {
            positiveEffectOnFluent[i] = new ArrayList<Action>();
            negativeEffectOnFluent[i] = new ArrayList<Action>();
        }

        for (Action action : problem.getActions()) {
            BitVector effectPos = action.getUnconditionalEffect().getPositiveFluents();

            for (int p = effectPos.nextSetBit(0); p >= 0; p = effectPos.nextSetBit(p + 1)) {
                positiveEffectOnFluent[p].add(action);
                effectPos.set(p);
            }

            BitVector effectNeg = action.getUnconditionalEffect().getNegativeFluents();

            for (int p = effectNeg.nextSetBit(0); p >= 0; p = effectNeg.nextSetBit(p + 1)) {
                negativeEffectOnFluent[p].add(action);
                effectNeg.set(p);
            }
        }

        // Now, we can construct the explanatory frame axioms
        for (int stateIdx = 0; stateIdx < problem.getFluents().size(); stateIdx++) {
            for (int timeStep = 0; timeStep < planSize; timeStep++) {
                if (positiveEffectOnFluent[stateIdx].size() != 0) {
                    // Add this clause in CNF format

                    Fluent f = problem.getFluents().get(stateIdx);
                    VecInt clause = new VecInt();

                    prettyPrintFluent(f, problem);

                    // Add the fluent into the clause
                    clause.push(getFluentUniqueIDforTimeStep(problem, f, timeStep));
                    clause.push(-getFluentUniqueIDforTimeStep(problem, f, timeStep + 1));

                    // And add all the acttons which have this fluent has positive effect
                    for (Action action : positiveEffectOnFluent[stateIdx]) {
                        prettyPrintAction(action, problem);
                        clause.push(getActionUniqueIDforTimeStep(problem, action, timeStep));
                    }

                    clausesExplanatoryFrameAxioms.push(clause);
                }

                if (negativeEffectOnFluent[stateIdx].size() != 0) {
                    // Add this clause in CNF format

                    Fluent f = problem.getFluents().get(stateIdx);
                    VecInt clause = new VecInt();

                    // Add the fluent into the clause
                    clause.push(-getFluentUniqueIDforTimeStep(problem, f, timeStep));
                    clause.push(getFluentUniqueIDforTimeStep(problem, f, timeStep + 1));

                    // And add all the acttons which have this fluent has positive effect
                    for (Action action : negativeEffectOnFluent[stateIdx]) {
                        clause.push(getActionUniqueIDforTimeStep(problem, action, timeStep));
                    }

                    clausesExplanatoryFrameAxioms.push(clause);
                }
            }
        }

        LOGGER.debug("Explanatory frames: {}\n", clausesExplanatoryFrameAxioms);
        return clausesExplanatoryFrameAxioms;
    }

    /**
     * Encode the complete exclusion axioms as a CNF formula in dimacs format.
     * 
     * @param problem  The problem to solve
     * @param planSize Size of the plan
     * @return A vector of set (VecInt) of litterals in the Dimacs format
     */
    private Vec<IVecInt> encodeCompleteExclusionAxioms(final ADLProblem problem, int numberSteps) {

        Vec<IVecInt> clausesCompleteExclusionAxioms = new Vec<IVecInt>();

        LOGGER.info("NUMBER ACTIONS: {}", problem.getActions().size());

        for (int iteratorAction1 = 0; iteratorAction1 < problem.getActions().size(); iteratorAction1++) {
            // LOGGER.info("{}/{}\n", iteratorAction1, problem.getActions().size());
            for (int iteratorAction2 = 0; iteratorAction2 < iteratorAction1; iteratorAction2++) {

                Action action1 = problem.getActions().get(iteratorAction1);
                Action action2 = problem.getActions().get(iteratorAction2);

                int initAction1Idx = getActionUniqueIDforTimeStep(problem, action1, 0);
                int initAction2Idx = getActionUniqueIDforTimeStep(problem, action2, 0);

                int step = problem.getActions().size() + problem.getFluents().size();

                for (int timeStep = 0; timeStep < numberSteps; timeStep++) {

                    int decalage = step * timeStep;
                    VecInt clause = new VecInt(
                            new int[] { -(initAction1Idx + decalage), -(initAction2Idx + decalage) });
                    clausesCompleteExclusionAxioms.push(clause);
                }
            }
        }

        // LOGGER.info("Exclusion axioms: {}\n", clausesCompleteExclusionAxioms);
        return clausesCompleteExclusionAxioms;
    }

    /**
     * Use a SAT solver to check if a problem is satisfiable and to find a model.
     * Taken from
     * https://sat4j.gitbooks.io/case-studies/content/using-sat4j-as-a-java-library.html
     * 
     * @param allClauses Problem encoded as a CNF formula in Dimacs format
     * @param problem    The problem to solve
     * @return A list of integer describing the model (each integer correspond to
     *         the unique ID given for each action and each fluent at each time
     *         step, see
     *         {@link #getActionUniqueIDforTimeStep}
     *         and
     *         {@link #getFluentUniqueIDforTimeStep} for more information on how
     *         each ID is given to the actions and fluents)
     *         if the problem is
     *         satisfiable else null
     */
    private int[] solverSAT(Vec<IVecInt> allClauses, ADLProblem problem) {
        final int MAXVAR = 1000000;

        LOGGER.info("Number clauses: {}\n", allClauses.size());

        ISolver solver = SolverFactory.newDefault();

        // prepare the solver to accept MAXVAR variables. MANDATORY for MAXSAT solving
        solver.newVar(MAXVAR);
        solver.setExpectedNumberOfClauses(allClauses.size());

        try {
            solver.addAllClauses(allClauses);
        } catch (ContradictionException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        } // adapt Array to IVecInt

        LOGGER.info("Set verbose of solver to true\n");
        solver.setVerbose(true);

        // we are done. Working now on the IProblem interface
        IProblem problem = solver;
        try {
            if (problem.isSatisfiable()) {
                LOGGER.info("Is satisfiable !\n");
                // LOGGER.info("MODEL: {}\n", problem.model());
                return problem.model();

            } else {
                LOGGER.error("Is not satisfiable\n");
                return null;
            }
        } catch (TimeoutException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null; //
        }
    }

    /**
     * Encode the problem as a CNF formula in dimacs format.
     * 
     * @param problem Problem to encode
     * @return A vector of set (VecInt) of litterals in the Dimacs format
     */
    private Vec<IVecInt> encodeProblemAsCNF(ADLProblem problem, int numberSteps) {
        LOGGER.info("Encode the inital state into clauses\n");
        Vec<IVecInt> clausesInitState = encodeInitialState(problem, numberSteps);
        LOGGER.info("Encode the final state into clauses\n");
        Vec<IVecInt> clausesGoalState = encodeFinalState(problem, numberSteps);
        LOGGER.info("Encode the actions into clauses\n");
        Vec<IVecInt> clausesActions = encodeActions(problem, numberSteps);
        LOGGER.info("Encode the explanatory frame axioms into clauses\n");
        Vec<IVecInt> clausesExplanatoryFrameAxioms = encodeExplanatoryFrameAxioms(problem, numberSteps);
        LOGGER.info("Encode complete excusion axiom into clauses\n");
        Vec<IVecInt> clausesCompleteExclusionAxioms = encodeCompleteExclusionAxioms(problem, numberSteps);

        // Merge all the clauses into a single vector
        Vec<IVecInt> allClauses = new Vec<IVecInt>(clausesInitState.size() + clausesGoalState.size()
                + clausesActions.size() + clausesExplanatoryFrameAxioms.size() + clausesCompleteExclusionAxioms.size());
        clausesInitState.copyTo(allClauses);
        clausesGoalState.copyTo(allClauses);
        clausesActions.copyTo(allClauses);
        clausesExplanatoryFrameAxioms.copyTo(allClauses);
        clausesCompleteExclusionAxioms.copyTo(allClauses);

        return allClauses;
    }

    /**
     * Construct the plan from the model given as parameter.
     * 
     * @param model Model of the problem
     * @return the plan construct from the model
     */
    private Plan constructPlanFromModel(int[] model, ADLProblem problem) {
        Plan plan = new SequentialPlan();
        int idxActionInPlan = 0;
        for (Integer idx : model) {
            Action a = getActionWithIdx(problem, idx);
            if (a != null) {
                LOGGER.info("{}  ", idx);
                prettyPrintAction(a, problem);
                plan.add(idxActionInPlan, a);
                idxActionInPlan++;
            }
        }
        return plan;
    }

    /**
     * Search a solution plan to a specific domain using a SAT solver.
     *
     * @param problem the problem to solve.
     * @return the plan found or null if no plan was found.
     */
    @Override
    public Plan solve(final ADLProblem problem) {

        // Print all the fluent of the problems to have a better understanding of it
        LOGGER.info("All fluents of the problem:\n");
        for (Fluent f : problem.getFluents()) {
            prettyPrintFluent(f, problem);
        }

        // Print all the actions of the problems to have a better understanding of it
        LOGGER.info("All actions of the problem:\n");
        for (Action a : problem.getActions()) {
            prettyPrintAction(a, problem);
        }

        LOGGER.info("\n\nFirst convert the problem into a bounding problem (i.e, define a max step)\n");
        int n = 6;
        LOGGER.info("Max step choosen: {}\n", n);

        // Encode the problem into its CNF form
        final long beginEncodeTime = System.currentTimeMillis();
        Vec<IVecInt> allClauses = encodeProblemAsCNF(problem, n);
        final long endEncodeTime = System.currentTimeMillis();
        this.getStatistics()
                .setTimeToEncode(this.getStatistics().getTimeToEncode() + (endEncodeTime - beginEncodeTime));

        // We have encoded the full problem into its CNF form, now, pass it to the
        // solver
        final long beginSolveTime = System.currentTimeMillis();
        LOGGER.info("Launch the solver !\n");
        int[] model = solverSAT(allClauses, problem);
        if (model == null) {
            LOGGER.error("Failed to find a model\n");
            return null;
        }

        // Construct the plan from the model
        Plan plan = constructPlanFromModel(model, problem);
        final long endSolveTime = System.currentTimeMillis();
        this.getStatistics().setTimeToSearch(endSolveTime - beginSolveTime);

        // If a plan is found and the option to write the plan to file is given by the
        // user, do it now
        if (outputFullFileName != null) {
            writePlanToFile(problem.toString(plan));
        }

        return plan;
    }

    /**
     * The main method of the <code>SAT</code> planner.
     *
     * @param args the arguments of the command line.
     */
    public static void main(String[] args) {

        try {
            final SAT planner = new SAT();
            CommandLine cmd = new CommandLine(planner);
            cmd.execute(args);
        } catch (IllegalArgumentException e) {
            LOGGER.fatal(e.getMessage());
        }
    }
}