package ch09;

import java.util.ArrayList;
import java.util.List;

public class WrapperEx {
	public Integer autoBox() {
		int a=10;
		return a;
	}
	public int autoUpBox() {
		Integer i = 10;
		return i;
	}
	
	public List getList() {
		List<Object> abc = new ArrayList<Object>();
		abc.add(10);
		return abc;
		
	}
}
