package aop.step1;

import org.springframework.beans.factory.annotation.Autowired;

// 동일한 이름을 갖고 있는 Bean을 주입
public class AutowireByAnno {
	@Autowired
	Mysql sql;

	public void output() {
		sql.run();
	}

}
