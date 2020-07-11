package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.SelectBoxDAO;
import com.ssafy.happyhouse.model.dao.SelectBoxDAOImpl;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HouseInfoBean;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;
@Service
public class SelectBoxServiceImpl implements SelectBoxService {
	@Autowired
	private SelectBoxDAO dao;

	public SelectBoxServiceImpl() {
		dao = new SelectBoxDAOImpl();
	}

	@Override
	public List<SidoCodeDTO> selectSido() {
		List<SidoCodeDTO> list = dao.selectSido();
		return list;
	}

	@Override
	public List<SidoCodeDTO> selectGugun(String sido){
		List<SidoCodeDTO> list = dao.selectGugun(sido);
		return list;
	}

	@Override
	public List<HouseInfo> selectDong(String gugun){
		List<HouseInfo> list = dao.selectDong(gugun);
		return list;
	}

	@Override
	public List<HouseInfo> selectApt(String dong) {
		List<HouseInfo> list = dao.selectApt(dong);
		return list;
	}

	@Override
	public List<HouseInfo> selectAptByBean(HouseInfoBean houseInfoBean) {
		// TODO Auto-generated method stub
		return dao.selectAptByBean(houseInfoBean);
	}

}
