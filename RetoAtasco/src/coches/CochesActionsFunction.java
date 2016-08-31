package coches;

import java.util.LinkedHashSet;
import java.util.Set;

import aima.core.agent.Action;
import aima.core.search.framework.ActionsFunction;

public class CochesActionsFunction implements ActionsFunction{

	public Set<Action> actions (Object state){
		EstadoCoches estado = (EstadoCoches) state;	//lista de acciones posibles
		Set <Action> actions = new LinkedHashSet<Action>();	//si se cumplen las precondiciones y no se va a un estado de peligro entonces se añade la acción a la lista de acciones posibles
		
		if(estado.movimientoValido(EstadoCoches.c0f))
			actions.add(EstadoCoches.c0f);
		if(estado.movimientoValido(EstadoCoches.c0b))
			actions.add(EstadoCoches.c0b);
		
		if(estado.movimientoValido(EstadoCoches.c1f))
			actions.add(EstadoCoches.c1f);
		if(estado.movimientoValido(EstadoCoches.c1b))
			actions.add(EstadoCoches.c1b);
		
		if(estado.movimientoValido(EstadoCoches.c2f))
			actions.add(EstadoCoches.c2f);
		if(estado.movimientoValido(EstadoCoches.c2b))
			actions.add(EstadoCoches.c2b);
		
		if(estado.movimientoValido(EstadoCoches.c3f))
			actions.add(EstadoCoches.c3f);
		if(estado.movimientoValido(EstadoCoches.c3b))
			actions.add(EstadoCoches.c3b);
		
		if(estado.movimientoValido(EstadoCoches.c4f))
			actions.add(EstadoCoches.c4f);
		if(estado.movimientoValido(EstadoCoches.c4b))
			actions.add(EstadoCoches.c4b);
		
		if(estado.movimientoValido(EstadoCoches.c5f))
			actions.add(EstadoCoches.c5f);
		if(estado.movimientoValido(EstadoCoches.c5b))
			actions.add(EstadoCoches.c5b);
		
		if(estado.movimientoValido(EstadoCoches.c6f))
			actions.add(EstadoCoches.c6f);
		if(estado.movimientoValido(EstadoCoches.c6b))
			actions.add(EstadoCoches.c6b);
		
		if(estado.movimientoValido(EstadoCoches.c7f))
			actions.add(EstadoCoches.c7f);
		if(estado.movimientoValido(EstadoCoches.c7b))
			actions.add(EstadoCoches.c7b);
		
		
		return actions;
	}
}
