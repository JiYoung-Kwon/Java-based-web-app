package ch11;

public class Member {
	String id;
	String name;
	String phone;
	String address;
	
	//4개의 매개변수를 받는 생성자
	Member(String id, String name, String phone, String address){
		
	}
	
	//모든 필드의 setter/getter
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
	
	//UI 드래그 하면 입력버튼, 드래그하면 버튼???
}
