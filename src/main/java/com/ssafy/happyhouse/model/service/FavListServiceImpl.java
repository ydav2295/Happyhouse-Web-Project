package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.FavListDAO;
import com.ssafy.happyhouse.model.dto.FavList;
@Service
public class FavListServiceImpl implements FavListService {
	@Autowired
	FavListDAO favListDao;
	@Override
	public boolean insertFavList(FavList favList) {
		// TODO Auto-generated method stub
		return favListDao.insertFavList(favList);
	}

	@Override
	public boolean deleteFavList(int fvNo) {
		// TODO Auto-generated method stub
		return favListDao.deleteFavList(fvNo);
	}

	@Override
	public List<FavList> retrieveFavListById(String id) {
		// TODO Auto-generated method stub
		return favListDao.searchFavListById(id);
	}

	@Override
	public boolean deleteFavListByNo(int no) {
		// TODO Auto-generated method stub
		return favListDao.deleteFavListByNo(no);
	}

}
