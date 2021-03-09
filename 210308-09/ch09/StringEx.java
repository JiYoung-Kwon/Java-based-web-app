package ch09;

public class StringEx {
	public StringEx() {
		String s1 ="박원기";
		String s2 ="박원기";

		String s3 =new String("홍길동");
		String s4 =new String("홍길동");
		
		//문자열 비교
		if(s1.equals(s2)) System.out.println("s1 = s2");		
		else 			  System.out.println("s1 != s2");
		
		//관게연산자 집
		if(s1==s2)		  System.out.println("s1 = s2");		
		else 			  System.out.println("s1 != s2");
		
		//문자열 비교
		if(s3.equals(s4)) System.out.println("s3 = s4");		
		else 			  System.out.println("s3 != s4");
		
		//관게연산자 집
		if(s3==s4)		  System.out.println("s3 = s4");		
		else 			  System.out.println("s3 != s4");
	}

}
