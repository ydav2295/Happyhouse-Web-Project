package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.dto.Notice;
import com.ssafy.happyhouse.model.dto.NoticeBean;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.MemberService;


@Controller
public class MainController {
	@Autowired
	HouseService houseService;
	@Autowired
	MemberService memberService;
	
	@GetMapping("resetCompare")
	   public String resetCompare(HttpSession session)
	   {
	      session.removeAttribute("cmp1");
	      session.removeAttribute("cmp2");
	      return "redirect:/list";
	   }
	   @GetMapping("compare")
	   public String compare(HttpSession session, int no)
	   {
	      if(session.getAttribute("cmp1") == null)
	         session.setAttribute("cmp1", houseService.search(no));
	      else
	         session.setAttribute("cmp2", houseService.search(no));
	      return "redirect:/list";
	   }
	
	
	
	
	@PostMapping("noticelist")
	private String notice2(String searchType, String searchWord, Model model) {
		searchType = searchType == null? "all" : searchType;
		NoticeBean bean = new NoticeBean();
		bean.setSearchType(searchType);
		
		if (searchType.equals("all") == false) {
			if (searchType.equals("subject"))
				bean.setSubject(searchWord);
			else
				bean.setContent(searchWord);
		}
		
		List<Notice> noticeList = houseService.searchNotice(bean);
		model.addAttribute("noticeList", noticeList);
		
		return "noticelist";
	}
	@GetMapping("noticedetail")
	private String noticeDetail(Model model, int no) {
		Notice notice = houseService.noticeDetail(no);
		model.addAttribute("notice", notice);
		return "noticedetail";
	}
	@GetMapping("writeNotice")
	public void writeNotice() {}
	@PostMapping("insertNotice")
	private String insertNotice(Notice notice) {
	
		houseService.insertNotice(notice);
		return "redirect:/noticelist";
	}
	@GetMapping("modifyNotice")
	public void modifyNotice(int no, Model model) {
		model.addAttribute("notice", houseService.noticeDetail(no));
	}
	@PostMapping("updateNotice")
	private String updateNotice(Notice notice) {
	
		houseService.updateNotice(notice);
		return "redirect:/noticelist";
	}
	@GetMapping("deleteNotice")
	public String deleteNotice(int no) {
		houseService.deleteNotice(no);
		return "redirect:/noticelist";
	}
	
	///////
	
	
	@GetMapping("main")
	public void main() {}
	@GetMapping("qnaindex")
	public void qna(Model model, HttpSession session) {
		model.addAttribute("loginMember", session.getAttribute("loginMember"));
	}
//	@GetMapping("noticedetail")
//	private String noticeDetail(Model model, int no) {
//		Notice notice = houseService.noticeDetail(no);
//		model.addAttribute("notice", notice);
//		return "noticedetail";
//	}
	@GetMapping("noticelist")
	private String notice(Model model) {
		List<Notice> noticeList = houseService.searchNotice();
		model.addAttribute("noticeList", noticeList);
		
		return "noticelist";
	}
	@PostMapping("list")
	private String list2(String searchType,String searchWord,String sortType,String pageNo,Model model) throws SQLException {
		System.out.println("호출됨");
		searchType = searchType == null ? "all" : searchType;
		HousePageBean bean = new HousePageBean();
		bean.setSearchType(searchType);
		if (searchType.equals("all") == false) {
			if (searchType.equals("dong"))
				bean.setDong(searchWord);
			else
				bean.setAptname(searchWord);
		}
		if (sortType.equals("none") == false) {
			if (sortType.equals("lowPrice"))
				bean.setSortType(sortType);
			else
				bean.setSortType(sortType);
		}
		String param = pageNo;
		int page;
		if(param == null)
			page = 1;
		else
			page = Integer.parseInt(param);
		bean.setPageNo(page);
		System.out.println(bean);
		
		
		List<Integer> idxList = new ArrayList<>();
		int startIdx = 10 * (page / 10);
		int lastIdx = (houseService.getSize(bean) / 10) + 1;
		int lastPage = (lastIdx / 10) * 10;
		List<HouseDeal> list = houseService.searchAll(bean);
		model.addAttribute("list", list);
		for(int i = startIdx; i < startIdx + 10; i++)
		{
			if(i == 0)
				continue;
			idxList.add(i);
			if(i >= lastIdx)
				break;
		}
		model.addAttribute("bean", bean);
		model.addAttribute("idxlist", idxList);
		model.addAttribute("nextIdx", startIdx + 10);
		model.addAttribute("prevIdx", startIdx - 1);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("lastIdx", lastIdx);
		return "list";
	}
	
	@GetMapping("list")
	private String list(String searchType,String searchWord,String sortType,String pageNo,Model model) throws SQLException {
		searchType = searchType == null ? "all" : searchType;
		sortType = sortType == null ? "none" : sortType;
		HousePageBean bean = new HousePageBean();
		bean.setSearchType(searchType);
		if (searchType.equals("all") == false) {
			if (searchType.equals("dong"))
				bean.setDong(searchWord);
			else
				bean.setAptname(searchWord);
		}
		if (sortType.equals("none") == false) {
			if (sortType.equals("lowPrice"))
				bean.setSortType(sortType);
			else
				bean.setSortType(sortType);
		}
		String param = pageNo;
		int page;
		if(param == null)
			page = 1;
		else
			page = Integer.parseInt(param);
		bean.setPageNo(page);
		System.out.println(bean);
		
		
		List<Integer> idxList = new ArrayList<>();
		int startIdx = 10 * (page / 10);
		int lastIdx = (houseService.getSize(bean) / 10) + 1;
		int lastPage = (lastIdx / 10) * 10;
		List<HouseDeal> list = houseService.searchAll(bean);
		model.addAttribute("list", list);
		for(int i = startIdx; i < startIdx + 10; i++)
		{
			if(i == 0)
				continue;
			idxList.add(i);
			if(i >= lastIdx)
				break;
		}
		model.addAttribute("bean", bean);
		model.addAttribute("idxlist", idxList);
		model.addAttribute("nextIdx", startIdx + 10);
		model.addAttribute("prevIdx", startIdx - 1);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("lastIdx", lastIdx);
		return "list";
	}
	
	@GetMapping("detail")
	private String detail(int no, Model model) {
		HouseDeal deal = houseService.search(no);
		model.addAttribute("deal", deal);
		return "detail";
	}

	@PostMapping("findpwd")
	private String findpwd(Member member, HttpSession session, Model model) {
		Member memberInfo = memberService.searchPwd(member);
		if(memberInfo != null) {
			session.setAttribute("memberInfo", member);
		}
		else {
			model.addAttribute("errMsg", "존재 하지 않는 회원정보입니다.");
		}
		return "findpwdresult";
	}
	
	@GetMapping("findpwdresult")
	public void findPwdResult() {}

	@GetMapping("findpwdform")
	private void findpwdform() {}
	
	@GetMapping("setnewpwdform")
	private void setnewpwdform() {}
	
	@PostMapping("setnewpwd")
	private String setnewpwd(String pw1, String pw2, HttpSession session, Model model) throws SQLException {
		if(pw1.equals(pw2)) {
			Member member = (Member)session.getAttribute("memberInfo");
			member = memberService.searchById(member);
			member.setPassword(pw1);
			memberService.updateMember(member);
			session.invalidate();
			return "setnewpwdsuccess";
		}else {
			model.addAttribute("errMsg", "비밀번호를 확인해 주세요.");
			return "setnewpwdform";
		}
	}
	
	@GetMapping("deletemember")
	private String deleteMember(HttpSession session) throws SQLException {
		Member member = (Member)session.getAttribute("loginMember");
		String id = member.getId();
		memberService.deleteMember(id);
		return logout(session);
	}

	@PostMapping("updatemember")
	private String updateMember(Member member, HttpSession session) {
		
		memberService.updateMember(member);
		session.setAttribute("loginMember", member);
		return "memberinfo";
	}
	
	@GetMapping("memberupdateform")
	private void memberUpdateForm() {}

	@GetMapping("memberinfo")
	private String memberInfo(Model model, HttpSession session) {
		// TODO Auto-generated method stub
		model.addAttribute("loginMember", session.getAttribute("loginMember"));
		return "memberinfo";
	}
	@GetMapping("favlistmain")
	public String favlistmain(Model model, HttpSession session) {
		System.out.println("세션 확인용 " + session.getAttribute("loginMember"));
		model.addAttribute("loginMember", session.getAttribute("loginMember"));
		return "favlistmain";
	}

	@PostMapping("login")
	private String login(Member member, HttpSession session, Model model) {
		// TODO Auto-generated method stub
		Member loginMember = memberService.signIn(member);
		if (loginMember != null) {
			session.setAttribute("loginMember", loginMember);
		} else {
			System.out.println("유저정보 일치하지 않음");
			//session.setAttribute("errMsg", "아이디 또는 패스워드를 확인해 주십시오.");
		}
		return "redirect:/main";
	}

	@GetMapping("logout")
	private String logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
		return "redirect:/main";
	}
	
	@GetMapping("signupform")
	private void signUpForm() {}

	@PostMapping("signup")
	private String signUp(Member member, HttpSession session, Model model) throws SQLException {
		
		if (memberService.signUp(member)) {
			session.setAttribute("loginMember", member);
			return "redirect:/main";
		} else {
			model.addAttribute("errMsg", "회원 가입 중 문제가 발생했습니다.");
			return "/error";
		}
	}
	
}
