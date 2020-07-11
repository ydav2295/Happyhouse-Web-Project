package com.ssafy.happyhouse.model.dto;

public class InterestedOpt {
	private int no; 
	private String id; 
	private String sido; 
	private String gugun; 
	private String dong; 
	private String price; 
	private String space; 
	private String floor;
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSpace() {
		return space;
	}

	public void setSpace(String space) {
		this.space = space;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	@Override
	public String toString() {
		return "InterestedOpt [no=" + no + ", id=" + id + ", sido=" + sido + ", gugun=" + gugun + ", dong=" + dong
				+ ", price=" + price + ", space=" + space + ", floor=" + floor + "]";
	}
	
}
