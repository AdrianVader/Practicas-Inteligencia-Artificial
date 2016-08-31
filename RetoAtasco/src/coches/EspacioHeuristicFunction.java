package coches;

import aima.core.search.framework.HeuristicFunction;

public class EspacioHeuristicFunction implements HeuristicFunction{

	@Override
	public double h(Object state) {
		EstadoCoches estado = (EstadoCoches) state;
		
		int suma = 0;
		
		if(estado.getSalida().getX() == 0){
			suma = estado.getCoches()[0].getA().getX();
		}
		else if(estado.getSalida().getX() == estado.getColumnas()-1){
			suma = estado.getColumnas() - estado.getCoches()[0].getB().getX();
		}
		else if(estado.getSalida().getY() == 0){
			suma = estado.getCoches()[0].getA().getY();
		}
		else if(estado.getSalida().getY() == estado.getFilas()-1){
			suma = estado.getFilas() - estado.getCoches()[0].getB().getY();
		}
		return suma;
	}

}
