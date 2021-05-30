package com.tour.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tour.dao.TourDao;
import com.tour.domain.ReviewCommand;
import com.tour.domain.TourCommand;
import com.tour.domain.TourDetailCommand;
import com.tour.util.PagingUtil;

@Service
public class TourServiceImpl implements TourService {

	@Autowired
	private TourDao tourDao;
	
	public PagingUtil page(int currentPage, int total_count, int region,int c_tourid,int c_subid, String pageUrl) {
		// TODO Auto-generated method stub
		//페이징 처리 1.현재페이지 2.총레코드수 3.지역 4.페이지당 게시물 수 5.블럭당 페이지수 6.요청명령어
		PagingUtil page=new PagingUtil(currentPage,total_count,region,c_tourid,c_subid,6,3,pageUrl);
		return page;
	}

	public int listCount(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		
		/*
		Map<String,Integer> map=new HashMap<String,Integer>();
		map.put("region", region);
		map.put("c_tourid", c_tourid);
		map.put("c_subid", c_subid);
		//--> TourMapper.xml에서 #{c_tourid}가 getC_tourid 와 같다.
	     */
		int total_count=tourDao.getRowCount(map);
		return total_count;
	}

	public List<TourCommand> list(int total_count,Map<String, Integer> map) {
		// TODO Auto-generated method stub
		List<TourCommand> list=null;
		if(total_count > 0) {
			list=tourDao.list(map);
			System.out.println("ListController의 list=>"+list);
		}else {
			list=Collections.emptyList();//0 적용
		}
		return list;
	}
	
	public List<TourCommand> popList(Map<String, Integer> map) {
		List<TourCommand> list=tourDao.popList(map);
		return list;
	}
	
	public List<TourDetailCommand> detailList(int t_id){
		List<TourDetailCommand> list=tourDao.detailList(t_id);
		return list;
	}

	public void insertReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		tourDao.insertReview(map);
	}

	public List<ReviewCommand> selectReview(int t_id) {
		// TODO Auto-generated method stub
		List<ReviewCommand> list=tourDao.selectReview(t_id);
		return list;
	}
	
	public void deleteReview(int r_id) {
		// TODO Auto-generated method stub
		tourDao.deleteReview(r_id);
	}


	  
	  public int checkGood(Map<String, Object> map) { 
		  
		  // TODO Auto-generated methodstub 
		  int ck_good = tourDao.checkGood(map); 
		  return ck_good; 
		  }
	  


	public void insertGood(Map<String, Object> map) {
		// TODO Auto-generated method stub
		//좋아요 테이블에 레코드 있는지 확인
		int good_ex =tourDao.goodIsExist(map);
		//테이블에 있다면 좋아요 유무를 바꿔주고, 없다면 좋아요유무(1)로 레코드 삽입
		if(good_ex ==1) {
			tourDao.updateGood(map);
		}else {
			tourDao.insertGood(map);
		}
	}
	
	public void deleteGood(Map<String, Object> map) {
		tourDao.updateGood(map);
	}
	

	public void updateLikeCnt(int t_id) {
		// TODO Auto-generated method stub
		tourDao.updateLikeCnt(t_id);
	}

	public int zzimIsExist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int zzim_ex=tourDao.zzimIsExist(map);
		return zzim_ex;
	}

	public void deleteZZim(Map<String, Object> map) {
		// TODO Auto-generated method stub
		tourDao.deleteZZim(map);
	}

	public void insertZZim(Map<String, Object> map) {
		// TODO Auto-generated method stub
		tourDao.insertZZim(map);
	}





	
	
}
