package di.anno;

// 동일한 이름을 갖고 있는 Bean을 주입
public class AutowireByType {
	Tizen tizen;

	public void setTizen(Tizen tizen) {
		this.tizen = tizen;
	}

	public void output() {
		tizen.run();
	}

}
