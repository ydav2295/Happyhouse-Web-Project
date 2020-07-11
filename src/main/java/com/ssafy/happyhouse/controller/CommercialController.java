package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Commercial;
import com.ssafy.happyhouse.model.dto.CommercialBean;
import com.ssafy.happyhouse.model.service.CommercialService;

@RestController
@RequestMapping("/commercial")
public class CommercialController {

	@Autowired
	private CommercialService commercialService;
	
	@GetMapping
	public ResponseEntity<List<Commercial>>selectCommercialAll(){
		return new ResponseEntity<>(commercialService.retrieveCommercial(),HttpStatus.OK);
	}
	@GetMapping("/bean")
	public ResponseEntity<List<Commercial>>selectCommercialByBean(CommercialBean commercialBean){
		commercialBean.setDong(commercialBean.getDong().trim());
		System.out.println("상권-bean"+commercialBean);
		return new ResponseEntity<>(commercialService.retrieveCommercialByBean(commercialBean),HttpStatus.OK);
	}
	@GetMapping("/codename")
	public ResponseEntity<List<String>>selectCodeName(){
		return new ResponseEntity<>(commercialService.retrieveCodeName(),HttpStatus.OK);
	}
}
