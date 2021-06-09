package di.exam2;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MemberConfig {

	//어노테이션 bean을 붙여줌으로써 빈 지정
	@Bean
	public Member rMember() { //메서드 명이 xml 파일의 id 역할을 함
		return new RegisterMember();
	}
	@Bean
	public Member gMember() {
		return new GuestMember();
	}

}
