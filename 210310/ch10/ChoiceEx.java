package ch10;

import java.text.ChoiceFormat;

public class ChoiceEx {
	public void type1() {// 10-16
		double[] limit = { 0, 60, 70, 80, 90 };
		String[] grade = { "F", "D", "C", "B", "A" };
		int[] scores = { 0, 1, 99, 88, 79, 80, 70, 55, 60, 65, 100 };

		ChoiceFormat cf = new ChoiceFormat(limit, grade);

		for (int i = 0; i < scores.length; i++) {
			String fmt = String.format("%d : %s", scores[i], cf.format(scores[i]));
			System.out.println(fmt);
		}
	}

	public void type2() {// 10-17
		String pattern = "0#F|60#D|70#C|80#B|90#A";
		int[] scores = { 0, 99, 88, 79, 80, 70, 55, 60, 65, 100 };

		ChoiceFormat cf = new ChoiceFormat(pattern);

		for (int i = 0; i < scores.length; i++) {
			String fmt = String.format("%d : %s", scores[i], cf.format(scores[i]));
			System.out.println(fmt);
		}
	}

	public static void main(String[] args) {
		ChoiceEx ce = new ChoiceEx();
		ce.type1();
		System.out.println("================");
		ce.type2();
	}
}
