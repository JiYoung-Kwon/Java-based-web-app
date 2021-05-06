package ch09;

import java.util.List;
import java.util.StringTokenizer;
import java.util.Vector;

public class TokenEx {
	String source;
	String delim;
	boolean b;
	public TokenEx(String source, String delim,boolean b) {
		this.source  = source;
		this.delim = delim;
		this.b = b;
	}
	public List<String> getToken(){
		List<String> list = new Vector();
		StringTokenizer st = new StringTokenizer(source, delim,b);
		while(st.hasMoreTokens()) {
			String t = st.nextToken();
			System.out.println(t);
			list.add(t);
		}
		return list;
	}
	
	public String[] split(String source, String delim) {
		return source.split(delim);
	}
}
