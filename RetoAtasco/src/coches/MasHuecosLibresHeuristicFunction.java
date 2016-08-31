package coches;

import aima.core.search.framework.HeuristicFunction;

public class MasHuecosLibresHeuristicFunction implements HeuristicFunction{

	@Override
	public double h(Object state) {
		EstadoCoches estado = (EstadoCoches) state;
		
		int huecos;
		
		if(estado.getCoches()[0].isHorizontal()){
			int fila = estado.getCoches()[0].getA().getY();
			huecos = estado.getColumnas() - (estado.getCoches()[0].getB().getX() - estado.getCoches()[0].getA().getX());

			for(int i = 1; i < estado.getCoches().length; i++){
				if(estado.getCoches()[i].getA().getY() <= fila && estado.getCoches()[i].getB().getY() >= fila){
					huecos--;
				}
			}
			
		}else{
			int columna = estado.getCoches()[0].getA().getX();
			huecos = estado.getFilas() - (estado.getCoches()[0].getB().getY() - estado.getCoches()[0].getA().getY());

			for(int i = 1; i < estado.getCoches().length; i++){
				if(estado.getCoches()[i].getA().getX() <= columna && estado.getCoches()[i].getB().getX() >= columna){
					huecos--;
				}
			}
			
		}
		
		return huecos;
	}
	
}