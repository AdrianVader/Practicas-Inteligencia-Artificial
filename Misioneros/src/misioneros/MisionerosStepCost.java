package misioneros;

import aima.core.agent.Action;
import aima.core.search.framework.StepCostFunction;

public class MisionerosStepCost implements StepCostFunction{

	@Override
	public double c(Object from, Action a, Object to) {

		return 1; // El coste de todos los operadores (correctos y aplicables) 1.
	}

}
