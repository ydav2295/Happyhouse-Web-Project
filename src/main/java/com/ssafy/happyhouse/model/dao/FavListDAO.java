package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.FavList;

public interface FavListDAO {
	boolean insertFavList(FavList favList) ;
	boolean deleteFavList(int fvNo);
	boolean deleteFavListByNo(int no);
	List<FavList> searchFavListById(String id);
}
