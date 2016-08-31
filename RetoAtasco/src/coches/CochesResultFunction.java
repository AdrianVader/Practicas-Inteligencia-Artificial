package coches;

import aima.core.agent.Action;
import aima.core.search.framework.ResultFunction;

public class CochesResultFunction implements ResultFunction{

	public Object result (Object s, Action a){
		
		EstadoCoches estado = (EstadoCoches) s;
		
		if(EstadoCoches.c0f.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC0f();
			return nuevoEstado;
		}
		else if(EstadoCoches.c0b.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC0b();
			return nuevoEstado;
		}
		
		if(EstadoCoches.c1f.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC1f();
			return nuevoEstado;
		}
		else if(EstadoCoches.c1b.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC1b();
			return nuevoEstado;
		}
		
		if(EstadoCoches.c2f.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC2f();
			return nuevoEstado;
		}
		else if(EstadoCoches.c2b.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC2b();
			return nuevoEstado;
		}
		
		if(EstadoCoches.c3f.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC3f();
			return nuevoEstado;
		}
		else if(EstadoCoches.c3b.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC3b();
			return nuevoEstado;
		}
		
		if(EstadoCoches.c4f.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC4f();
			return nuevoEstado;
		}
		else if(EstadoCoches.c4b.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC4b();
			return nuevoEstado;
		}
		
		if(EstadoCoches.c5f.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC5f();
			return nuevoEstado;
		}
		else if(EstadoCoches.c5b.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC5b();
			return nuevoEstado;
		}
		
		if(EstadoCoches.c6f.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC6f();
			return nuevoEstado;
		}
		else if(EstadoCoches.c6b.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC6b();
			return nuevoEstado;
		}
		
		if(EstadoCoches.c7f.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC7f();
			return nuevoEstado;
		}
		else if(EstadoCoches.c7b.equals(a)){
			EstadoCoches nuevoEstado = new EstadoCoches(estado);
			nuevoEstado.moveC7b();
			return nuevoEstado;
		}
		
		//The action is not understood or is a NoOp
		//The result will be the current state
		return s;
	}
}
