package aop.aspectj;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

public class Advice{
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
	
	public Object before(JoinPoint point){
		// TODO Auto-generated method stub
		System.out.println(sdf.format(new Date()));
		return null;
	}
	public Object around(ProceedingJoinPoint point){
		// TODO Auto-generated method stub
		System.out.println(sdf.format(new Date()));
		
		try {
			point.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(sdf.format(new Date()));
		return 0;
	}
	
	
}
