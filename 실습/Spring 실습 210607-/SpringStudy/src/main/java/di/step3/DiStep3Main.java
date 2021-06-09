package di.step3;

public class DiStep3Main {
	/*
	 * Oracle o; 
	 * public DiStep3Main(Oracle o) { 
	 * 	//Oracle o = new Oracle(); -> X
	 * 	this.o = o; 
	 * }
	 */
	
	DB db; 
	public DiStep3Main(DB db) {
		this.db= db;
		db.run();
	}
	
	public void abc(DB db) {
		this.db = db;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Mysql o = new Mysql();
		DiStep3Main m = new DiStep3Main(o);
		
	}

}
