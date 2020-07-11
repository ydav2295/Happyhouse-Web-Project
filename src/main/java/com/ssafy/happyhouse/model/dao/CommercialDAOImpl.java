package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Commercial;
import com.ssafy.happyhouse.model.dto.CommercialBean;
@Repository
public class CommercialDAOImpl implements CommercialDAO {
	private final static String NS = "com.ssafy.happyhouse.model.dao.CommercialDAO.";
	@Autowired
	SqlSession sqlsession;
	@Override
	public List<Commercial> searchCommercial() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NS+"searchCommercial");
	}
	@Override
	public List<Commercial> searchCommercialByBean(CommercialBean commercialBean) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NS+"searchCommercialByCN1",commercialBean);
	}
	@Override
	public List<String> searchCodeName() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NS+"searchCodeName");
	}
}
