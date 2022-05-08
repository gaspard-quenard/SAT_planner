package demo;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import fr.uga.pddl4j.parser.ParsedProblem;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.plan.SequentialPlan;
import fr.uga.pddl4j.problem.State;
import fr.uga.pddl4j.util.BitVector;
import fr.uga.pddl4j.planners.AbstractPlanner;
import fr.uga.pddl4j.problem.ADLProblem;
import fr.uga.pddl4j.problem.Fluent;
import fr.uga.pddl4j.problem.operator.Action;

import picocli.CommandLine;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Vector;
import java.util.HashSet;

import org.sat4j.minisat.SolverFactory;
import org.sat4j.core.VecInt;
import org.sat4j.core.Vec;
import org.sat4j.specs.ISolver;
import org.sat4j.specs.IVec;
import org.sat4j.specs.IVecInt;
import org.sat4j.specs.TimeoutException;
import org.sat4j.specs.ContradictionException;
import org.sat4j.specs.IProblem;

/**
 * The class is an example. It shows how to create a simple A* search planner
 * able to
 * solve an ADL problem by choosing the heuristic to used and its weight.
 *
 * @author D. Pellier
 * @version 4.0 - 30.11.2021
 */
@CommandLine.Command(name = "ASP", version = "ASP 1.0", description = "Solves a specified planning problem using A* search strategy.", sortOptions = false, mixinStandardHelpOptions = true, headerHeading = "Usage:%n", synopsisHeading = "%n", descriptionHeading = "%nDescription:%n%n", parameterListHeading = "%nParameters:%n", optionListHeading = "%nOptions:%n")
public class ASP extends AbstractPlanner<ADLProblem> {

    /**
     * The class logger.
     */
    private static final Logger LOGGER = LogManager.getLogger(ASP.class.getName());

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
     * Print the name and arguments of a fluent
     * 
     * @param f       The fluent to print
     * @param problem THe problem to solve
     */
    public void prettyPrintFluent(Fluent f, ADLProblem problem) {
        StringBuilder prettyFluent = new StringBuilder();

        // Add the fluent name (e.g "at" for the fluent at ?r - robot ?l - location)
        prettyFluent.append(problem.getPredicateSymbols().get(f.getSymbol()));

        // Then for each argument for this fluent, add the argument into the string
        for (int symbol_integer : f.getArguments()) {
            prettyFluent.append(" " + problem.getConstantSymbols().get(symbol_integer));
        }

        LOGGER.info("Fluent: {}\n", prettyFluent);
    }

    /**
     * Print the name and arguments of a action
     * 
     * @param f       The action to print
     * @param problem THe problem to solve
     */
    public void prettyPrintAction(Action a, ADLProblem problem) {
        StringBuilder prettyAction = new StringBuilder();

        // Add the fluent name (e.g "at" for the fluent at ?r - robot ?l - location)
        prettyAction.append(a.getName());

        // Then for each argument for this fluent, add the argument into the string
        for (int symbol_integer : a.getInstantiations()) {
            prettyAction.append(" " + problem.getConstantSymbols().get(symbol_integer));
        }

        LOGGER.info("Action: {}\n", prettyAction);
    }

    /**
     * Get the ID of the fluents from a BitVector and indicate for each one, its
     * name, and its parameters
     * 
     * @param fluentsInBitVector Bit vector containing the ID of the fluents
     * @param problem            The problem to solve
     */
    public void debugPrintFluentFromBitVector(BitVector fluentsInBitVector, ADLProblem problem) {
        // First, get the fluent idx from the BitVector
        int idx_fluent = fluentsInBitVector.nextSetBit(0);
        Fluent f;
        if (idx_fluent != -1) {
            f = problem.getFluents().get(idx_fluent);
            prettyPrintFluent(f, problem);
            while (true) {

                if (++idx_fluent < 0) {
                    break;
                }
                if ((idx_fluent = fluentsInBitVector.nextSetBit(idx_fluent)) < 0) {
                    break;
                }
                int endOfRun = fluentsInBitVector.nextClearBit(idx_fluent);
                do {
                    f = problem.getFluents().get(idx_fluent);
                    prettyPrintFluent(f, problem);
                } while (++idx_fluent != endOfRun);
            }
        }
    }

    public List<Integer> convertBitArrayToListInteger(BitVector b) {

        List<Integer> valuesBitArray = new ArrayList<Integer>();

        int value = b.nextSetBit(0);
        if (value != -1) {
            valuesBitArray.add(value);
            while (true) {

                if (++value < 0) {
                    break;
                }
                if ((value = b.nextSetBit(value)) < 0) {
                    break;
                }
                int endOfRun = b.nextClearBit(value);
                do {
                    valuesBitArray.add(value);
                } while (++value != endOfRun);
            }
        }

        return valuesBitArray;
    }

    private int getFluentIdx(ADLProblem problem, Fluent state, int timeStep) {

        /*
         * We need to get a unique idx for each fluent and each action at each time step
         * The encodage will be as follow if there is N fluents and M actions with n
         * time steps:
         * 1 -> idx of fluent 0 at time step 0
         * 2 -> idx of fluent 1 at time step 0
         * ...
         * N + 1-> idx of fluent N at time step 0
         * N + 2-> idx of action 0 at time step 0
         * ...
         * N + M + 1 -> idx of action M at time step 0
         * N + M + 2 -> idx of fluent 0 at time step 1
         * ...
         * (N + M) * n + 1-> idx of action M at time step n
         */

        int idxState = problem.getFluents().indexOf(state);
        return (problem.getFluents().size() + problem.getActions().size()) * timeStep + 1 + idxState;
    }

    private int getActionIdx(ADLProblem problem, Action action, int timeStep) {

        /*
         * We need to get a unique idx for each fluent and each action at each time step
         * The encodage will be as follow if there is N fluents and M actions with n
         * time steps:
         * 1 -> idx of fluent 0 at time step 0
         * 2 -> idx of fluent 1 at time step 0
         * ...
         * N + 1-> idx of fluent N at time step 0
         * N + 2-> idx of action 0 at time step 0
         * ...
         * N + M + 1 -> idx of action M at time step 0
         * N + M + 2 -> idx of fluent 0 at time step 1
         * ...
         * (N + M) * n + 1-> idx of action M at time step n
         */

        int idxAction = problem.getActions().indexOf(action);
        return (problem.getFluents().size() + problem.getActions().size()) * timeStep + 1 + problem.getFluents().size()
                + idxAction;
    }

    private Action getActionWithIdx(ADLProblem problem, int idxToCheck) {

        if (idxToCheck <= 0) {
            return null;
        }

        int idx = (idxToCheck - 1) % (problem.getFluents().size() + problem.getActions().size());

        if (idx >= problem.getFluents().size()) {
            return problem.getActions().get(idx - problem.getFluents().size());
        } else {
            return null;
        }
    }

    private Vec<IVecInt> encodeInitialState(final ADLProblem problem, int numberSteps) {

        Vec<IVecInt> clausesInitState = new Vec<IVecInt>();

        // Get all the fluent at the initial state
        BitVector b = problem.getInitialState().getPositiveFluents();

        HashSet<Integer> allStatesIdx = new HashSet<Integer>();
        for (int i = 0; i < problem.getFluents().size(); i++) {
            allStatesIdx.add(i);
        }

        for (int idxState : convertBitArrayToListInteger(b)) {
            // Some debugging infos
            Fluent f = problem.getFluents().get(idxState);
            prettyPrintFluent(f, problem);

            allStatesIdx.remove(idxState);

            // Add the fluent into the clauseInitState
            int idxFluent = getFluentIdx(problem, f, 0);
            VecInt clause = new VecInt(new int[] { idxFluent });
            clausesInitState.push(clause);
        }

        for (Integer stateNotInInitState : allStatesIdx) {
            VecInt clause = new VecInt(new int[] { -(stateNotInInitState + 1) }); // + 1 because state begin from 1 and
                                                                                  // not from 0
            clausesInitState.push(clause);
        }

        LOGGER.debug("Clause init state: {}\n", clausesInitState);

        return clausesInitState;
    }

    private Vec<IVecInt> encodeFinalState(final ADLProblem problem, int numberSteps) {

        Vec<IVecInt> clausesGoalState = new Vec<IVecInt>();

        // Get all the fluents at the goal state
        BitVector b = problem.getGoal().getPositiveFluents();

        for (int idxState : convertBitArrayToListInteger(b)) {
            // Some debugging infos
            Fluent f = problem.getFluents().get((int) idxState);
            prettyPrintFluent(f, problem);

            // Add the fluent into the clauseInitState
            int idxFluent = getFluentIdx(problem, f, numberSteps);
            VecInt clause = new VecInt(new int[] { idxFluent });
            clausesGoalState.push(clause);
        }

        // Add all the fluents that are not in the goal state as negative fluent in
        // the clauseGoalState (TODO it is not optimize all all)
        // TODO ASK IF WE HAVE TO DO IT (NOT CLEAR)
        // int idxFluent;
        // for (Fluent fluent : problem.getFluents()) {
        // idxFluent = getFluentIdx(problem, fluent, numberSteps);
        // if (!clauseGoalState.contains(getFluentIdx(problem, fluent, numberSteps))) {
        // clauseGoalState.add(-idxFluent);
        // }
        // }

        LOGGER.debug("Clause goal state: {}\n", clausesGoalState);

        return clausesGoalState;
    }

    private Vec<IVecInt> encodeActions(final ADLProblem problem, int numberSteps) {

        Vec<IVecInt> clausesActions = new Vec<IVecInt>();

        BitVector b;
        Fluent f;

        // TODO NOT OPTIMAL AT ALL, WE HAVE TO FIND AGAIN THE PRECONDITIONS AND EFFECT
        // OF THE
        // ACTION AT EACH TIME STEPS HERE...
        for (int timeStep = 0; timeStep < numberSteps; timeStep++) {
            for (Action action : problem.getActions()) {

                /**
                 * For each action at each time step, we have: a_i -> (^p for p in
                 * precondition__a_i) ^ (^e+ for e+ in effect+__a_i+1) ^ (^e- for e- in
                 * effect-__a_i+1)
                 */
                int action_idx = getActionIdx(problem, action, timeStep); // Gives a_i

                prettyPrintAction(action, problem);

                LOGGER.info("Precondition + action: \n");

                // Get the states preconditions
                b = action.getPrecondition().getPositiveFluents();
                LOGGER.info("{}\n", b);
                // for (int p = b.nextSetBit(0); p >= 0; p = b.nextSetBit(p + 1)) {
                // b.set(p);
                // }
                for (int idxState : convertBitArrayToListInteger(b)) {
                    // Some debugging infos
                    f = problem.getFluents().get(idxState);
                    prettyPrintFluent(f, problem);

                    // Add the fluent
                    int idxFluent = getFluentIdx(problem, f, timeStep);
                    VecInt clause = new VecInt(new int[] { -action_idx, idxFluent });
                    clausesActions.push(clause);
                }

                LOGGER.info("Precondition - action: \n");
                b = action.getPrecondition().getNegativeFluents();
                for (int idxState : convertBitArrayToListInteger(b)) {
                    // Some debugging infos
                    f = problem.getFluents().get(idxState);
                    prettyPrintFluent(f, problem);

                    // Add the fluent
                    int idxFluent = getFluentIdx(problem, f, timeStep);
                    VecInt clause = new VecInt(new int[] { -action_idx, -idxFluent });
                    clausesActions.push(clause);
                }

                LOGGER.info("Effect + action: \n");
                b = action.getUnconditionalEffect().getPositiveFluents();
                for (int idxState : convertBitArrayToListInteger(b)) {
                    // Some debugging infos
                    f = problem.getFluents().get(idxState);
                    prettyPrintFluent(f, problem);

                    // Add the fluent
                    int idxFluent = getFluentIdx(problem, f, timeStep + 1);
                    VecInt clause = new VecInt(new int[] { -action_idx, idxFluent });
                    clausesActions.push(clause);
                }

                LOGGER.info("Effect - action: \n");
                b = action.getUnconditionalEffect().getNegativeFluents();
                for (int idxState : convertBitArrayToListInteger(b)) {
                    // Some debugging infos
                    f = problem.getFluents().get(idxState);
                    prettyPrintFluent(f, problem);

                    // Add the fluent
                    int idxFluent = getFluentIdx(problem, f, timeStep + 1);
                    VecInt clause = new VecInt(new int[] { -action_idx, -idxFluent });
                    clausesActions.push(clause);
                }
                LOGGER.info("\n");

            }
        }

        LOGGER.debug("Clauses action: {}\n", clausesActions);

        return clausesActions;
    }

    private Vec<IVecInt> encodeExplanatoryFrameAxioms(final ADLProblem problem, int numberSteps) {

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
            List<Integer> positiveEffectAction = convertBitArrayToListInteger(
                    action.getUnconditionalEffect().getPositiveFluents());
            for (Integer stateIdx : positiveEffectAction) {
                positiveEffectOnFluent[stateIdx].add(action);
            }
            List<Integer> negativeEffectAction = convertBitArrayToListInteger(
                    action.getUnconditionalEffect().getNegativeFluents());
            for (Integer stateIdx : negativeEffectAction) {
                negativeEffectOnFluent[stateIdx].add(action);
            }
        }

        // Now, we can construct the explanatory frame axioms
        for (int stateIdx = 0; stateIdx < problem.getFluents().size(); stateIdx++) {
            for (int timeStep = 0; timeStep < numberSteps; timeStep++) {
                if (positiveEffectOnFluent[stateIdx].size() != 0) {
                    // Add this clause in CNF format

                    Fluent f = problem.getFluents().get(stateIdx);
                    VecInt clause = new VecInt();

                    prettyPrintFluent(f, problem);

                    // Add the fluent into the clause
                    clause.push(getFluentIdx(problem, f, timeStep));
                    clause.push(-getFluentIdx(problem, f, timeStep + 1));

                    // And add all the acttons which have this fluent has positive effect
                    for (Action action : positiveEffectOnFluent[stateIdx]) {
                        prettyPrintAction(action, problem);
                        clause.push(getActionIdx(problem, action, timeStep));
                    }

                    clausesExplanatoryFrameAxioms.push(clause);
                }

                if (negativeEffectOnFluent[stateIdx].size() != 0) {
                    // Add this clause in CNF format

                    Fluent f = problem.getFluents().get(stateIdx);
                    VecInt clause = new VecInt();

                    // Add the fluent into the clause
                    clause.push(-getFluentIdx(problem, f, timeStep));
                    clause.push(getFluentIdx(problem, f, timeStep + 1));

                    // And add all the acttons which have this fluent has positive effect
                    for (Action action : negativeEffectOnFluent[stateIdx]) {
                        clause.push(getActionIdx(problem, action, timeStep));
                    }

                    clausesExplanatoryFrameAxioms.push(clause);
                }
            }
        }

        LOGGER.debug("Explanatory frames: {}\n", clausesExplanatoryFrameAxioms);
        return clausesExplanatoryFrameAxioms;
    }

    private Vec<IVecInt> encodeCompleteExclusionAxioms(final ADLProblem problem, int numberSteps) {

        Vec<IVecInt> clausesCompleteExclusionAxioms = new Vec<IVecInt>();

        LOGGER.info("NUMBER ACTIONS: {}", problem.getActions().size());

        for (int iteratorAction1 = 0; iteratorAction1 < problem.getActions().size(); iteratorAction1++) {
            // LOGGER.info("{}/{}\n", iteratorAction1, problem.getActions().size());
            for (int iteratorAction2 = 0; iteratorAction2 < iteratorAction1; iteratorAction2++) {

                Action action1 = problem.getActions().get(iteratorAction1);
                Action action2 = problem.getActions().get(iteratorAction2);

                int initAction1Idx = getActionIdx(problem, action1, 0);
                int initAction2Idx = getActionIdx(problem, action2, 0);

                int step = problem.getActions().size() + problem.getFluents().size();

                for (int timeStep = 0; timeStep < numberSteps; timeStep++) {
                    // int idxAction1 = getActionIdx(problem, action1, timeStep);
                    // int idxAction2 = getActionIdx(problem, action2, timeStep);
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
     * Taken from
     * https://sat4j.gitbooks.io/case-studies/content/using-sat4j-as-a-java-library.html
     */
    public int[] solverSAT(Vec<IVecInt> allClauses) {
        final int MAXVAR = 1000000;

        LOGGER.info("Number clauses: {}", allClauses.size());

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
            return null;
        }
    }

    /**
     * Search a solution plan to a specified domain and problem using A*.
     *
     * @param problem the problem to solve.
     * @return the plan found or null if no plan was found.
     */
    @Override
    public Plan solve(final ADLProblem problem) {
        LOGGER.info("In solver function\n");

        final long beginEncodeTime = System.currentTimeMillis();

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
        int n = 10;
        LOGGER.info("Max step choosen: {}\n", n);

        LOGGER.info("Encode the inital state into clauses\n");
        Vec<IVecInt> clausesInitState = encodeInitialState(problem, n);
        LOGGER.info("Encode the final state into clauses\n");
        Vec<IVecInt> clausesGoalState = encodeFinalState(problem, n);
        LOGGER.info("Encode the actions into clauses\n");
        Vec<IVecInt> clausesActions = encodeActions(problem, n);
        LOGGER.info("Encode the explanatory frame axioms into clauses\n");
        Vec<IVecInt> clausesExplanatoryFrameAxioms = encodeExplanatoryFrameAxioms(problem, n);
        LOGGER.info("Encode complete excusion axiom into clauses\n");
        Vec<IVecInt> clausesCompleteExclusionAxioms = encodeCompleteExclusionAxioms(problem, n);

        // Merge all the clauses into a single one
        Vec<IVecInt> allClauses = new Vec<IVecInt>();
        clausesInitState.copyTo(allClauses);
        clausesGoalState.copyTo(allClauses);
        clausesActions.copyTo(allClauses);
        clausesExplanatoryFrameAxioms.copyTo(allClauses);
        clausesCompleteExclusionAxioms.copyTo(allClauses);

        // LOGGER.info("ALL CLAUSES: {}\n", allClauses);

        final long endEncodeTime = System.currentTimeMillis();

        this.getStatistics()
                .setTimeToEncode(this.getStatistics().getTimeToEncode() + (endEncodeTime - beginEncodeTime));

        final long beginSolveTime = System.currentTimeMillis();

        // We have encoded the full problem into CNF type, now, pass it to the solver
        LOGGER.info("Launch the solver !\n");
        int[] model = solverSAT(allClauses);
        if (model != null) {
            LOGGER.info("Construct plan: \n");
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
            final long endSolveTime = System.currentTimeMillis();
            this.getStatistics().setTimeToSearch(endSolveTime - beginSolveTime);
            // LOGGER.info(problem.toString(plan));
            return plan;
        } else {
            return null;
        }
    }

    /**
     * The main method of the <code>ASP</code> planner.
     *
     * @param args the arguments of the command line.
     */
    public static void main(String[] args) {

        try {
            final ASP planner = new ASP();
            CommandLine cmd = new CommandLine(planner);
            cmd.execute(args);
        } catch (IllegalArgumentException e) {
            LOGGER.fatal(e.getMessage());
        }
    }
}