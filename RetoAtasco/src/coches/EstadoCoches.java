package coches;

import aima.core.agent.Action;
import aima.core.agent.impl.DynamicAction;

public class EstadoCoches {

	//ESTADOS
	
	private Coche coches[];
	private int filas;
	private int columnas;
	private Pos salida;
	
	

	public EstadoCoches(){	
		
			this.coches = new Coche [8];
			this.filas = 6;
			this.columnas = 6;
			this.salida = new Pos(6, 3);
			
			this.coches[0] = new Coche(new Pos(3,3), new Pos(4,3));
			this.coches[1] = new Coche(new Pos(3,2), new Pos(4,2));
			this.coches[2] = new Coche(new Pos(3,4), new Pos(3,6));
			this.coches[3] = new Coche(new Pos(4,5), new Pos(4,6));
			this.coches[4] = new Coche(new Pos(5,1), new Pos(5,2));
			this.coches[5] = new Coche(new Pos(5,3), new Pos(5,4));
			this.coches[6] = new Coche(new Pos(5,5), new Pos(6,5));
			this.coches[7] = new Coche(new Pos(6,1), new Pos(6,3));
	}

	public EstadoCoches(EstadoCoches c){
		this.coches = new Coche [8];
		for(int i = 0; i < c.getCoches().length;i++){
			this.coches[i] = new Coche(new Pos(c.getCoches()[i].getA().getX(), c.getCoches()[i].getA().getY()), new Pos(c.getCoches()[i].getB().getX(), c.getCoches()[i].getB().getY()));
		}
		this.columnas = c.getColumnas();
		this.filas = c.getFilas();
		this.salida = c.getSalida();
	}

	public EstadoCoches(Coche c[], int col, int f, Pos exit){
		this.coches = c;
		this.columnas = col;
		this.filas = f;
		this.salida = exit;
	}

	//ACCIONES
	public static Action c0f = new DynamicAction("Move car 0 forward");
	public static Action c0b = new DynamicAction("Move car 0 back");
	
	public static Action c1f = new DynamicAction("Move car 1 forward");
	public static Action c1b = new DynamicAction("Move car 1 back");
	
	public static Action c2f = new DynamicAction("Move car 2 forward");
	public static Action c2b = new DynamicAction("Move car 2 back");
	
	public static Action c3f = new DynamicAction("Move car 3 forward");
	public static Action c3b = new DynamicAction("Move car 3 back");
	
	public static Action c4f = new DynamicAction("Move car 4 forward");
	public static Action c4b = new DynamicAction("Move car 4 back");
	
	public static Action c5f = new DynamicAction("Move car 5 forward");
	public static Action c5b = new DynamicAction("Move car 5 back");
	
	public static Action c6f = new DynamicAction("Move car 6 forward");
	public static Action c6b = new DynamicAction("Move car 6 back");
	
	public static Action c7f = new DynamicAction("Move car 7 forward");
	public static Action c7b = new DynamicAction("Move car 7 back");
	


	public void moveC0f(){
		if(this.coches[0].isHorizontal()){
			this.coches[0].getA().setX(this.coches[0].getA().getX() + 1);
			this.coches[0].getB().setX(this.coches[0].getB().getX() + 1);
		}
		else{
			this.coches[0].getA().setY(this.coches[0].getA().getY() + 1);
			this.coches[0].getB().setY(this.coches[0].getB().getY() + 1);
		}
	}
	public void moveC0b(){
		if(this.coches[0].isHorizontal()){
			this.coches[0].getA().setX(this.coches[0].getA().getX() - 1);
			this.coches[0].getB().setX(this.coches[0].getB().getX() - 1);
		}
		else{
			this.coches[0].getA().setY(this.coches[0].getA().getY() - 1);
			this.coches[0].getB().setY(this.coches[0].getB().getY() - 1);
		}
	}
	
	public void moveC1f(){
		if(this.coches[1].isHorizontal()){
			this.coches[1].getA().setX(this.coches[1].getA().getX() + 1);
			this.coches[1].getB().setX(this.coches[1].getB().getX() + 1);
		}
		else{
			this.coches[1].getA().setY(this.coches[1].getA().getY() + 1);
			this.coches[1].getB().setY(this.coches[1].getB().getY() + 1);
		}
	}
	public void moveC1b(){
		if(this.coches[1].isHorizontal()){
			this.coches[1].getA().setX(this.coches[1].getA().getX() - 1);
			this.coches[1].getB().setX(this.coches[1].getB().getX() - 1);
		}
		else{
			this.coches[1].getA().setY(this.coches[1].getA().getY() - 1);
			this.coches[1].getB().setY(this.coches[1].getB().getY() - 1);
		}
	}
	
	public void moveC2f(){
		if(this.coches[2].isHorizontal()){
			this.coches[2].getA().setX(this.coches[2].getA().getX() + 1);
			this.coches[2].getB().setX(this.coches[2].getB().getX() + 1);
		}
		else{
			this.coches[2].getA().setY(this.coches[2].getA().getY() + 1);
			this.coches[2].getB().setY(this.coches[2].getB().getY() + 1);
		}
	}
	public void moveC2b(){
		if(this.coches[2].isHorizontal()){
			this.coches[2].getA().setX(this.coches[2].getA().getX() - 1);
			this.coches[2].getB().setX(this.coches[2].getB().getX() - 1);
		}
		else{
			this.coches[2].getA().setY(this.coches[2].getA().getY() - 1);
			this.coches[2].getB().setY(this.coches[2].getB().getY() - 1);
		}
	}
	
	public void moveC3f(){
		if(this.coches[3].isHorizontal()){
			this.coches[3].getA().setX(this.coches[3].getA().getX() + 1);
			this.coches[3].getB().setX(this.coches[3].getB().getX() + 1);
		}
		else{
			this.coches[3].getA().setY(this.coches[3].getA().getY() + 1);
			this.coches[3].getB().setY(this.coches[3].getB().getY() + 1);
		}
	}
	public void moveC3b(){
		if(this.coches[3].isHorizontal()){
			this.coches[3].getA().setX(this.coches[3].getA().getX() - 1);
			this.coches[3].getB().setX(this.coches[3].getB().getX() - 1);
		}
		else{
			this.coches[3].getA().setY(this.coches[3].getA().getY() - 1);
			this.coches[3].getB().setY(this.coches[3].getB().getY() - 1);
		}
	}
	
	public void moveC4f(){
		if(this.coches[4].isHorizontal()){
			this.coches[4].getA().setX(this.coches[4].getA().getX() + 1);
			this.coches[4].getB().setX(this.coches[4].getB().getX() + 1);
		}
		else{
			this.coches[4].getA().setY(this.coches[4].getA().getY() + 1);
			this.coches[4].getB().setY(this.coches[4].getB().getY() + 1);
		}
	}
	public void moveC4b(){
		if(this.coches[4].isHorizontal()){
			this.coches[4].getA().setX(this.coches[4].getA().getX() - 1);
			this.coches[4].getB().setX(this.coches[4].getB().getX() - 1);
		}
		else{
			this.coches[4].getA().setY(this.coches[4].getA().getY() - 1);
			this.coches[4].getB().setY(this.coches[4].getB().getY() - 1);
		}
	}
	
	public void moveC5f(){
		if(this.coches[5].isHorizontal()){
			this.coches[5].getA().setX(this.coches[5].getA().getX() + 1);
			this.coches[5].getB().setX(this.coches[5].getB().getX() + 1);
		}
		else{
			this.coches[5].getA().setY(this.coches[5].getA().getY() + 1);
			this.coches[5].getB().setY(this.coches[5].getB().getY() + 1);
		}
	}
	public void moveC5b(){
		if(this.coches[5].isHorizontal()){
			this.coches[5].getA().setX(this.coches[5].getA().getX() - 1);
			this.coches[5].getB().setX(this.coches[5].getB().getX() - 1);
		}
		else{
			this.coches[5].getA().setY(this.coches[5].getA().getY() - 1);
			this.coches[5].getB().setY(this.coches[5].getB().getY() - 1);
		}
	}
	
	public void moveC6f(){
		if(this.coches[6].isHorizontal()){
			this.coches[6].getA().setX(this.coches[6].getA().getX() + 1);
			this.coches[6].getB().setX(this.coches[6].getB().getX() + 1);
		}
		else{
			this.coches[6].getA().setY(this.coches[6].getA().getY() + 1);
			this.coches[6].getB().setY(this.coches[6].getB().getY() + 1);
		}
	}
	public void moveC6b(){
		if(this.coches[6].isHorizontal()){
			this.coches[6].getA().setX(this.coches[6].getA().getX() - 1);
			this.coches[6].getB().setX(this.coches[6].getB().getX() - 1);
		}
		else{
			this.coches[6].getA().setY(this.coches[6].getA().getY() - 1);
			this.coches[6].getB().setY(this.coches[6].getB().getY() - 1);
		}
	}
	
	public void moveC7f(){
		if(this.coches[7].isHorizontal()){
			this.coches[7].getA().setX(this.coches[7].getA().getX() + 1);
			this.coches[7].getB().setX(this.coches[7].getB().getX() + 1);
		}
		else{
			this.coches[7].getA().setY(this.coches[7].getA().getY() + 1);
			this.coches[7].getB().setY(this.coches[7].getB().getY() + 1);
		}
	}
	public void moveC7b(){
		if(this.coches[7].isHorizontal()){
			this.coches[7].getA().setX(this.coches[7].getA().getX() - 1);
			this.coches[7].getB().setX(this.coches[7].getB().getX() - 1);
		}
		else{
			this.coches[7].getA().setY(this.coches[7].getA().getY() - 1);
			this.coches[7].getB().setY(this.coches[7].getB().getY() - 1);
		}
	}



	
	


	public boolean movimientoValido(Action where){
		boolean valido = false;
		
		if(where.equals(c0f)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC0f();
			valido = !estadoSiguiente.peligro();
		}else if(where.equals(c0b)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC0b();
			valido = !estadoSiguiente.peligro();
		}
		
		else if(where.equals(c1f)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC1f();
			valido = !estadoSiguiente.peligro();
		}else if(where.equals(c1b)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC1b();
			valido = !estadoSiguiente.peligro();
		}
		
		else if(where.equals(c2f)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC2f();
			valido = !estadoSiguiente.peligro();
		}else if(where.equals(c2b)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC2b();
			valido = !estadoSiguiente.peligro();
		}
		
		else if(where.equals(c3f)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC3f();
			valido = !estadoSiguiente.peligro();
		}else if(where.equals(c3b)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC3b();
			valido = !estadoSiguiente.peligro();
		}
		
		else if(where.equals(c4f)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC4f();
			valido = !estadoSiguiente.peligro();
		}else if(where.equals(c4b)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC4b();
			valido = !estadoSiguiente.peligro();
		}
		
		else if(where.equals(c5f)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC5f();
			valido = !estadoSiguiente.peligro();
		}else if(where.equals(c5b)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC5b();
			valido = !estadoSiguiente.peligro();
		}
		
		else if(where.equals(c6f)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC6f();
			valido = !estadoSiguiente.peligro();
		}else if(where.equals(c6b)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC6b();
			valido = !estadoSiguiente.peligro();
		}
		
		else if(where.equals(c7f)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC7f();
			valido = !estadoSiguiente.peligro();
		}else if(where.equals(c7b)){
			EstadoCoches estadoSiguiente = new EstadoCoches(this);
			estadoSiguiente.moveC7b();
			valido = !estadoSiguiente.peligro();
		}
		
		
		return valido;
	}


	private boolean peligro(){
		for(int i = 0; i < this.coches.length; i++){
			//Ningún coche está fuera del tablero
			if((this.coches[i].getA().getX() < 1) || (this.coches[i].getB().getX() > this.getColumnas()) || (this.coches[i].getA().getY() < 1) || (this.coches[i].getB().getY() > this.getFilas()))
				return true;
			
			//Ningún coche se choca con otro
			for(int j = i+1; j < this.coches.length; j++){
				if(this.coches[i].crash(this.coches[j]))
					return true;
			}
		}
		return false;
	}




	@Override
	public boolean equals(Object o) {

		if (this == o)
			return true;
		if((o == null) || (this.getClass() != o.getClass()))
			return false;
		EstadoCoches otroEstado = (EstadoCoches) o;
		if((this.coches.length == otroEstado.getCoches().length) && (this.columnas == otroEstado.getColumnas()) && (this.filas == otroEstado.getFilas() && (this.salida == otroEstado.getSalida()))){
			
			for(int i = 0; i < this.coches.length; i++){
                if(!this.coches[i].equals(otroEstado.getCoches()[i]))
                    return false;
            }
			return true;
		}
		
		return false;
	}



	@Override
	public int hashCode() {
		int ret = 0;
		for(int i = 0; i < this.coches.length;i++){
			if(this.coches[i].isHorizontal())
				ret += Math.pow(10, i)*this.coches[i].getA().getX();
			else
				ret += Math.pow(10, i)*this.coches[i].getA().getY();			
		}		
		return ret;
	}

	
	
	
	
	
	
	
	public Coche[] getCoches() {
		return coches;
	}

	public void setCoches(Coche[] coches) {
		this.coches = coches;
	}

	public int getFilas() {
		return filas;
	}

	public void setFilas(int filas) {
		this.filas = filas;
	}

	public int getColumnas() {
		return columnas;
	}

	public void setColumnas(int columnas) {
		this.columnas = columnas;
	}

	public Pos getSalida() {
		return salida;
	}

	public void setSalida(Pos salida) {
		this.salida = salida;
	}

}
