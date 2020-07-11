package com.ssafy.happyhouse.model.dto;

public class HouseInfoBean {
	private String jibun; 
	private String dong; 
	private String AptName;
	
	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return AptName;
	}

	public void setAptName(String aptName) {
		AptName = aptName;
	}

	@Override
	public String toString() {
		return "HouseInfoBean [jibun=" + jibun + ", dong=" + dong + ", AptName=" + AptName + "]";
	}
	
}
