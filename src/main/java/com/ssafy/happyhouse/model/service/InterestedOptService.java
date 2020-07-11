package com.ssafy.happyhouse.model.service;

import com.ssafy.happyhouse.model.dto.InterestedOpt;

public interface InterestedOptService {
	public boolean insertInterestedOpt(InterestedOpt interestedOpt);
	public boolean updateInterestedOpt(InterestedOpt interestedOpt);
	public boolean deleteInterestedOpt(String id);
	public InterestedOpt retrieveInterestedOptByID(String id);
}
