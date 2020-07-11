package com.ssafy.happyhouse.model.dto;

public class QnABean {
	private String searchType;
	private String value;
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "QnABean [searchType=" + searchType + ", value=" + value + "]";
	}
	
	
}
