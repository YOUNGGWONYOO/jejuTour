package com.tour.service;

import java.util.List;
import java.util.Map;

import com.tour.domain.ReviewCommand;
import com.tour.domain.TourCommand;
import com.tour.domain.TourDetailCommand;
import com.tour.util.PagingUtil;

public interface TourService {
	
	//전체 여행지 조회
	public int listCount(Map<String, Integer> map);//총 레코드 개수
	public List<TourCommand> list(int total_count,Map<String, Integer> map);//전체 레코드
	public PagingUtil page(int currentPage,int total_count,int region,int c_tourid,int c_subid,String pageUrl);
	
	//인기 여행지 조회(10개)
	public List<TourCommand> popList(Map<String, Integer> map);
	
	//클릭했을때 자세히 조회
	public List<TourDetailCommand> detailList(int t_id);
	
	//여행지 리뷰 insert
	public void insertReview(Map<String, Object> map);
	
	//여행지 리뷰 select
	public List<ReviewCommand> selectReview(int t_id);
	
	//여행지 리뷰 delete
	public void deleteReview(int r_id);
	
	//good테이블에서 좋아요 체크 유무(회원아이디, 여행지 일련번호)
	public int checkGood(Map<String,Object> map);
	
	//테이블에 존재하는지 확인하고 좋아요(1)인 레코드 추가/좋아요 유무 변경
	public void insertGood(Map<String,Object> map);
	
	//좋아요 유무(0)으로 바꾸기
	public void deleteGood(Map<String,Object> map);
	
	//tour테이블 like_cnt update
	public void updateLikeCnt(int t_id);
	
	//찜테이블에 있는지 조회
	public int zzimIsExist(Map<String,Object> map);
	
	//찜테이블에서 삭제
	public void deleteZZim(Map<String,Object> map);
	
	//찜테이블에 추가
	public void insertZZim(Map<String,Object> map);
	
}
