package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HouseInfoBean;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;
@Repository
public class SelectBoxDAOImpl implements SelectBoxDAO {
	private final static String NS = "com.ssafy.happyhouse.model.dao.SelectBoxDAO.";
	@Autowired
	SqlSession sqlSession;
	@Override
	public List<SidoCodeDTO> selectSido(){
		return sqlSession.selectList(NS+"selectSido");	
	}

	@Override
	public List<SidoCodeDTO> selectGugun(String sido) {
		return sqlSession.selectList(NS+"selectGugun",sido);	
	}

	@Override
	public List<HouseInfo> selectDong(String gugun) {
		return sqlSession.selectList(NS+"selectDong",gugun);
	}

	@Override
	public List<HouseInfo> selectApt(String dong) {
		return sqlSession.selectList(NS+"selectApt",dong);
	}

	@Override
	public List<HouseInfo> selectAptByBean(HouseInfoBean houseInfoBean) {
		// TODO Auto-generated method stub
		System.out.println("dao - selectAptByBean 호출 : "+houseInfoBean );
		System.out.println(sqlSession.selectList(NS+"selectAptByBean",houseInfoBean));
		return sqlSession.selectList(NS+"selectAptByBean",houseInfoBean);
	}

	


}
