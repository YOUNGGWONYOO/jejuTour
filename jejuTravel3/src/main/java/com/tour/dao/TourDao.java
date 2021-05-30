package com.tour.dao;

import java.util.List;
import java.util.Map;

import com.tour.domain.ReviewCommand;
import com.tour.domain.TourCommand;
import com.tour.domain.TourDetailCommand;

public interface TourDao {
	//tour테이블 전체 레코드(페이징 처리)
	public List<TourCommand> list(Map<String,Integer> map);
	
	//총레코드수
	public int getRowCount(Map<String,Integer> map);
	
	//지역별 인기여행지 레코드(10개)-
	public  List<TourCommand> popList(Map<String,Integer> map);
	
	//tour_detail 테이블 레코드 한개씩
	public List<TourDetailCommand> detailList(int t_id);
	
	//review 테이블에 레코드 insert
	public void insertReview(Map<String, Object> map);
	
	//리뷰 select
	public List<ReviewCommand> selectReview(int t_id);
	
	//리뷰 delete
	public void deleteReview(int r_id);
	
	//좋아요 체크 유무(레코드가 있으면 1, 레코드 없으면 0 반환)
	public int checkGood(Map<String, Object> map);
	
	//좋아요 테이블 레코드 존재 여부(존재하면 1, 존재하지 않으면 0 반환)
	public int goodIsExist(Map<String, Object> map);
	
	//good_check 값 수정
	public void updateGood(Map<String, Object> map);
	
	//테이블에 존재하지 않으면 좋아요 레코드 추가
	public void insertGood(Map<String,Object> map);
	
	//tour테이블 like_cnt update
	public void updateLikeCnt(int t_id);
	
	//찜테이블에 있는지 조회
	public int zzimIsExist(Map<String,Object> map);
	
	//찜테이블에서 삭제
	public void deleteZZim(Map<String,Object> map);
	
	//찜테이블에 추가
	public void insertZZim(Map<String,Object> map);

}
