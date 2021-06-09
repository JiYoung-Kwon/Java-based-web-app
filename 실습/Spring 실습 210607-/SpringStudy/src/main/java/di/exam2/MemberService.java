package di.exam2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MemberService {

	public MemberService() {
		/* 기본 member.xml 파일을 사용하여 빈을 가져오는 방법
		 * ApplicationContext ac = new
		 * FileSystemXmlApplicationContext("src/main/java/di/exam1/member.xml");
		 * 
		 * // 방법만 다르고, 동일한 뜻 Member rM = ac.getBean("rMember", RegisterMember.class);
		 * Member gM = (GuestMember) ac.getBean("gMember");
		 */
		
		// MemberConfig.java를 이용하여 빈을 가져오는 방법
		ApplicationContext ac = new AnnotationConfigApplicationContext(MemberConfig.class);
		
		Member rM = ac.getBean("rMember", RegisterMember.class);
		Member gM = ac.getBean("gMember", GuestMember.class);
		
		rM.insert(null);
		gM.delete(null);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new MemberService();
	}

}
