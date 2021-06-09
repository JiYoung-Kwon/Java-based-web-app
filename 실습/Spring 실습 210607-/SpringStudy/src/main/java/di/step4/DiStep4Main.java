package di.step4;

public class DiStep4Main {

	DB db;
	public void abc(DB db) {
		this.db = db;
		this.db.run();
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Assembler ass = new Assembler();
		DiStep4Main m = new DiStep4Main();
		m.abc(ass.getDb());
		
	}

}
