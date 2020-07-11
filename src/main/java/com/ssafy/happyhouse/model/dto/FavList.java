package com.ssafy.happyhouse.model.dto;

public class FavList {
	private int fvNo;
	private int no;
	private String id;
	
	public int getFvNo() {
		return fvNo;
	}
	public void setFvNo(int fvNo) {
		this.fvNo = fvNo;
	}
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
	@Override
	public String toString() {
		return "FavList [fvNo=" + fvNo + ", no=" + no + ", id=" + id + "]";
	}
	
	
}
