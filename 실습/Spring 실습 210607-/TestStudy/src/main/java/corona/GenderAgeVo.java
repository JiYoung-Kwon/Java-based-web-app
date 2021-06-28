package corona;

public class GenderAgeVo {
	String gubun; // 구분(성별, 연령별)

	int confCase; // 확진자 수
	int confCaseRate; // 확진률
	int death; // 사망자 수
	int deathRate; // 사망률
	int criticalRate; // 치명률
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public int getConfCase() {
		return confCase;
	}
	public void setConfCase(int confCase) {
		this.confCase = confCase;
	}
	public int getConfCaseRate() {
		return confCaseRate;
	}
	public void setConfCaseRate(int confCaseRate) {
		this.confCaseRate = confCaseRate;
	}
	public int getDeath() {
		return death;
	}
	public void setDeath(int death) {
		this.death = death;
	}
	public int getDeathRate() {
		return deathRate;
	}
	public void setDeathRate(int deathRate) {
		this.deathRate = deathRate;
	}
	public int getCriticalRate() {
		return criticalRate;
	}
	public void setCriticalRate(int criticalRate) {
		this.criticalRate = criticalRate;
	}

	
}
