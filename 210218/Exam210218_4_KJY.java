/*
출제일 : 20210218
내용 : 예제 5-22(p225) 안에 있는 2개의 for 문을 forMethod1(), forMethod2()로 분할하여 구현
제출자 : 권지영
*/

package exam;

public class Exam210218_4_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] m1 = {
				{1,2,3},
				{4,5,6}
		};
		
		int[][] m2 = {
				{1,2},
				{3,4},
				{5,6}
		};
		
		final int ROW = m1.length;
		final int COL = m2[0].length;
		final int M2_ROW = m2.length;
		
		int[][] m3 = new int[ROW][COL];
		
		m3 = forMethod1(ROW, COL, M2_ROW, m1, m2, m3); 
		forMethod2(ROW,COL,m3);
	}

	static int[][] forMethod1(int ROW, int COL, int M2_ROW, int[][] m1, int[][]m2, int[][]m3) {
		for (int i = 0; i < ROW; i++) 
			for (int j = 0; j < COL; j++)
				for (int k=0; k<M2_ROW; k++)
					m3[i][j] += m1[i][k] * m2[k][j];
		return m3;
	}

	static void forMethod2(int ROW, int COL, int[][] m3){
		for(int i=0; i<ROW; i++) {
			for(int j=0; j<COL; j++) {
				System.out.printf("%3d ", m3[i][j]);
			}
			System.out.println();
		}
	}
}

