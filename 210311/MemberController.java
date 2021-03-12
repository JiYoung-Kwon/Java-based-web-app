package ch11;

import java.util.ArrayList;
import java.util.List;

public class MemberController {
	public static List<Member> members = new ArrayList<Member>();

	public String append(Member m) {
		String msg = "�����Ͱ� ���������� ����Ǿ����ϴ�.";

		// ������ ���� �� - example) DB ����, ���� ���, static ������ �� �ֱ�
		try {
			members.add(m);
		} catch (Exception e) {
			e.printStackTrace(); // �����ڸ� ���� �޼���
			msg = "������ ������ ���� �߻�";
		}
		return msg;
	}

	public String update(Member m) {
		String msg = "�����Ͱ� ���������� �����Ǿ����ϴ�.";

		try {
			for (int index = 0; index < members.size(); index++) {
				Member target = members.get(index);

				if (target.getId().equals(m.getId())) { // string �� -> equals�� ���ؾ� ��! ������ ��� X
					members.set(index, m);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "������ ���� �� ���� �߻�";
		}

		return msg;
	}

	public String delete(Member m) { 
		String msg = "�����Ͱ� ���������� �����Ǿ����ϴ�.";

		try {
			for (int index = members.size()-1; index >=0; index--) { 
				//���� ��, index ������ �����ϱ� ���� ������ �ڿ������� ������ ������ ���� �ξ� ������ ���
				Member target = members.get(index);

				if (target.getId().equals(m.getId())) {
					members.remove(index);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "������ ���� �� ���� �߻�";
		}

		return msg;
	}
	
	public List<Member> search(String findStr) { //0���� ������ n���� ��ȯ�ؾ� �� -> list
		List<Member> returnList = new ArrayList<Member>();
		
		//indexOf ����ϱ�(���ڿ� �ȿ� �ִ� �Ϻθ� �˻����� ���)
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
