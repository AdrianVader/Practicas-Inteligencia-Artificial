package coches;

import aima.core.agent.Action;
import aima.core.search.framework.StepCostFunction;

public class CochesStepCost implements StepCostFunction{

	@Override
	public double c(Object from, Action a, Object to) {

		return 1; // El coste de todos los operadores es 1, se desplazan los coches una unica casilla.
	}

}
