package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.CommercialDAO;
import com.ssafy.happyhouse.model.dto.Commercial;
import com.ssafy.happyhouse.model.dto.CommercialBean;
@Service
public class CommercialServiceImpl implements CommercialService {
	@Autowired
	CommercialDAO commercialDao;
	@Override
	public List<Commercial> retrieveCommercial() {
		// TODO Auto-generated method stub
		return commercialDao.searchCommercial();
	}

	@Override
	public List<Commercial> retrieveCommercialByBean(CommercialBean commercialBean) {
		// TODO Auto-generated method stub
		return commercialDao.searchCommercialByBean(commercialBean);
	}

	@Override
	public List<String> retrieveCodeName() {
		// TODO Auto-generated method stub
		return commercialDao.searchCodeName();
	}

}
