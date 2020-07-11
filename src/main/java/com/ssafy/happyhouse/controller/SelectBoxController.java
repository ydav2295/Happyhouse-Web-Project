package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HouseInfoBean;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.SelectBoxService;
@RestController
public class SelectBoxController {
	@Autowired
	private SelectBoxService service;
	@Autowired
	private HouseService hservice;
	@GetMapping("/sido")
	public ResponseEntity<List<SidoCodeDTO>> sido() {
		return new ResponseEntity<>(service.selectSido(),HttpStatus.OK);
	}
	@GetMapping("/gugun")
	public ResponseEntity<List<SidoCodeDTO>> gugun(String sido) {
		return new ResponseEntity<>(service.selectGugun(sido),HttpStatus.OK);
	}
	@GetMapping("/dong")
	public ResponseEntity<List<HouseInfo>> dong(String gugun) {
		return new ResponseEntity<>(service.selectDong(gugun),HttpStatus.OK);
	}
	@GetMapping("/apt")
	public ResponseEntity<List<HouseInfo>>apt(String dong) {
		return new ResponseEntity<>(service.selectApt(dong),HttpStatus.OK);
	}
	@GetMapping("/selectByBean")
	public ResponseEntity<List<HouseInfo>>selectByBean(HouseInfoBean houseInfoBean) {
		System.out.println("SelectBoxController>selectByBean :"+houseInfoBean);
		return new ResponseEntity<>(service.selectAptByBean(houseInfoBean),HttpStatus.OK);
	}
	@GetMapping("/selectByName")
	public ResponseEntity<List<HouseDeal>> selectByName(HttpServletRequest request) {
		HouseDeal houseDeal = new HouseDeal();
		String jibun = request.getParameter("jibun");
		String AptName = request.getParameter("AptName");
		String dong = request.getParameter("dong");
		houseDeal.setJibun(jibun);
		houseDeal.setAptName(AptName);
		houseDeal.setDong(dong);
		System.out.println("확인");
		List<HouseDeal>list  = hservice.search(houseDeal);
		for (HouseDeal deal : list) {
			System.out.println("controller " +  deal);
		}
		return new ResponseEntity<>(hservice.search(houseDeal),HttpStatus.OK);
	}

}
