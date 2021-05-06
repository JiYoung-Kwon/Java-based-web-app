/*
출제일 : 20210224
내용 : 2/16일 문제를 클래스로 변경하여 구현하시오.클래스는 다음과 같음
	class Student{
		int kor;
		int eng;
		int Math;
		int total;
		double avg;
	
		void outputMethod() {}
	}
	class Teacher{
		void totalAvg(Student student) {}
		void outputMethod(Student student) {}
	}
제출자 : 권지영
*/

package exam;

import java.util.Arrays;

public class Exam210224_3_KJY {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int i = 0;

		Student st1 = new Student(100, 100, 100);
		Student st2 = new Student(20, 20, 20);
		Student st3 = new Student(30, 30, 30);
		Student st4 = new Student(40, 40, 40);
		Student st5 = new Student(50, 50, 50);

		Student[] st = { st1, st2, st3, st4, st5 };
		System.out.println(" 번호  국어  영어  수학  총점   평균 ");
		System.out.println("==============================");

		Teacher tc = new Teacher();

		for (Student n : st) {
			System.out.printf("%3d", i + 1);
			n.outputMethod();
			tc.totalAvg(n);
			tc.outputMethod(n);
			i++;
		}
	}
}

class Student {
	int kor, eng, math;
	int total;
	double avg;

	Student() {
	}

	Student(int k, int e, int m) {
		kor = k;
		eng = e;
		math = m;
	}

	void outputMethod() {
		System.out.printf("%5d%5d%5d", kor, eng, math);
	}
}

class Teacher {
	void totalAvg(Student student) {
		student.total = student.kor + student.eng + student.math;
		student.avg = student.total / 3;
	}

	void outputMethod(Student student) {
		System.out.printf("%5d  %5.1f", student.total, student.avg);
		System.out.println();
	}
}
