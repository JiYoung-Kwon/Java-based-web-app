package ch11;

public class Member {
	String id;
	String name;
	String phone;
	String address;
	
	//4���� �Ű������� �޴� ������
	Member(String id, String name, String phone, String address){
		
	}
	
	//��� �ʵ��� setter/getter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	//UI �巡�� �ϸ� �Է¹�ư, �巡���ϸ� ��ư???
}
