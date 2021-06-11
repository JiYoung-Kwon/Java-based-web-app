package aop.aspectj;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {

	public Main() {
		ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/java/aop/aspectj/assembler.xml");
		
		Dao dao = ac.getBean("bd", Dao.class);
		dao.insert(null);
		dao.select(null);
		dao.update(null);
		dao.delete(null);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Main();
	}

}
