package ch11;

//value object(VO)
public class Member {
	String id;
	String irum;
	String phone;
	String address;
	
	//4개의 매개변수를 받는 생성자
	Member(String id, String irum, String phone, String address){
		this.id = id;
		this.irum = irum;
		this.phone = phone;
		this.address = address;
	}
	
	//모든 필드의 setter/getter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getIrum() {
		return irum;
	}
	public void setIrum(String irum) {
		this.irum = irum;
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

}
