package coches;

import aima.core.search.framework.GoalTest;

public class CochesGoalTest implements GoalTest{

	
	public boolean isGoalState(Object state){
		
		
		return ((EstadoCoches) state).getCoches()[0].getA().equals(((EstadoCoches) state).getSalida()) || ((EstadoCoches) state).getCoches()[0].getB().equals(((EstadoCoches) state).getSalida());
	}
}