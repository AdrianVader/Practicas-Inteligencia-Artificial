package misioneros;

import aima.core.search.framework.HeuristicFunction;

public class MismoNumHeuristicFunction implements HeuristicFunction{

	@Override
	public double h(Object state) {
		EstadoMisioneros estado = (EstadoMisioneros) state;
		if(estado.getNumCanibales() == estado.getNumMisioneros()){
			if(estado.getNumCanibales() == 0)
				return 0;
			else if(estado.getNumCanibales() == 1)
				return 1;
			else if(estado.getNumCanibales() == 2)
				return 2;
			else if(estado.getNumCanibales() == 3)
				return 3;
		}
		return 6;
	}

}