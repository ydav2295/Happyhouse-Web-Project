package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.QnA;
import com.ssafy.happyhouse.model.dto.QnABean;
import com.ssafy.happyhouse.model.service.QnAService;

@RestController
@RequestMapping("/api/qna")
public class QnAController {

	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private QnAService qnaService;

	@GetMapping
	public ResponseEntity<List<QnA>> retrieveBoard() throws Exception {
		
		return new ResponseEntity<List<QnA>>(qnaService.retrieveQnA(), HttpStatus.OK);
	}
	@GetMapping("/bean")
	public ResponseEntity<List<QnA>> retrieveBoardByBean(QnABean qnABean) throws Exception {
		System.out.println(qnABean);
		return new ResponseEntity<List<QnA>>(qnaService.retrieveQnAByBean(qnABean), HttpStatus.OK);
	}
	
	@GetMapping("{qnaNo}")
	public ResponseEntity<QnA> detailQnA(@PathVariable int qnaNo) {
		return new ResponseEntity<QnA>(qnaService.detailQnA(qnaNo), HttpStatus.OK);
	}
    
   	@PostMapping
   	public ResponseEntity<String> writeQnA(QnA qna) {
   		System.out.println("호출성공 :" + qna);
   		if (qnaService.writeQnA(qna)) {
   			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
   		}
   		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
   	}
    
   	@PutMapping("{qnaNo}")
   	public ResponseEntity<String> updateQnA(QnA qna) {
   		
   		if (qnaService.updateQnA(qna)) {
   			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
   		}
   		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
   	}
    
	@DeleteMapping("{qnaNo}")
	public ResponseEntity<String> deleteBoard(@PathVariable int qnaNo) {
		if (qnaService.deleteQnA(qnaNo)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}