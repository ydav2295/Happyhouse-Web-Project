package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Commercial;
import com.ssafy.happyhouse.model.dto.CommercialBean;

public interface CommercialService {
	List<Commercial> retrieveCommercial();
	List<Commercial> retrieveCommercialByBean(CommercialBean commercialBean);
	List<String> retrieveCodeName();
}
