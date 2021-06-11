package aop.step3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	
	public Main() {
		ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/java/aop/step3/assembler.xml");
		
		/*
		 * Advice advice = ac.getBean("advice", Advice.class);
		 * System.out.println("before..........."); advice.beforelog();
		 * 
		 * System.out.println("after..........."); advice.afterlog();
		 * 
		 * System.out.println("around..........."); advice.aroundlog();
		 */
		DB db = ac.getBean("proxy",DB.class);
		db.run();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Main();
		
	}
}
