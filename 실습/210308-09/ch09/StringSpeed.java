package ch09;

import java.util.Date;

public class StringSpeed {
	void speedTest() {
		//String test
		String s = "";
		long t1 = new Date().getTime();
		for(int i=0 ; i<200000; i++) {
			s+="a";
		}
		long t2 = new Date().getTime();
		System.out.println("String Time :"+(t2-t1));
		
		//StringBuilder
		StringBuilder sb = new StringBuilder();
		t1 = new Date().getTime();
		for(int i=0; i<200000; i++) {
			sb.append("a");
		}
		t2 = new Date().getTime();
		System.out.println("StringBuilder Time :"+(t2-t1));
	}
}
