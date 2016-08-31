package coches;

public class Coche {

	
	private  Pos a;
	private Pos b;
	
	
	public Coche(Pos x, Pos y){
		this.a = x;
		this.b = y;
	}
	
	public boolean isVertical(){
		if(this.a.getX() == this.b.getX())
			return true;
		return false;
	}
	
	public boolean isHorizontal(){
		if(this.a.getY() == this.b.getY())
			return true;
		return false;
	}
	
	public boolean crash(Coche c){
		
		if(this.isHorizontal()){
			if(c.isHorizontal() && this.a.getY() == c.getA().getY()){
				if((this.a.getX() <= c.getA().getX() && this.b.getX() >= c.getA().getX()) || (this.a.getX() <= c.getB().getX() && this.b.getX() >= c.getB().getX()) || (this.a.getX() <= c.getA().getX() && this.b.getX() >= c.getB().getX()) || (this.a.getX() >= c.getA().getX() && this.b.getX() <= c.getB().getX()))
					return true;
			}else if(c.isVertical()){
				if(this.a.getX() <= c.getA().getX() && this.b.getX() >= c.getA().getX() && c.getA().getY() <= this.a.getY() && c.getB().getY() >= this.a.getY())
					return true;
			}
			
		}else if(this.isVertical()){
			if(c.isHorizontal()){
				if(c.getA().getX() <= this.a.getX() && c.getB().getX() >= this.b.getX() && this.a.getY() <= c.getA().getY() && this.b.getY() >= c.getB().getY())				 
					return true;
			}else if(c.isVertical() && this.a.getX() == c.getA().getX()){
				if((this.a.getY() <= c.getA().getY() && this.b.getY() >= c.getA().getY()) || (this.a.getY() <= c.getB().getY() && this.b.getY() >= c.getB().getY()) || (this.a.getY() <= c.getA().getY() && this.b.getY() >= c.getB().getY()) || (this.a.getY() >= c.getA().getY() && this.b.getY() <= c.getB().getY()))
					return true;
			}
		}else {
			return true; // No permitimos otras geometrías.
		}
		
		
		return false;
	}
	
	@Override
    public boolean equals(Object o) {

        if (this == o)
            return true;
        if((o == null) || (this.getClass() != o.getClass()))
            return false;
        Coche c = (Coche) o;
        if (this.a.equals(c.getA()) && this.b.equals(c.getB()))
            return true;
        
        return false;
    }

	public Pos getA() {
		return a;
	}

	public void setA(Pos a) {
		this.a = a;
	}

	public Pos getB() {
		return b;
	}

	public void setB(Pos b) {
		this.b = b;
	}
	
}
