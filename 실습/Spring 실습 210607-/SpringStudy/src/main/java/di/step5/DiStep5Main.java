package di.step5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class DiStep5Main {
	
	public DiStep5Main() {
		ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/java/di/step5/assembler.xml");
		
		DB db = (DB) ac.getBean("oracle");
		db.run();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new DiStep5Main();
		
	}
}
