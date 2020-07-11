package com.ssafy.happyhouse.model.dto;

public class Commercial {
	private int no; 
	private String shopname; 
	private String code1; 
	private String codename1; 
	private String code2; 
	private String codename2; 
	private String code3; 
	private String codename3; 
	private String city; 
	private String gu; 
	private String dong; 
	private String address; 
	private String lng; 
	private String lat;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getCode1() {
		return code1;
	}
	public void setCode1(String code1) {
		this.code1 = code1;
	}
	public String getCodename1() {
		return codename1;
	}
	public void setCodename1(String codename1) {
		this.codename1 = codename1;
	}
	public String getCode2() {
		return code2;
	}
	public void setCode2(String code2) {
		this.code2 = code2;
	}
	public String getCodename2() {
		return codename2;
	}
	public void setCodename2(String codename2) {
		this.codename2 = codename2;
	}
	public String getCode3() {
		return code3;
	}
	public void setCode3(String code3) {
		this.code3 = code3;
	}
	public String getCodename3() {
		return codename3;
	}
	public void setCodename3(String codename3) {
		this.codename3 = codename3;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	@Override
	public String toString() {
		return "Commercial [no=" + no + ", shopname=" + shopname + ", code1=" + code1 + ", codename1=" + codename1
				+ ", code2=" + code2 + ", codename2=" + codename2 + ", code3=" + code3 + ", codename3=" + codename3
				+ ", city=" + city + ", gu=" + gu + ", dong=" + dong + ", address=" + address + ", lng=" + lng
				+ ", lat=" + lat + "]";
	} 
	
}
