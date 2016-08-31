package misioneros;

import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import aima.core.agent.Action;
import aima.core.search.framework.GraphSearch;
import aima.core.search.framework.Problem;
import aima.core.search.framework.Search;
import aima.core.search.framework.SearchAgent;
import aima.core.search.framework.TreeSearch;
import aima.core.search.informed.AStarSearch;
import aima.core.search.informed.GreedyBestFirstSearch;
import aima.core.search.uninformed.BreadthFirstSearch;
import aima.core.search.uninformed.DepthFirstSearch;

public class MisionerosDemo {

	static EstadoMisioneros estadoInicial = new EstadoMisioneros();
	
	public static void main(String [] args){
		//no informadas
		System.out.println("\n----Busquedas no informadas----\n\n");
		misionerosBFSDemo();
		misionerosDepthFirstSearchDemo();
		
		//informadas
		System.out.println("\n----Busquedas informadas----\n\n");
		misionerosMasALaDerechaGreedyBestFirstSearchDemo();
		misionerosMismoNumGreedyBestFirstSearchDemo();
		misionerosMasALaDerechaAStarGraphSearchDemo();
		misionerosMasALaDerechaAStarTreeSearchDemo();
	}
	
	
	
	private static void misionerosBFSDemo(){
		System.out.println("\nMisioneros Demo Breadth First Search -->");
		try{
			//Crear un objeto Problem con la representación de estados y operadores
			Problem problem = new Problem(estadoInicial, MisionerosFunctionFactory.getActionsFunction(), MisionerosFunctionFactory.getResultFunction(), new MisionerosGoalTest());
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
	
	
	private static void misionerosDepthFirstSearchDemo() {
		System.out.println("\nMisioneros Demo Depth First Graph Search -->");
		try {
			Problem problem = new Problem(estadoInicial, MisionerosFunctionFactory.getActionsFunction(), MisionerosFunctionFactory.getResultFunction(), new MisionerosGoalTest());
			DepthFirstSearch search = new DepthFirstSearch(new GraphSearch());
			SearchAgent agent = new SearchAgent(problem, search);
			printActions(agent.getActions());
			printInstrumentation(agent.getInstrumentation());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void misionerosMasALaDerechaGreedyBestFirstSearchDemo() {
		System.out
				.println("\nMisioneros MasALaDerechaGreedyBestFirst Graph Search Demo (MasALaDerecha HeuristicFunction)-->");
		try {
			Problem problem = new Problem(estadoInicial, 
					MisionerosFunctionFactory.getActionsFunction(), 
					MisionerosFunctionFactory.getResultFunction(), 
					new MisionerosGoalTest());
			Search search = new GreedyBestFirstSearch(new GraphSearch(),
					new MasALaDerechaHeuristicFunction());
			SearchAgent agent = new SearchAgent(problem, search);
			printActions(agent.getActions());
			printInstrumentation(agent.getInstrumentation());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	private static void misionerosMismoNumGreedyBestFirstSearchDemo() {
		System.out
				.println("\nMisioneros MismoNumGreedyBestFirst Graph Search Demo (MismoNum HeuristicFunction)-->");
		try {
			Problem problem = new Problem(estadoInicial, 
					MisionerosFunctionFactory.getActionsFunction(), 
					MisionerosFunctionFactory.getResultFunction(), 
					new MisionerosGoalTest());
			Search search = new GreedyBestFirstSearch(new GraphSearch(),
					new MismoNumHeuristicFunction());
			SearchAgent agent = new SearchAgent(problem, search);
			printActions(agent.getActions());
			printInstrumentation(agent.getInstrumentation());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	private static void misionerosMasALaDerechaAStarGraphSearchDemo() {
		System.out
				.println("\nMisioneros AStar Graph Search Demo (Mas A La Derecha Heuristic Function)-->");
		try {
			Problem problem = new Problem(estadoInicial, 
					MisionerosFunctionFactory.getActionsFunction(), 
					MisionerosFunctionFactory.getResultFunction(), 
					new MisionerosGoalTest());
			Search search = new AStarSearch(new GraphSearch(),
					new MasALaDerechaHeuristicFunction());
			SearchAgent agent = new SearchAgent(problem, search);
			printActions(agent.getActions());
			printInstrumentation(agent.getInstrumentation());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	private static void misionerosMasALaDerechaAStarTreeSearchDemo() {
		System.out
				.println("\nMisioneros AStar Tree Search Demo (Mas A La Derecha Heuristic Function)-->");
		try {
			Problem problem = new Problem(estadoInicial, 
					MisionerosFunctionFactory.getActionsFunction(), 
					MisionerosFunctionFactory.getResultFunction(), 
					new MisionerosGoalTest());
			Search search = new AStarSearch(new TreeSearch(),
					new MasALaDerechaHeuristicFunction());
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
