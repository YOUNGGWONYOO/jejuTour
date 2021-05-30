
package com.tour.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.tour.domain.ReviewCommand;
import com.tour.domain.TourCommand;
import com.tour.domain.TourDetailCommand;

@Repository
public class TourDaoImpl  extends SqlSessionDaoSupport  implements TourDao {

	public List<TourCommand> list(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		List<TourCommand> list=getSqlSession().selectList("selectList",map);
		//System.out.println("TourDaoImpl의 List");
		return list;
	}

	public int getRowCount(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		//System.out.println("getRowCount()!");
		return getSqlSession().selectOne("selectCount",map);
	}

	public List<TourDetailCommand> detailList(int t_id) {
		// TODO Auto-generated method stub
		System.out.println("tourdao의 detailList");
		List<TourDetailCommand> list=getSqlSession().selectList("selectDetailList",t_id);
		return list;
	}

	public List<TourCommand> popList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		List<TourCommand> list=getSqlSession().selectList("selectPopList",map);
		return list;
	}

	public void insertReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertReview",map);
	}

	public List<ReviewCommand> selectReview(int t_id) {
		// TODO Auto-generated method stub
		List<ReviewCommand> list=getSqlSession().selectList("selectReview",t_id);
		return list;
	}
	
	public void deleteReview(int r_id) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteReview",r_id);
	}

	public int goodIsExist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int good_ex =getSqlSession().selectOne("goodIsExist", map);
		return good_ex;
	}	
	
	public int checkGood(Map<String, Object> map) { 
		// TODO Auto-generated methodstub 
		int ck_good = getSqlSession().selectOne("checkGood", map); 
		return ck_good; 
	}

	public void updateGood(Map<String, Object> map) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateGood",map);
	}

	public void insertGood(Map<String, Object> map) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertGood",map);
	}

	public void updateLikeCnt(int t_id) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateLikeCnt",t_id);
	}

	public int zzimIsExist(Map<String,Object> map) {
		int zzim_ex=getSqlSession().selectOne("zzimIsExist", map);
		return zzim_ex;//레코드 있으면 1, 없으면 0 반환
	}

	public void deleteZZim(Map<String, Object> map) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteZZim",map);
	}
	
	public void insertZZim(Map<String, Object> map) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertZZim",map);
	}

	
	

}
