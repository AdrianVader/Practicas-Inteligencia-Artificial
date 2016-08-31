package coches;

import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import aima.core.agent.Action;
import aima.core.search.framework.GraphSearch;
import aima.core.search.framework.Problem;
import aima.core.search.framework.Search;
import aima.core.search.framework.SearchAgent;
import aima.core.search.informed.AStarSearch;
import aima.core.search.informed.GreedyBestFirstSearch;
import aima.core.search.uninformed.BreadthFirstSearch;
import aima.core.search.uninformed.DepthFirstSearch;

public class CochesDemo {

	static EstadoCoches estadoInicial = new EstadoCoches();
	
	public static void main(String [] args){
		
		//no informadas
		
		System.out.println("\n----Busquedas no informadas----\n\n");
		CochesBFSDemo();
		CochesDepthFirstSearchDemo();
		
		//informadas
		
		System.out.println("\n----Busquedas informadas----\n\n");
		CochesEspacioGreedyBestFirstMasHuecosSearchDemo();
		CochesEspacioGreedyBestFirstSearchEspacioDemo();
		CochesEspacioAStarGraphSearchDemo();
	}
	
	
	
	private static void CochesBFSDemo(){
		System.out.println("\nCoches Demo Breadth First Search -->");
		try{
			//Crear un objeto Problem con la representación de estados y operadores
			Problem problem = new Problem(estadoInicial, CochesFunctionFactory.getActionsFunction(), CochesFunctionFactory.getResultFunction(), new CochesGoalTest());
			//Como no hay función de coste en el constructor se usa el coste por defecto
			//Indicar el tipo de búsqueda
			Search search = new BreadthFirstSearch();	//Búsqueda en anchura
			//Crear un agente que realice la búsqueda sobre el problema
			SearchAgent agent = new SearchAgent(problem, search);
			//Escribir la solución encontrada (operadores aplicadosI e información sobre los recursos utilizados
			printActions(agent.getActions());
			printInstrumentation(agent.getInstrumentation());
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
	
	private static void CochesDepthFirstSearchDemo() {
		System.out.println("\nCochesDemo Depth First  Search -->");
		try {
			Problem problem = new Problem(estadoInicial, CochesFunctionFactory.getActionsFunction(), CochesFunctionFactory.getResultFunction(), new CochesGoalTest());
			DepthFirstSearch search = new DepthFirstSearch(new GraphSearch());
			SearchAgent agent = new SearchAgent(problem, search);
			printActions(agent.getActions());
			printInstrumentation(agent.getInstrumentation());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	private static void CochesEspacioGreedyBestFirstMasHuecosSearchDemo() {
		System.out
				.println("\nCochesEspacioGreedyBestFirstSearchDemo (MasHuecosLibresHeuristicFunction)-->");
		try {
			Problem problem = new Problem(estadoInicial, 
					CochesFunctionFactory.getActionsFunction(), 
					CochesFunctionFactory.getResultFunction(), 
					new CochesGoalTest());
			Search search = new GreedyBestFirstSearch(new GraphSearch(),
					new MasHuecosLibresHeuristicFunction());
			SearchAgent agent = new SearchAgent(problem, search);
			printActions(agent.getActions());
			printInstrumentation(agent.getInstrumentation());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	private static void CochesEspacioGreedyBestFirstSearchEspacioDemo() {
		System.out
				.println("\nCochesEspacioGreedyBestFirstSearchDemo (EspacioHeuristicFunction)-->");
		try {
			Problem problem = new Problem(estadoInicial, 
					CochesFunctionFactory.getActionsFunction(), 
					CochesFunctionFactory.getResultFunction(), 
					new CochesGoalTest());
			Search search = new GreedyBestFirstSearch(new GraphSearch(),
					new EspacioHeuristicFunction());
			SearchAgent agent = new SearchAgent(problem, search);
			printActions(agent.getActions());
			printInstrumentation(agent.getInstrumentation());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	private static void CochesEspacioAStarGraphSearchDemo() {
		System.out
				.println("\nCochesEspacioAStar Graph SearchDemo (EspacioHeuristicFunction)-->");
		try {
			Problem problem = new Problem(estadoInicial, 
					CochesFunctionFactory.getActionsFunction(), 
					CochesFunctionFactory.getResultFunction(), 
					new CochesGoalTest());
			Search search = new AStarSearch(new GraphSearch(),
					new EspacioHeuristicFunction());
			SearchAgent agent = new SearchAgent(problem, search);
			printActions(agent.getActions());
			printInstrumentation(agent.getInstrumentation());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
		
	
	
	private static void printInstrumentation(Properties properties) {
		Iterator<Object> keys = properties.keySet().iterator();
		while (keys.hasNext()) {
			String key = (String) keys.next();
			String property = properties.getProperty(key);
			System.out.println(key + " : " + property);
		}

	}

	private static void printActions(List<Action> actions) {
		for (int i = 0; i < actions.size(); i++) {
			String action = actions.get(i).toString();
			System.out.println(action);
		}
	}
	
}
