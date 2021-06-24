package corona;

public class KoreaVo {
	String stdDay; // 기준 날짜
	String stdTime; // 기준 시간

	int decideCnt; // 확진자 수
	int clearCnt;// 격리해제 수
	int examCnt;// 검사진행 수
	int deathCnt;// 사망자 수
	int careCnt;// 격리중 수
	int resultNegCnt; // 결과 음성 수
	int accExamCompCnt; // 누적 검사 수
	int accDefRate;// 누적 확진율
	
	int todayDecide; // 일일 확진자 수
	int todayClear; // 일일 격리해제 수
	int todayCare; // 일일 격리중 수
	int todayDeath; // 일일 사망자 수
}
