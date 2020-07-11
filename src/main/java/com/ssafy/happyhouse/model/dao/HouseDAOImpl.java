package com.ssafy.happyhouse.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.Notice;
import com.ssafy.happyhouse.model.dto.NoticeBean;

@Repository
public class HouseDAOImpl implements HouseDAO{
	private final static String NS = "com.ssafy.happyhouse.model.dao.HouseDAO.";
	@Autowired
	SqlSession sqlSession;
	
	private int size;
//	public HouseDAOImpl() {
//		this.size = sqlSession.selectOne(NS+"HouseDAOImpl");
//	}
	public void loadData() { }
	
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<HouseDeal> searchAll(HousePageBean  bean){
		if(bean.getPageNo() == 0) {
			return sqlSession.selectList(NS+"searchAll",bean);
		}
		int offset = (bean.getPageNo()-1)*10;
		RowBounds bounds = new RowBounds(offset,10);
		return sqlSession.selectList(NS+"searchAll",bean,bounds);	
	}
	
	public int getSize(HousePageBean  bean){
		this.size = sqlSession.selectOne(NS+"getSize",bean);
		return size;
		// 아파트 정보의 총 갯수 리턴
	}
	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환한다.<br/>
	 * 법정동+아파트명을 이용하여 HouseInfo에서 건축연도, 법정코드, 지번, 이미지 정보를 찾아서 HouseDeal에 setting한 정보를 반환한다. 
	 * @param no	검색할 아파트 식별 번호
	 * @return		아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	public HouseDeal search(int no) {
		return sqlSession.selectOne(NS+"search",no);
	}
	@Override
	public List<Notice> searchNotice() {
		return sqlSession.selectList(NS+"searchNotice");
	}
	@Override
	public Notice searchNoticeByNo(int no) {
		return sqlSession.selectOne(NS+"searchNoticeByNo",no);
	}
	@Override
	public List<HouseDeal> searchByName(HouseDeal houseDeal) {
		System.out.println("마지막 확인");
		System.out.println(houseDeal);
		houseDeal.setDong(houseDeal.getDong().trim());
		return sqlSession.selectList(NS+"searchByName",houseDeal);
	}
	
	
	
	/////////
	@Override
	public void insertNotice(Notice notice) {
		sqlSession.insert(NS+"insertNotice", notice);
		
	}

	@Override
	public void updateNotice(Notice notice) {
		sqlSession.update(NS+"updateNotice", notice);
		
	}

	@Override
	public void deleteNotice(int no) {
		sqlSession.delete(NS+"deleteNotice", no);
		
	}
	@Override
	public List<Notice> searchNotice(NoticeBean bean) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+"searchNoticeBean", bean);
	}
}