package di.step4;

// 고객이 필요한 내용을 수정하여 사용할 수 있도록 제공되는 클래스
public class Assembler {
	 DB db;
	 
	 public DB getDb() {
		 // 원하는 database를 생성하면 됨.
		 db = new Tizen();
		 return db;
	 }

}
