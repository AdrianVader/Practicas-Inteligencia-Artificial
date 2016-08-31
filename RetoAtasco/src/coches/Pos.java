package coches;

public class Pos {

	
	private int x;
	private int y;
	
	public Pos(){
		this.x = -1;
		this.y = -1;
	}
	
	public Pos(int varX, int varY){
		this.x = varX;
		this.y = varY;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}
	
	@Override
    public boolean equals(Object o){
        
        
        if (this == o)
            return true;
        if((o == null) || (this.getClass() != o.getClass()))
            return false;
        Pos p = (Pos) o;
        if(this.x == p.x && this.y == p.y)
            return true;
        return false;
    }
	
}
