package ch11;

import java.util.ArrayList;
import java.util.List;

public class ListEx {
	public void type1() { //기본형 데이터
		List<String> list = new ArrayList<String>();
		
		//추가(Create), 입력, 생성
		list.add("봄");
		list.add("여드름");
		list.add("가을");
		list.add("겨울");
	
		//R(Read), 읽기, 검색
		System.out.println(list.get(0)); //봄
		
		//U(Update), 수정
		System.out.println("수정전 : " + list.get(1));
		list.set(1, "여름");
		System.out.println("수정후 : " + list.get(1));
		
		//D(Delete), 삭제
		list.remove(1);
		
		System.out.println(list);
	
	}
	public void type2() { //객체형 데이터
		
	}
	
	public static void main(String[] args) {
		ListEx le = new ListEx();
		le.type1();
	}
}
