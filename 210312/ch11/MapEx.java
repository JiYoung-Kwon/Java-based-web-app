package ch11;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class MapEx {
	public MapEx() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		// 추가
		map.put("kim", 70);
		map.put("park", 89);
		map.put("lee", 60);
		// 조회
		Set<String> set = map.keySet(); // 맵이 가지고 있는 전체 키 값이 Set 타입으로 반환됨
		Iterator<String> iter = set.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			Integer value = map.get(key);
			System.out.println(key + " : " + value);
		}
		// 수정
		map.put("park", 80);
		System.out.println("park value : " + map.get("park"));
		// 삭제
		map.remove("park");
		System.out.println("park value : " + map.get("park"));

		// 객체 저장
		Map<String, Member> mMap = new HashMap<String, Member>();
		mMap.put("kim", new Member("kim", "김씨", "010-1111", "강원도"));
		mMap.put("park", new Member("park", "박씨", "010-1111", "강원도"));
		mMap.put("choi", new Member("choi", "최씨", "010-1111", "강원도"));
		mMap.put("hong", new Member("hong", "홍씨", "010-1111", "강원도"));

		// 객체 출력
		Set<String> mKey = mMap.keySet();
		Iterator<String> mIter = mKey.iterator();
		while (mIter.hasNext()) {
			String k = mIter.next();
			Member m = mMap.get(k);
			String str = String.format("%s[%s] Phone:%s Address:%s", m.getId(), m.getIrum(), m.getPhone(),
					m.getAddress());
			System.out.println(str);
		}

		// 홍씨의 주소를 서울시로 수정한 후 그 결과를 출력
		Member m = mMap.get("hong");
		m.setAddress("서울 종로구");
		mMap.put("hong", m);
		System.out.println("---------------");
		m = mMap.get("hong");
		String str = String.format("%s[%s] Phone:%s Address:%s", m.getId(), m.getIrum(), m.getPhone(), m.getAddress());
		System.out.println(str);
	}

	public static void main(String[] args) {
		new MapEx();
	}
}
