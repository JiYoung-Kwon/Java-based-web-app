/*
출제일 : 20210218
내용 : 밑의 조건에 맞는 프로그램을 구현
 		1~10 범위의 정수 2개를 입력 받은 후, 입력 받은 수의 크기만큼 int [] arr1, int [] arr2 의 배열을 생성하시오.
		생성된 2개의 배열에 1~100 범위의 수를 무작위로 저장한 후 출력하시오.
 		두 배열 합집합의 크기를 가진 int [] hap 에 두 배열의 합집합을 저장하고 출력하시오.(알고리즘 필수)
 		두 배열 교집합의 크기를 가진 int [] kyo 에 두 배열의 교집합을 저장하고 출력하시오.
제출자 : 권지영
*/

package exam;

import java.util.*;

public class Exam210218_3_KJY {

	public static void main(String[] args) {
		int num1 = 0, num2 = 0;
		Scanner scanner = new Scanner(System.in);

		// 입력 받기
		while (true) {
			System.out.println("1~10 범위 정수 2개 입력 >");
			num1 = scanner.nextInt();
			num2 = scanner.nextInt();
			/*
			 * String tmp1 = scanner.nextLine(); int num1 = Integer.parseInt(tmp1); String
			 * tmp2 = scanner.nextLine(); int num2 = Integer.parseInt(tmp2);
			 */
			if (num1 < 1 || num1 > 10 || num2 < 1 || num2 > 10) {
				System.out.println("범위를 벗어났습니다. 다시 입력하세요");
			} else
				break;
		}
		// 두 배열 생성
		int[] arr1 = new int[num1];
		int[] arr2 = new int[num2];
		int hapSize = num1 + num2;

		// 1~100 무작위 저장
		for (int i = 0; i < arr1.length; i++) {
			arr1[i] = (int) (Math.random() * 100);
		}
		for (int i = 0; i < arr2.length; i++) {
			arr2[i] = (int) (Math.random() * 100);
		}

		// 합집합 크기 구하기
		for (int i = 0; i < arr1.length; i++) {
			for (int j = 0; j < arr2.length; j++) {
				if (arr1[i] == arr2[j]){// 중복이라면
					hapSize--;
				}
			}
		}

		int[] hap = new int[hapSize]; // 합집합
		int[] kyo = new int[num1+num2-hapSize]; // 교집합
		
		int i = 0, k = 0;

		for (int x = 0; x < arr1.length; x++) {
			hap[i] = arr1[x];
			i++;
		}

		for (int x = 0; x < arr2.length; x++) {
			boolean isSame = false;
			for (int y = 0; y < arr1.length; y++) {
				if (arr1[y] == arr2[x]) {
					isSame = true;
				}
			}
			if (!isSame) {
				hap[i] = arr2[x];
				i++;
			}
			else//isSame
			{
				kyo[k] = arr2[x];
				k++;
			}
		}
				
		//출력
		System.out.println(Arrays.toString(arr1));
		System.out.println(Arrays.toString(arr2));
		System.out.println(Arrays.toString(hap));
		System.out.println(Arrays.toString(kyo));
		System.out.println(hapSize);
		System.out.println(kyo.length);
		
	}

}
