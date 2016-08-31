package misioneros;

import aima.core.search.framework.HeuristicFunction;

public class MasALaDerechaHeuristicFunction implements HeuristicFunction{

	@Override
	public double h(Object state) {
		EstadoMisioneros estado = (EstadoMisioneros) state;
		return estado.getNumCanibales() + estado.getNumMisioneros();
	}

}
