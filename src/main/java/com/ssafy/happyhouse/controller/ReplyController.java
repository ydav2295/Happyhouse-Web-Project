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

import com.ssafy.happyhouse.model.dto.ReplyBoard;
import com.ssafy.happyhouse.model.service.ReplyBoardService;

@RestController
@RequestMapping("/api/reply")
public class ReplyController {
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	@Autowired
	private ReplyBoardService replyBoardService;

	@GetMapping("{qnaNo}")
	public ResponseEntity<List<ReplyBoard>> retrieveReply(@PathVariable int qnaNo) throws Exception {
		return new ResponseEntity<List<ReplyBoard>>(replyBoardService.retrieveReplyBoardByQnANo(qnaNo), HttpStatus.OK);
	}
	@GetMapping("/detail/{replyNo}")
	public ResponseEntity<ReplyBoard> retrieveReplyByReplyNo(@PathVariable int replyNo) throws Exception {
		return new ResponseEntity<ReplyBoard>(replyBoardService.retrieveReplyBoardByReplyNo(replyNo), HttpStatus.OK);
	}
	@PostMapping
	public ResponseEntity<String> writeReply(ReplyBoard replyBoard) {
		if (replyBoardService.writeReplyBoard(replyBoard)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	@PutMapping
	public ResponseEntity<String> updateReply(ReplyBoard replyBoard) {

		if (replyBoardService.updateReplyBoard(replyBoard)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	@DeleteMapping("{replyNo}")
	public ResponseEntity<String> deleteReply(@PathVariable int replyNo) {
		if (replyBoardService.deleteReplyBoard(replyNo)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}
