	package com.ssafy.happyhouse.model.dao;

import com.ssafy.happyhouse.model.dto.InterestedOpt;

public interface InterestedOptDAO {
	public boolean insertInterestedOpt(InterestedOpt interestedOpt);
	public boolean updateInterestedOpt(InterestedOpt interestedOpt);
	public boolean deleteInterestedOpt(String id);
	public InterestedOpt selectInterestedOptByID(String id);
}
