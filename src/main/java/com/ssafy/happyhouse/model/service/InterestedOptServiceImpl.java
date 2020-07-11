package com.ssafy.happyhouse.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.InterestedOptDAO;
import com.ssafy.happyhouse.model.dto.InterestedOpt;
@Service
public class InterestedOptServiceImpl implements InterestedOptService {
	@Autowired
	private InterestedOptDAO interestedOptDao;
	@Override
	public boolean insertInterestedOpt(InterestedOpt interestedOpt) {
		// TODO Auto-generated method stub
		return interestedOptDao.insertInterestedOpt(interestedOpt);
	}

	@Override
	public boolean updateInterestedOpt(InterestedOpt interestedOpt) {
		// TODO Auto-generated method stub
		return interestedOptDao.updateInterestedOpt(interestedOpt);
	}

	@Override
	public boolean deleteInterestedOpt(String id) {
		// TODO Auto-generated method stub
		return interestedOptDao.deleteInterestedOpt(id);
	}

	@Override
	public InterestedOpt retrieveInterestedOptByID(String id) {
		// TODO Auto-generated method stub
		return interestedOptDao.selectInterestedOptByID(id);
	}

}
