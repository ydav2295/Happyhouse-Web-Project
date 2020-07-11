package com.ssafy.happyhouse.model.dto;

import java.util.Date;

public class Notice {
	private int noticeno;
	private String adminid;
	private String subject;
	private String content;
	private Date regtime;
	
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegtime() {
		return regtime;
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	
}
