package com.plan.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.plan.domain.PlanCommand;
import com.plan.domain.PlanDayCommand;
import com.plan.domain.PlanDayDetailCommand;
import com.plan.domain.PlanInsertCommand;
import com.plan.domain.PlanMapCommand;
import com.plan.domain.PlanSendCommand;

import com.plan.domain.PlanTourCommand;
import com.plan.service.PlanService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Controller
@RequestMapping("/plan/*")
public class PlanController {
	@Autowired
	PlanService planService;
	
	@RequestMapping("/planList.do")
	public ModelAndView planList(String m_id) {
		System.out.println("m_id=>"+m_id);
		if(m_id.equals("")){
			return new ModelAndView("redirect:/member/login.do");
		}else if(m_id!="") {
		List<PlanCommand> list = planService.planList(m_id);//회원id test -> 나중에 Session으로 가져올꺼
		ModelAndView mav = new ModelAndView("plan/planList");
		mav.addObject("list",list);
		mav.addObject("member_id",m_id);
		return mav;
		}
		return new ModelAndView("redirect:/member/login.do");
	}
	@RequestMapping("/planDetail.do")
	public ModelAndView planDetail(@RequestParam(value="plan_id") int plan_id,
			@RequestParam(value="selectday",defaultValue="1") int selectday) {
		
		PlanCommand plancommand = planService.getPlan(plan_id);

        SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
        String dprt_date = format.format(plancommand.getDprt_date());
        String arrive_date = format.format(plancommand.getArrive_date());
       
        
//        String temp;
//        String temp2;
//        temp.replace("-", "");
//        temp.replace("-", "");
//        temp2.replace("-", "");
//        temp2.replace("-", "");
//		int totalday = Integer.parseInt(temp2)-Integer.parseInt(temp)+1;
//		System.out.println("temp="+temp+"   temp2="+temp2+"   dprt_date="+dprt_date+"  arrive_date="+arrive_date);
        ModelAndView mav = new ModelAndView("plan/planDetail");
		//mav.addObject("totalday",totalday);
        mav.addObject("plancommand",plancommand);
		mav.addObject("dprt_date",dprt_date);
		mav.addObject("arrive_date",arrive_date);
		mav.addObject("selectday",selectday);
		mav.addObject("plan_id",plan_id);
		return mav;
	}
	@RequestMapping(value="/NaverMap.do",method=RequestMethod.POST)
	public ModelAndView NaverMap(int plan_id,@RequestParam(value="selectday",defaultValue="1") int selectday) {
		System.out.println("naver selectday ->"+selectday);
		System.out.println("naver plan_id ->"+plan_id);
		//System.out.println("naver planDeatailId -> "+planDetailId);
		Map<String,Integer> sendMap=new HashMap<String,Integer>();
		sendMap.put("plan_id", plan_id);
		sendMap.put("selectday", selectday);
		List<PlanMapCommand> pmc = planService.MapSend(sendMap);
        System.out.println("pmc = "+pmc);
		
        Map<String,Double[]> test = new HashMap<String, Double[]>();
        ModelAndView mav = new ModelAndView("plan/NaverMap");
        if(!pmc.equals("")) {
			for (PlanMapCommand list : pmc) {
				String t_name = list.getT_name();
				Double[] arr2 = new Double[2];
				arr2[0] = Double.parseDouble(list.getX());
				arr2[1] = Double.parseDouble(list.getY());
				test.put(t_name, arr2);
				System.out.println("for문 돌아감");
			}
        }System.out.println("Naver test = "+test);

		if(!test.equals(""))
			mav.addObject("maptest",JSONArray.fromObject(test));
		return mav;
	}
	
	@RequestMapping(value="/NaverInsertMap.do",method=RequestMethod.POST)
	public ModelAndView NaverInsertMap(@RequestParam(value="nArr") List<Integer> nArr) {
		
		System.out.println(nArr);
		System.out.println(nArr.size());
		List<PlanMapCommand> pmc = new ArrayList<PlanMapCommand>();
		for(int i =0;i<nArr.size();i++) {
			pmc.add(planService.PlanTour(nArr.get(i)));//PlanMapCommmand
			//반환값을 pmc.add
		}
		
        Map<String,Double[]> test = new HashMap<String, Double[]>();
        
        ModelAndView mav = new ModelAndView("plan/NaverMap");
        if(!pmc.equals("")) {
			for (PlanMapCommand list : pmc) {
				String t_name = list.getT_name();
				Double[] arr2 = new Double[2];
				arr2[0] = Double.parseDouble(list.getX());
				arr2[1] = Double.parseDouble(list.getY());
				test.put(t_name, arr2);
				System.out.println("for문 돌아감");
			}
        }System.out.println("Naver test = "+test);

		if(!test.equals(""))
			mav.addObject("maptest",JSONArray.fromObject(test));
		return mav;
	}
	
	@RequestMapping("/planInsert.do")
	public ModelAndView planInsert(HttpServletRequest request,
			PlanInsertCommand planinsertcommand)
	{
		String temp1 = planinsertcommand.getArrive_date().replace("-","");
		String temp2 = planinsertcommand.getDprt_date().replace("-","");
		int totalday = Integer.parseInt(temp1)-Integer.parseInt(temp2)+1;
		System.out.println(totalday);
	    int selectday=1;
	    planService.PlanInsert(planinsertcommand);
	    
	    for(int i =1; i<=totalday;i++) {
	    	Map<String,Object> pdi = new HashMap<String, Object>();
	    	pdi.put("day", i);
	    	pdi.put("m_id",planinsertcommand.getM_id());
	    	planService.PlanDayInsert(pdi);
	    	System.out.println(pdi);
	    }//planService.PlanDayInsert(pdi); 다시쓰면됨.
	    //plan_day 만듬
	    

	    int plan_id = planService.PlanGetId(planinsertcommand.getM_id());
	    System.out.println(plan_id);
	    
	    
		ModelAndView mav = new ModelAndView("plan/planInsert");
		mav.addObject("planinsertcommand",planinsertcommand);
		mav.addObject("selectday",selectday);
		mav.addObject("totalday",totalday);
		mav.addObject("plan_id",plan_id);
		//mav.addObject("plan")
	    return mav;
	}
	@RequestMapping("/planInsertList.do")
	public ModelAndView planInsertList(
			@RequestParam(value="selectday",defaultValue="1") int selectday,
			@RequestParam(value="totalday") int totalday,
			@RequestParam(value="plan_id") int plan_id,
			@RequestParam(value="m_id") String m_id,
			@RequestParam(value="oldselectday",defaultValue="1") int oldselectday,
			@RequestParam(value="sendArr",defaultValue="") String sendArr)
	{
		if(sendArr.equals("")) {
			System.out.println("이게나온다고??");
		}else {
			System.out.println("sendArr = "+sendArr);
			System.out.println("oldselectday="+oldselectday);
			System.out.println(JSONArray.fromObject(sendArr));
			JSONArray arr = JSONArray.fromObject(sendArr);
			//List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
			List<Map<String, Object>> resendList = new ArrayList<Map<String, Object>>();
			
			Map<String,Integer> daySeq = new HashMap<String, Integer>();
			daySeq.put("day_id", oldselectday);
			daySeq.put("id",plan_id);
	        int day_seq = planService.PlanDaySeq(daySeq);
	        System.out.println("day_seq = "+day_seq);
	        //-------dayseq가져오기.
			planService.PlanDeleteDetail(day_seq);
			//기존 수정을 하든 뭘하든 이전 꺼 지우고 list 에있는것만 저장시키기위해
	        for(int i=0; i<arr.size(); i++){
		           
		        JSONObject obj = (JSONObject)arr.get(i);
		        Map<String, Object> daydetail = new HashMap<String, Object>();
		        System.out.println("resendMap   "+obj);
		        System.out.println(obj.get("t_id"));
		        System.out.println(obj.get("seq"));
		        daydetail.put("t_id", Integer.parseInt(obj.get("t_id").toString()));
		        daydetail.put("seq",Integer.parseInt(obj.get("seq").toString()));
		        daydetail.put("day_seq", day_seq);
		        planService.PlanDayDetail(daydetail);
	        }
		}
		List<PlanTourCommand> list = planService.ZZim(m_id);
		System.out.println(list);
		//찜테이블가져옴.
		System.out.println("plan_id"+plan_id);
		System.out.println("selectday="+selectday);
		Map<String,Integer> sendMap=new HashMap<String,Integer>();
		sendMap.put("plan_id", plan_id);
		sendMap.put("selectday", selectday);
		
		System.out.println("내가 검사할 부분");
        List<PlanSendCommand> psc = planService.PlanSend(sendMap);
        
        System.out.println("psc -> "+psc);
        
		ModelAndView mav = new ModelAndView("plan/planInsertList");
		System.out.println("planInsertList.do의  selectday = "+selectday);
		mav.addObject("selectDayPlan", JSONArray.fromObject(psc));
		mav.addObject("selectday",selectday);
		mav.addObject("totalday",totalday);
		mav.addObject("plan_id",plan_id);
		mav.addObject("m_id",m_id);
		mav.addObject("zzim",JSONArray.fromObject(list));
		//mav.addObject("plan")
	    return mav;
	    //-------------
	    
	}

	
	@RequestMapping(value="/planDetailList.do")//읽어올 때
	public ModelAndView planDetailList(int plan_id,
			@RequestParam(value="selectday",defaultValue="1") int selectday,
			@RequestParam(value="totalday",defaultValue="1") int totalday) {
		//for(int i=0;i<testList.length;)
		System.out.println("plan_id"+plan_id);
		System.out.println("selectday -> "+selectday);
	
        Map<String,Integer> sendMap=new HashMap<String,Integer>();
		sendMap.put("plan_id", plan_id);
		sendMap.put("selectday", selectday);
       
		System.out.println("내가 검사할 부분");
        List<PlanSendCommand> psc = planService.PlanSend(sendMap);
        
        System.out.println("psc -> "+psc);
       
        
        int totalDay = planService.PlanTotalDay(plan_id);
        //수정한 값에 스케쥴이 없으니까 이렇게 된다.
        if(totalDay==0) {
        	totalDay=totalday;
        	System.out.println("PlanTotalDay(plan_id) 가 안먹음.");
        }
        System.out.println("psc = "+psc);
        
        System.out.println("totalday = "+totalDay);
        
		ModelAndView mav = new ModelAndView("plan/planDetailList");
		mav.addObject("selectDayPlan", JSONArray.fromObject(psc));
		mav.addObject("totalDay",totalDay);
		mav.addObject("selectDay",selectday);
		mav.addObject("plan_id",plan_id);
		return mav;
	}
	
	@RequestMapping("/updatePlan.do")
	public ModelAndView planUpdate(HttpServletRequest request,
			PlanInsertCommand planinsertcommand,
			@RequestParam(value="m_id")String m_id,
			@RequestParam(value="oldtotalday")int oldtotalday,
			@RequestParam(value="plan_id")int plan_id
			)
	{
		String temp1 = planinsertcommand.getArrive_date().replace("-","");
		String temp2 = planinsertcommand.getDprt_date().replace("-","");
		int totalday = Integer.parseInt(temp1)-Integer.parseInt(temp2)+1;
		System.out.println("현재 totalday = "+totalday);//모달달력에서 넘어온 totalday
		System.out.println("old totalday = "+oldtotalday);
		System.out.println("plan_id = "+plan_id);
	    int selectday=1;
	    
	    Map<String,Object> m = new HashMap<String, Object>();
	    m.put("plan_id", plan_id);
	    m.put("planinsertcommand", planinsertcommand);
	    
	    planService.planUpdate(m);
	    System.out.println("수정완료");
	    if(oldtotalday>totalday) {
	    	int result = oldtotalday-totalday;
	    	for(int i=1;i<=result;i++) {
	    		planService.minusday(plan_id);
	    		System.out.println("minusday"+i);
	    	}
	    }else if(oldtotalday < totalday) {
	    	System.out.println("현재 totalday가 더크다.");
	    	int result = totalday- oldtotalday;
	    	for(int i =1;i<=result;i++) {
	    		planService.plusday(plan_id);
	    	}
	    }
	    
		ModelAndView mav = new ModelAndView("plan/planInsert");
		mav.addObject("planinsertcommand",planinsertcommand);
		mav.addObject("selectday",selectday);
		mav.addObject("totalday",totalday);
		mav.addObject("plan_id",plan_id);
		//mav.addObject("plan")
	    return mav;
	}
	
	@RequestMapping("/planDelete.do")
	public ModelAndView planDelete(
			@RequestParam(value="plan_id")int plan_id,
			@RequestParam(value="member_id")String m_id) {
		
		planService.planDelete(plan_id);
		System.out.println("삭제됨");
		//ModelAndView mav = new ModelAndView("redirect:planList");
		List<PlanCommand> list = planService.planList("test");		
		ModelAndView mav = new ModelAndView("redirect:/plan/planList.do");
		mav.addObject("m_id",m_id);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping("/planSave.do")
	public ModelAndView planSave(
			@RequestParam(value="m_id") String m_id,
			@RequestParam(value="plan_id") int plan_id,
			@RequestParam(value="oldselectday",defaultValue="1") int oldselectday,
			@RequestParam(value="sendArr",defaultValue="") String sendArr) {
		
		JSONArray arr = JSONArray.fromObject(sendArr);
		//List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> resendList = new ArrayList<Map<String, Object>>();
		
		Map<String,Integer> daySeq = new HashMap<String, Integer>();
		daySeq.put("day_id", oldselectday);
		daySeq.put("id",plan_id);
        int day_seq = planService.PlanDaySeq(daySeq);
        System.out.println("day_seq = "+day_seq);
        //-------dayseq가져오기.
		planService.PlanDeleteDetail(day_seq);
		//기존 수정을 하든 뭘하든 이전 꺼 지우고 list 에있는것만 저장시키기위해
        for(int i=0; i<arr.size(); i++){
	           
	        JSONObject obj = (JSONObject)arr.get(i);
	        Map<String, Object> daydetail = new HashMap<String, Object>();
	        System.out.println("resendMap   "+obj);
	        System.out.println(obj.get("t_id"));
	        System.out.println(obj.get("seq"));
	        daydetail.put("t_id", Integer.parseInt(obj.get("t_id").toString()));
	        daydetail.put("seq",Integer.parseInt(obj.get("seq").toString()));
	        daydetail.put("day_seq", day_seq);
	        planService.PlanDayDetail(daydetail);
        }
       
        ModelAndView mav = new ModelAndView("redirect:planList.do");
		mav.addObject("m_id",m_id);
		return mav;
	}
	
	@RequestMapping("/planSearch.do")
	public ModelAndView planSearch(@RequestParam(value="search") String search) {
		
		List<PlanTourCommand> list = planService.planSearch(search);
		System.out.println(list);
		
       
        ModelAndView mav = new ModelAndView("plan/planSearch");
        mav.addObject("zzim",JSONArray.fromObject(list));
        return mav;
	}
	
	
	
	
}
