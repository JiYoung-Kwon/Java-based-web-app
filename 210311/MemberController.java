package ch11;

import java.util.ArrayList;
import java.util.List;

public class MemberController {
	public static List<Member> members = new ArrayList<Member>();

	public String append(Member m) {
		String msg = "데이터가 정상적으로 저장되었습니다.";

		// 로직이 들어가는 곳 - example) DB 저장, 소켓 통신, static 변수에 값 넣기
		try {
			members.add(m);
		} catch (Exception e) {
			e.printStackTrace(); // 개발자를 위한 메세지
			msg = "데이터 저장중 오류 발생";
		}
		return msg;
	}

	public String update(Member m) {
		String msg = "데이터가 정상적으로 수정되었습니다.";

		try {
			for (int index = 0; index < members.size(); index++) {
				Member target = members.get(index);

				if (target.getId().equals(m.getId())) { // string 값 -> equals로 비교해야 함! 연산자 사용 X
					members.set(index, m);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "데이터 수정 중 오류 발생";
		}

		return msg;
	}

	public String delete(Member m) { 
		String msg = "데이터가 정상적으로 삭제되었습니다.";

		try {
			for (int index = members.size()-1; index >=0; index--) { 
				//삭제 시, index 오류를 방지하기 위해 루프를 뒤에서부터 앞으로 돌리는 것이 훨씬 안전한 방법
				Member target = members.get(index);

				if (target.getId().equals(m.getId())) {
					members.remove(index);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "데이터 삭제 중 오류 발생";
		}

		return msg;
	}
	
	public List<Member> search(String findStr) { //0개를 포함한 n개를 반환해야 함 -> list
		List<Member> returnList = new ArrayList<Member>();
		
		//indexOf 고려하기(문자열 안에 있는 일부만 검색했을 경우)
		for(int index=0; index<members.size(); index++) {
			Member target = members.get(index);
			if(target.getId().indexOf(findStr)>-1 ||
			   target.getIrum().indexOf(findStr)>-1 ||
			   target.getPhone().indexOf(findStr)>-1 ||
			   target.getAddress().indexOf(findStr)>-1 ) {
				
			   returnList.add(target);
			}
		}
		
		return returnList; 
	}
	
	public Member selectOne(String id) {
		Member m = null;
		for(int i=0; i<members.size(); i++) {
			Member target = members.get(i);
			if(id.equals(target.getId())){
				m = target;
				break;
			}
		}
		
		return m;
	}
}
