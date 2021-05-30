package com.plan.service;

import java.util.List;
import java.util.Map;

import com.plan.domain.PlanCommand;
import com.plan.domain.PlanDayCommand;
import com.plan.domain.PlanInsertCommand;
import com.plan.domain.PlanMapCommand;
import com.plan.domain.PlanSendCommand;
import com.plan.domain.PlanTourCommand;


public interface PlanService {
	public List<PlanCommand> planList(String member_id);
	public List<PlanDayCommand> PlanDay(int member_id);
	public List<Integer> PlanDetail(int day_seq);
	public List<PlanSendCommand> PlanSend(Map<String,Integer> sendMap);
	public int PlanTotalDay(int plan_id);
	public List<PlanMapCommand> MapSend(Map<String,Integer> send);
	public void PlanInsert(PlanInsertCommand pic);
	public void PlanDayInsert(Map<String,Object> pdi);
	public int PlanGetId(String m_id);
	public List<PlanTourCommand> ZZim(String m_id);
	public int PlanDaySeq(Map<String,Integer> daySeq);
	public void PlanDayDetail(Map<String,Object> daydetail);
	public void PlanDeleteDetail(int day_seq);
	public PlanMapCommand PlanTour(int t_id);
	public PlanCommand getPlan(int plan_id);
	public void planUpdate(Map<String,Object> m);
	public void minusday(int plan_id);
	public void plusday(int plan_id);
	public void planDelete(int plan_id);
	public List<PlanTourCommand> planSearch(String search);
}
