package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.FavList;

public interface FavListService {
	boolean insertFavList(FavList favList) ;
	boolean deleteFavList(int fvNo);
	boolean deleteFavListByNo(int no);
	List<FavList> retrieveFavListById(String id);
}
