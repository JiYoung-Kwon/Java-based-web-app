package aop.exam1;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class Advice implements MethodInterceptor{

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
	
	public void beforeLog() {
		System.out.println("log : " + sdf.format(new Date()));
	}

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		// TODO Auto-generated method stub
		beforeLog();
		System.out.println(invocation.getThis().getClass().getSimpleName());
		System.out.println(invocation.getMethod().getName());
		Object result = invocation.proceed();
		return result;
	}
	
	
}
