/*
������ : 20210208
���� : ���� 5. 1+(1+2)+(1+2+3)+(1+2+3+4)+...+(1+2+3+...+10)�� ����� ���
������ : ������
*/

package ch04;

public class Exercise4_3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int sum = 0, result = 0;

		for (int i = 1; i <= 10; i++) {
			sum += i;
			result += sum;
		}

		System.out.println("result = " + result);
	}

}
