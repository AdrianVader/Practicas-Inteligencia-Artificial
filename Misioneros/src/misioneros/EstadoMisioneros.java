package misioneros;

import aima.core.agent.Action;
import aima.core.agent.impl.DynamicAction;

public class EstadoMisioneros {

	
	//ESTADOS
	private int numMisioneros;
	private int numCanibales;
	private boolean barcaIzq;
	

	public EstadoMisioneros(){		
		this.numMisioneros = 3;
		this.numCanibales = 3;
		this.barcaIzq = true;
	}
	
	public EstadoMisioneros(EstadoMisioneros mc){
		this.numMisioneros = mc.getNumMisioneros();
		this.numCanibales = mc.getNumCanibales();
		this.barcaIzq = mc.isBarcaIzq();
	}
	
	public EstadoMisioneros(int m, int c, boolean b){
		this.numMisioneros = m;
		this.numCanibales = c;
		this.barcaIzq = b;
	}

	//ACCIONES
	public static Action MM = new DynamicAction("Dos misioneros");
	public static Action MC = new DynamicAction("Misionero y canibal");
	public static Action CC = new DynamicAction("Dos caníbales");
	public static Action M = new DynamicAction("Un misionero");
	public static Action C = new DynamicAction("Un caníbal");


	
	
	public void moveM(){
		if(this.barcaIzq)
			this.numMisioneros--;
		else
			this.numMisioneros++;
		cambiarDeOrilla();
	}
	
	public void moveC(){
		if(this.barcaIzq)
			this.numCanibales--;
		else
			this.numCanibales++;
		cambiarDeOrilla();
	}
	
	public void moveMM(){
		if(this.barcaIzq)
			this.numMisioneros -= 2;
		else
			this.numMisioneros += 2;
		cambiarDeOrilla();
	}
	
	public void moveCC(){
		if(this.barcaIzq)
			this.numCanibales -= 2;
		else
			this.numCanibales += 2;
		cambiarDeOrilla();
	}
	
	public void moveMC(){
		if(this.barcaIzq){
			this.numMisioneros--;
			this.numCanibales--;
		}
		else{
			this.numMisioneros++;
			this.numCanibales++;
		}
		cambiarDeOrilla();
	}
	
	
	
	
	public void cambiarDeOrilla(){
		this.barcaIzq = !this.barcaIzq;
	}
	
	
	public boolean movimientoValido(Action where){
		boolean valido = false;
		if(where.equals(M)){
			if((this.barcaIzq && this.numMisioneros > 0) || (!this.barcaIzq && this.numMisioneros < 3)){
				EstadoMisioneros estadoSiguiente = new EstadoMisioneros(this);
				estadoSiguiente.moveM();
				valido = !estadoSiguiente.peligro();
			}
			else
				valido = false;
		}
		else if(where.equals(C)){
			if((this.barcaIzq && this.numCanibales > 0) || (!this.barcaIzq && this.numCanibales < 3)){
				EstadoMisioneros estadoSiguiente = new EstadoMisioneros(this);
				estadoSiguiente.moveC();
				valido = !estadoSiguiente.peligro();
			}
			else
				valido = false;
		}
		else if(where.equals(MM)){
			if((this.barcaIzq && this.numMisioneros > 1) || (!this.barcaIzq && this.numMisioneros < 2)){
				EstadoMisioneros estadoSiguiente = new EstadoMisioneros(this);
				estadoSiguiente.moveMM();
				valido = !estadoSiguiente.peligro();
			}
			else
				valido = false;
		}
		else if(where.equals(CC)){
			if((this.barcaIzq && this.numCanibales > 1) || (!this.barcaIzq && this.numCanibales < 2)){
				EstadoMisioneros estadoSiguiente = new EstadoMisioneros(this);
				estadoSiguiente.moveCC();
				valido = !estadoSiguiente.peligro();
			}
			else
				valido = false;
		}
		else if(where.equals(MC)){
			if((this.barcaIzq && this.numMisioneros > 0 && this.numCanibales > 0) || (!this.barcaIzq && this.numMisioneros < 3 && this.numCanibales < 3)){
				EstadoMisioneros estadoSiguiente = new EstadoMisioneros(this);
				estadoSiguiente.moveMC();
				valido = !estadoSiguiente.peligro();
			}
			else
				valido = false;
		}
		return valido;
	}
	
	
	private boolean peligro(){
		if(((this.numMisioneros < this.numCanibales) && (this.numMisioneros != 0)) || ((this.numMisioneros > this.numCanibales) && (this.numMisioneros != 3)))
			return true;
		else
			return false;
	}
	
	
	
	
	@Override
	public boolean equals(Object o) {

		if (this == o)
			return true;
		if((o == null) || (this.getClass() != o.getClass()))
			return false;
		EstadoMisioneros otroEstado = (EstadoMisioneros) o;
		if((this.numMisioneros == otroEstado.getNumMisioneros()) && (this.numCanibales == otroEstado.getNumCanibales()) && (this.barcaIzq == otroEstado.isBarcaIzq()))
			return true;
		else
			return false;
	}


	
	@Override
	public int hashCode() {
		
		return (100 * this.numMisioneros) + (10 * this.numCanibales) + (this.barcaIzq ? 1: 0);
	}
	
	
	
	
	
	
	public int getNumMisioneros() {
		return numMisioneros;
	}

	public void setNumMisioneros(int numMisioneros) {
		this.numMisioneros = numMisioneros;
	}

	public int getNumCanibales() {
		return numCanibales;
	}

	public void setNumCanibales(int numCanibales) {
		this.numCanibales = numCanibales;
	}

	public boolean isBarcaIzq() {
		return barcaIzq;
	}

	public void setBarcaIzq(boolean barcaIzq) {
		this.barcaIzq = barcaIzq;
	}
	
	

}
