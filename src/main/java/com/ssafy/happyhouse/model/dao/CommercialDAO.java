package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Commercial;
import com.ssafy.happyhouse.model.dto.CommercialBean;

public interface CommercialDAO {
	List<Commercial> searchCommercial();
	List<Commercial> searchCommercialByBean(CommercialBean commercialBean);
	List<String> searchCodeName();
}
