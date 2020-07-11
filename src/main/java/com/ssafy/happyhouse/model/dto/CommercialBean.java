package com.ssafy.happyhouse.model.dto;

public class CommercialBean {
	private String codename1; 
	private String dong;
	// 페이징 처리할것도...
	public String getCodename1() {
		return codename1;
	}
	public void setCodename1(String codename1) {
		this.codename1 = codename1;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	@Override
	public String toString() {
		return "CommercialBean [codename1=" + codename1 + ", dong=" + dong + "]";
	}
	
	
}
