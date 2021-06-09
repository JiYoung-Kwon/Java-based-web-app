package di.board;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/java/di/board/config.xml");
		
		BoardService bs = ac.getBean("bs", BoardService.class);
		
		bs.output();
	}

}
