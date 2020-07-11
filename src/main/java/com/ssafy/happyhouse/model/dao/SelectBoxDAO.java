package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HouseInfoBean;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;

public interface SelectBoxDAO {

	List<SidoCodeDTO> selectSido();

	List<SidoCodeDTO> selectGugun(String sido);

	List<HouseInfo> selectDong(String gugun);

	List<HouseInfo> selectApt(String dong);
	
	List<HouseInfo> selectAptByBean(HouseInfoBean houseInfoBean);

}
