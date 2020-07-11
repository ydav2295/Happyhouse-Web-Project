package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dao.HouseDAO;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.Notice;
import com.ssafy.happyhouse.model.dto.NoticeBean;
@Service
public class HouseServiceImpl implements HouseService{
	@Autowired
	private HouseDAO dao;

	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<HouseDeal> searchAll(HousePageBean  bean){
		return dao.searchAll(bean);
	}
	
	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환. 
	 * @param no	검색할 아파트 식별 번호
	 * @return		아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	public HouseDeal search(int no) {
		HouseDeal deal = dao.search(no);
		if(deal == null) {
			throw new HappyHouseException(String.format("거래 번호 %d번에 해당하는 거래정보는 존재하지 않습니다.", no));
		}
		return deal;
	}
	@Override
	public List<Notice> searchNotice() {
		return dao.searchNotice();
	}
	@Override
	public Notice noticeDetail(int no) {
		return dao.searchNoticeByNo(no);
	}
	@Override
	public List<HouseDeal> search(HouseDeal houseDeal) {
		System.out.println("dao 호출됨");
		System.out.println(houseDeal);
		List<HouseDeal> deal = dao.searchByName(houseDeal);
		System.out.println(deal);
		if(deal == null) {
			throw new HappyHouseException(String.format("거래 번호 %s에 해당하는 거래정보는 존재하지 않습니다.", houseDeal));
		}
		return deal;
	}

	@Override
	public int getSize(HousePageBean bean) {
		// TODO Auto-generated method stub
		return dao.getSize(bean);
	}
	
	
	
	//////
	@Override
	public void insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		dao.insertNotice(notice);
		
	}
	@Override
	public void updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		dao.updateNotice(notice);
		
	}

	@Override
	public void deleteNotice(int no) {
		// TODO Auto-generated method stub
		dao.deleteNotice(no);
		
	}
	@Override
	public List<Notice> searchNotice(NoticeBean bean) {
		// TODO Auto-generated method stub
		return dao.searchNotice(bean);
	}
	
	
	
}