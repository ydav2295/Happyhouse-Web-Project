package com.ssafy.happyhouse;

public class HappyHouseException extends RuntimeException {
	
	public HappyHouseException() {
		super("데이터 처리 중 오류 발생");
	}
	public HappyHouseException(String msg) {
		super(msg);
	}
	
}
