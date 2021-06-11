package aop.step1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	
	public Main() {
		ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/java/aop/step1/assembler.xml");
		
		AutowireByAnno aba = ac.getBean("byAnno", AutowireByAnno.class);
		aba.output();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Main();
		
	}
}
