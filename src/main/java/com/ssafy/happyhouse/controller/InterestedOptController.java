package com.ssafy.happyhouse.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.InterestedOpt;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.InterestedOptService;
import com.ssafy.happyhouse.model.service.SelectBoxService;
@RestController
@RequestMapping("/intopt")
public class InterestedOptController {
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private InterestedOptService interestedOptService;
	
	@Autowired
	private HouseService houseService;
	
	@GetMapping
	public ResponseEntity<InterestedOpt>optSlectByID(String id) {
		System.out.println("IntOptController - selectByID 호출");
		System.out.println("id: " + id);
		return new ResponseEntity<>(interestedOptService.retrieveInterestedOptByID(id),HttpStatus.OK);
	}
	@PostMapping
	public ResponseEntity<String> optInsert(InterestedOpt interestedOpt){
		System.out.println("IntOptController - optInsert 호출");
		System.out.println("InterestedOpt: " + interestedOpt);
		if (interestedOptService.insertInterestedOpt(interestedOpt)) {
   			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
   		}
   		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	@PutMapping
	public ResponseEntity<String> optUpdate(InterestedOpt interestedOpt){
		System.out.println("IntOptController - optUpdate 호출");
		System.out.println(interestedOpt);
		if (interestedOptService.updateInterestedOpt(interestedOpt)) {
   			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
   		}
   		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	@DeleteMapping
	public ResponseEntity<String> deleteBoard(String id) {
		System.out.println("IntOptController - deleteBoard 호출");
		System.out.println("id: " + id);
		if (interestedOptService.deleteInterestedOpt(id)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/apt")
	public ResponseEntity<List<HouseDeal>>apt(String dong,String id) { // 오차범위도 넣기...
		System.out.println("apt실행  : " + dong + " " + id);
		HousePageBean bean = new HousePageBean();
		bean.setDong(dong); // 오름 내림차순도 넣기...
		double range = 0.2;
		List<HouseDeal>list = houseService.searchAll(bean);
		InterestedOpt interestedOpt = interestedOptService.retrieveInterestedOptByID(id);
		System.out.println("intService : ");
		System.out.println(interestedOpt);
		
		
		int dealPrice;
		System.out.println("가격 : "+interestedOpt.getPrice());
		int myPrice = interestedOpt.getPrice() != "" ?  Integer.parseInt(interestedOpt.getPrice().trim()) : 0;
		int myFloor = interestedOpt.getFloor() != "" ? Integer.parseInt(interestedOpt.getFloor().trim()) : 0;
		int mySpace = interestedOpt.getSpace() != "" ? Integer.parseInt(interestedOpt.getSpace().trim()) : 0;
		
		System.out.println("여기까지 정상실행 ");
		System.out.println(myPrice);
		System.out.println(myFloor);
		System.out.println(mySpace);
		List<HouseDeal>data = new ArrayList<HouseDeal>();
		for (HouseDeal houseDeal : list) {
			dealPrice = houseDeal.getDealAmount()!="" ? Integer.parseInt(houseDeal.getDealAmount().trim().replaceAll(",", "")) : 0;
//			houseDeal.getFloor(); // int
//			houseDeal.getArea();  //double
			if(myPrice != 0 && dealPrice !=0 && (dealPrice > myPrice*(1+range) || dealPrice < myPrice*(1-range) )) {
				continue;
			}
			if(myFloor != 0 && houseDeal.getFloor() != 0 && (houseDeal.getFloor() > (1+range)*myFloor || houseDeal.getFloor() < (1-range)*myFloor )) {
				continue;
			}
			if(mySpace != 0 && houseDeal.getArea() != 0.0 && (houseDeal.getArea() > (1+range)*mySpace || houseDeal.getArea() < (1-range)*mySpace)) {
				continue;
			}
			data.add(houseDeal);
		}
		

		return new ResponseEntity<>(data,HttpStatus.OK);
	}
}
