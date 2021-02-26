package practice;

public class Exam210226_1_KJY {
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[][] score = { { 100, 100, 100 }, { 20, 20, 20 }, { 30, 30, 30 }, { 40, 40, 40 }, { 50, 50, 50 } };

		Student[] sts = new Student[5];
		for (int i = 0; i < score.length; i++) {
			sts[i] = new Student(score[i][0], score[i][1], score[i][2]);
		}

		System.out.println(" 번호  국어  영어  수학  총점   평균 ");
		System.out.println("==============================");

		Teacher tc = new Teacher();

		int num = 1;
		for (Student n : sts) {
			System.out.printf("%3d", num);
			n.outputMethod();
			tc.totalAvg(n);
			tc.outputMethod(n);
			num++;
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
