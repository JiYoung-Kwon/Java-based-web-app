package ch09;

public class StringEx {
	public StringEx() {
		String s1 ="�ڿ���";
		String s2 ="�ڿ���";

		String s3 =new String("ȫ�浿");
		String s4 =new String("ȫ�浿");
		
		//���ڿ� ��
		if(s1.equals(s2)) System.out.println("s1 = s2");		
		else 			  System.out.println("s1 != s2");
		
		//���Կ����� ��
		if(s1==s2)		  System.out.println("s1 = s2");		
		else 			  System.out.println("s1 != s2");
		
		//���ڿ� ��
		if(s3.equals(s4)) System.out.println("s3 = s4");		
		else 			  System.out.println("s3 != s4");
		
		//���Կ����� ��
		if(s3==s4)		  System.out.println("s3 = s4");		
		else 			  System.out.println("s3 != s4");
	}

}
