package misioneros;

import aima.core.search.framework.GoalTest;

public class MisionerosGoalTest implements GoalTest{

EstadoMisioneros goal = new EstadoMisioneros(0, 0, false);
	
	public boolean isGoalState(Object state){
		
		EstadoMisioneros board = (EstadoMisioneros) state;
		return board.equals(goal);
	}
}


