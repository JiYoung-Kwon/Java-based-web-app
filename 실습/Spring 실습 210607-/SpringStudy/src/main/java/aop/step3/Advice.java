package aop.step3;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

// 횡단적 관심사가 분리된 코드
public class Advice implements MethodInterceptor{
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
	
	// before advice type
	public void beforelog() {
		System.out.println("log : " + sdf.format(new Date()));
	}
	
	// after advice type
	public void afterlog() {	
		System.out.println("log : " + sdf.format(new Date()));
	}

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		// TODO Auto-generated method stub
		beforelog();
		invocation.proceed();
		afterlog();		
		return null;
	}
}
