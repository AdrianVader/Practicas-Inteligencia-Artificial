package misioneros;

import aima.core.search.framework.ActionsFunction;
import aima.core.search.framework.ResultFunction;

public class MisionerosFunctionFactory {

	private static ActionsFunction _actionsFunction = null;
	private static ResultFunction _resultFunction = null;
	
	public static ActionsFunction getActionsFunction(){
		if(_actionsFunction == null)
			_actionsFunction = new MisionerosActionsFunction();
		return _actionsFunction;
	}
	
	public static ResultFunction getResultFunction(){
		if(_resultFunction == null)
			_resultFunction = new MisionerosResultFunction();
		return _resultFunction;
	}
}
