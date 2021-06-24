package corona;

public class CityVo {
	String stdDay; // 기준 날짜
	String stdTime; // 기준 시간
	
	String cityNm; // 시도명

	int defCnt; // 확진자 수
	int deathCnt; // 사망자 수
	int isolClearCnt; // 격리해제 수
	int isolIngCnt; // 격리중 수
	int incDec; // 전일대비 증감수
	int qurRate; // 10만명당 발생률
	int overFlowCnt; // 해외유입 수
	int localOccCnt; // 지역발생 수
}
  