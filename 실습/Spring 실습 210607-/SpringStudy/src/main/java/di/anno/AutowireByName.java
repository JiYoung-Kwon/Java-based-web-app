package di.anno;

// 동일한 이름을 갖고 있는 Bean을 주입
public class AutowireByName {
	Oracle or;

	public void setOr(Oracle or) {
		this.or = or;
	}

	public void output() {
		or.run();
	}
}
