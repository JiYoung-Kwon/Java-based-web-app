package di.exam1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MemberService {

	public MemberService() {
		ApplicationContext ac = new FileSystemXmlApplicationContext("src/main/java/di/exam1/member.xml");
		
		// 방법만 다르고, 동일한 뜻
		Member rM = ac.getBean("rMember", RegisterMember.class);
		Member gM = (GuestMember) ac.getBean("gMember");
		
		rM.insert(null);
		gM.delete(null);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new MemberService();
	}

}
