package com.plan.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plan.dao.PlanDao;
import com.plan.domain.PlanCommand;
import com.plan.domain.PlanDayCommand;
import com.plan.domain.PlanInsertCommand;
import com.plan.domain.PlanMapCommand;
import com.plan.domain.PlanSendCommand;
import com.plan.domain.PlanTourCommand;


@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	PlanDao plandao;
	
	public List<PlanCommand> planList(String m_id) {
		// TODO Auto-generated method stub
		return plandao.list(m_id);
	}
	
	public List<PlanDayCommand> PlanDay(int p_id) {
		// TODO Auto-generated method stub
		
		return plandao.planDay(p_id);
	}

	public List<Integer> PlanDetail(int day_seq) {
		// TODO Auto-generated method stub
		
		return plandao.planDetail(day_seq);
	}
	public List<PlanSendCommand> PlanSend(Map<String,Integer> sendMap) {
		// TODO Auto-generated method stub
		
		return plandao.planSend(sendMap);
	}

	public int PlanTotalDay(int plan_id) {
		// TODO Auto-generated method stub
		return plandao.PlanTotalDay(plan_id);
	}

	public List<PlanMapCommand> MapSend(Map<String, Integer> send) {
		// TODO Auto-generated method stub
		return plandao.MapSend(send);
	}

	public void PlanInsert(PlanInsertCommand pic) {
		// TODO Auto-generated method stub
		plandao.PlanInsert(pic);
	}

	public void PlanDayInsert(Map<String,Object> pdi) {
		// TODO Auto-generated method stub
		plandao.PlanDayInsert(pdi);
	}

	public int PlanGetId(String m_id) {
		// TODO Auto-generated method stub
		return plandao.PlanGetId(m_id);
	}

	public List<PlanTourCommand> ZZim(String m_id) {
		// TODO Auto-generated method stub
		return plandao.ZZim(m_id);
	}

	public int PlanDaySeq(Map<String, Integer> daySeq) {
		// TODO Auto-generated method stub
		return plandao.PlanDaySeq(daySeq);
	}

	public void PlanDayDetail(Map<String, Object> daydetail) {
		// TODO Auto-generated method stub
		plandao.PlanDayDetail(daydetail);
	}

	public void PlanDeleteDetail(int day_seq) {
		// TODO Auto-generated method stub
		plandao.PlanDeleteDetail(day_seq);
	}

	public PlanMapCommand PlanTour(int t_id) {
		// TODO Auto-generated method stub
		return plandao.PlanTour(t_id);
	}

	public PlanCommand getPlan(int plan_id) {
		// TODO Auto-generated method stub
		return plandao.getPlan(plan_id);
	}

	public void planUpdate(Map<String, Object> m) {
		// TODO Auto-generated method stub
		plandao.planUpdate(m);
	}

	public void minusday(int plan_id) {
		// TODO Auto-generated method stub
		plandao.minusday(plan_id);
	}

	public void plusday(int plan_id) {
		// TODO Auto-generated method stub
		plandao.plusday(plan_id);
	}

	public void planDelete(int plan_id) {
		// TODO Auto-generated method stub
		plandao.planDelete(plan_id);
	}

	public List<PlanTourCommand> planSearch(String search) {
		// TODO Auto-generated method stub
		return plandao.planSearch(search);
	}

	

}
