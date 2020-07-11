package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.FavList;

@Repository
public class FavListDAOImpl implements FavListDAO {
	private final static String NS = "com.ssafy.happyhouse.model.dao.FavListDAO.";
	@Autowired
	SqlSession sqlsession;

	@Override
	public boolean insertFavList(FavList favList) {
		System.out.println("daoInsert : "+ favList);
		if(sqlsession.insert(NS+"insertFavList",favList) == 0){
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteFavList(int fvNo) {
		if(sqlsession.delete(NS+"deleteFavList",fvNo) == 0){
			return false;
		}
		return true;
	}

	@Override
	public List<FavList> searchFavListById(String id) {
		return sqlsession.selectList(NS+"searchFavListById",id);
	}

	@Override
	public boolean deleteFavListByNo(int no) {
		if(sqlsession.delete(NS+"deleteFavListByNo",no) == 0){
			return false;
		}
		return true;
	}
	
}
