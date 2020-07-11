package com.ssafy.happyhouse.model.dto;

public class Member {

    // 아이디 
    private String id;

    // 비밀번호 
    private String password;

    // 이름 
    private String name;

    // 주소 
    private String address;

    // 전화번호 
    private String phone;

    // 가입일자 

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // Member 모델 복사
    public void CopyData(Member param)
    {
        this.id = param.getId();
        this.password = param.getPassword();
        this.name = param.getName();
        this.address = param.getAddress();
        this.phone = param.getPhone();
    }

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address + ", phone="
				+ phone + "]";
	}
    
}