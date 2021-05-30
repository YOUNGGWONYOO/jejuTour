package com.plan.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.plan.domain.PlanCommand;
import com.plan.domain.PlanDayCommand;
import com.plan.domain.PlanInsertCommand;
import com.plan.domain.PlanMapCommand;
import com.plan.domain.PlanSendCommand;
import com.plan.domain.PlanTourCommand;

@Repository
public class PlanDaoImpl extends SqlSessionDaoSupport implements PlanDao {

	public List<PlanCommand> list(String m_id) {
		// TODO Auto-generated method stub
		List<PlanCommand> list=getSqlSession().selectList("planList",m_id);
		return list;
	}
	
	public List<PlanDayCommand> planDay(int p_id) {
		// TODO Auto-generated method stub
		List<PlanDayCommand> daylist = getSqlSession().selectList("planDay",p_id);
		return daylist;
	}

	public List<Integer> planDetail(int day_seq) {
		// TODO Auto-generated method stub
		List<Integer> plandetail = getSqlSession().selectList("planDetail_id",day_seq);
		return plandetail;
	}
	public List<PlanSendCommand> planSend(Map<String,Integer> sendMap) {
		// TODO Auto-generated method stub
		List<PlanSendCommand> planSend = getSqlSession().selectList("planSend",sendMap);
		return planSend;
	}

	public int PlanTotalDay(int plan_id) {
		// TODO Auto-generated method stub
		
		return getSqlSession().selectOne("planTotalDay",plan_id);
	}
	
	public List<PlanMapCommand> MapSend(Map<String,Integer> sendMap) {
		// TODO Auto-generated method stub
		List<PlanMapCommand> MapSend = getSqlSession().selectList("MapSend",sendMap);
		return MapSend;
	}

	public void PlanInsert(PlanInsertCommand pic) {
		// TODO Auto-generated method stub
		getSqlSession().insert("PlanInsert",pic);
	}

	public void PlanDayInsert(Map<String,Object> pdi) {
		// TODO Auto-generated method stub
		getSqlSession().insert("PlanDayInsert",pdi);
	}

	public int PlanGetId(String m_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("planGetId",m_id);
	}

	public List<PlanTourCommand> ZZim(String m_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("ZZim",m_id);
	}

	public int PlanDaySeq(Map<String, Integer> daySeq) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("PlanDaySeq",daySeq);
	}

	public void PlanDayDetail(Map<String, Object> daydetail) {
		// TODO Auto-generated method stub
		getSqlSession().insert("PlanDayDetail",daydetail);
	}

	public void PlanDeleteDetail(int day_seq) {
		// TODO Auto-generated method stub
		getSqlSession().delete("PlanDeleteDetail", day_seq);
	}

	public PlanMapCommand PlanTour(int t_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("PlanTour",t_id);
	}

	public PlanCommand getPlan(int plan_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("getPlan",plan_id);
	}

	public void planUpdate(Map<String, Object> m) {
		// TODO Auto-generated method stub
		getSqlSession().update("planUpdate", m);
	}
	public void minusday(int plan_id) {
		getSqlSession().delete("minusday",plan_id);
	}
	public void plusday(int plan_id) {
		getSqlSession().insert("plusday",plan_id);
	}

	public void planDelete(int plan_id) {
		// TODO Auto-generated method stub
		getSqlSession().delete("planDelete",plan_id);
	}

	public List<PlanTourCommand> planSearch(String search) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("planSearch",search);
	}
	
	
	
}
