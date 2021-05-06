/*
������ : 20210224
���� : 2/16�� ������ Ŭ������ �����Ͽ� �����Ͻÿ�.Ŭ������ ������ ����
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
������ : ������
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
		System.out.println(" ��ȣ  ����  ����  ����  ����   ��� ");
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
