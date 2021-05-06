package ch11;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

public class SetEx {
	//������
	public SetEx(){
		Set<Integer> set = new HashSet<Integer>();
		
		set.add(10);
		set.add(20);
		set.add(30);
		set.add(40);
		set.add(50);
		
		set.add(10);
		set.add(20);
		
		//��� ���ؼ��� Iterator�� �����ؾ� ��
		Iterator<Integer> iter = set.iterator();
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
		
		//set ������ ����� �ߺ����� �ʴ� ��ȣ 6�� ����
		Set<Integer> lotto = new HashSet<Integer>();
		Random r = new Random();
		while(lotto.size()<6) {
			lotto.add(r.nextInt(45)+1);
		}
		System.out.println(lotto);
	
		//��ü ����
		Member m1 = new Member("hong","gil dong", "010", "busan");
		Member m2 = new Member("kim","gil dong", "010", "busan");
		Member m3 = new Member("lee","gil dong", "010", "busan");
		Member m4 = new Member("park","gil dong", "010", "busan");
		
		Set<Member> setMember = new HashSet<Member>();
		setMember.add(m1);
		setMember.add(m2);
		setMember.add(m3);
		setMember.add(m4);
		
		//����� ��ü ���
		Iterator<Member> miter = setMember.iterator();
		while(miter.hasNext()) {
			Member m = miter.next();
			System.out.printf("%s %s %s %s\n",m.getId(),m.getIrum(),m.getPhone(),m.getAddress());
		}
	}
	
	//main
	public static void main(String[] args) {
		SetEx ex = new SetEx();
	}
}
