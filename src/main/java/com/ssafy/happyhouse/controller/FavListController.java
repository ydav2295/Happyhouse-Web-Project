package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.FavList;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.service.FavListService;
import com.ssafy.happyhouse.model.service.HouseService;

@RestController
@RequestMapping("/favlist")
public class FavListController {
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	@Autowired
	private FavListService favListService;
	@Autowired
	private HouseService houseService;
	@GetMapping("/housedeal")
	public ResponseEntity<HouseDeal>selectHouseDealByNo(int no){
		System.out.println("FavListController - selectHouseDealByNo 호출");
		System.out.println("no: " + no);
		return new ResponseEntity<>(houseService.search(no),HttpStatus.OK);
	}
	
	@GetMapping
	public ResponseEntity<List<FavList>>selectFavListByUserId(String id){
		System.out.println("FavListController - selectFavListByUserId 호출");
		System.out.println("id: " + id);
		return new ResponseEntity<>(favListService.retrieveFavListById(id),HttpStatus.OK);
	}
	@PostMapping
	public ResponseEntity<String>insertFavList(FavList favList){
		System.out.println("FavListController - insertFavList 호출");
		System.out.println("id: " + favList);
		if(favListService.insertFavList(favList)) {
			return new ResponseEntity<>(SUCCESS,HttpStatus.OK);
		}
		return new ResponseEntity<>(FAIL,HttpStatus.NO_CONTENT);
		
	}
	@DeleteMapping
	public ResponseEntity<String>deleteFavList(int favNo){
		System.out.println("FavListController - deleteFavList 호출");
		System.out.println("favNo: " + favNo);
		if (favListService.deleteFavList(favNo)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@DeleteMapping("/deleteByNo")
	public ResponseEntity<String>deleteFavListByNo(int no){
		System.out.println("FavListController - deleteFavListByNo 호출");
		System.out.println("no: " + no);
		if (favListService.deleteFavListByNo(no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}
