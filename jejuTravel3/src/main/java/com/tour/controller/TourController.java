package com.tour.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tour.domain.ReviewCommand;
import com.tour.domain.TourCommand;
import com.tour.domain.TourDetailCommand;
import com.tour.service.TourService;
import com.tour.util.PagingUtil;

import net.sf.json.JSONArray;

@Component
@Controller
@RequestMapping("/tour/*")
public class TourController {

   @Autowired
   private TourService tourService;
   
   @RequestMapping("/list.do")
   public ModelAndView  process(@RequestParam(value="region",defaultValue="1") int region,
         @RequestParam(value="c_tourid",defaultValue="1") int c_tourid,
         @RequestParam(value="c_subid",defaultValue="1") int c_subid,
         @RequestParam(value="pageNum",defaultValue="1") int currentPage) {
      
      ModelAndView mav=new ModelAndView("tour/listMenu");
      mav.addObject("region",region);
      mav.addObject("c_subid",c_subid);
      mav.addObject("c_tourid",c_tourid);
       mav.addObject("currentPage",currentPage);
      return mav;
   }
   
   @RequestMapping("/listContent.do")
   public ModelAndView list(@RequestParam(value="region",defaultValue="1") int region,
         @RequestParam(value="pageNum",defaultValue="1") int currentPage,
          @RequestParam(value="c_tourid",defaultValue="1") int c_tourid,
          @RequestParam(value="c_subid",defaultValue="1") int c_subid) {
      System.out.println("region"+region+"currentPage"+currentPage+
            "c_tourid"+c_tourid+"c_subid"+c_subid);
      
      Map<String,Integer> map=new HashMap<String,Integer>();
      map.put("region", region);
      map.put("c_tourid", c_tourid);
      map.put("c_subid", c_subid);
      int total_count = tourService.listCount(map);
      System.out.println("ListController의 total_count=>"+total_count);
      
      PagingUtil page = tourService.page(currentPage,total_count,region,c_tourid,c_subid,"list.do");
      System.out.println(page.getStartCount()+","+page.getEndCount());
      map.put("start",page.getStartCount());
      map.put("end", page.getEndCount());
      
      List<TourCommand> list=tourService.list(total_count, map);
      int cnt = list.size();
      ModelAndView mav=new ModelAndView("tour/list");//이동할 페이지명
      mav.addObject("list",list);//레코드 전체
      mav.addObject("cnt", cnt);
      mav.addObject("pagingHtml",page.getPagingHtml());//링크문자열
      return mav;
   }
   
   //인기 여행지 처리(지역별 10개)
   @RequestMapping("/popListContent.do")
   public ModelAndView popList(@RequestParam(value="region",defaultValue="1") int region,
         @RequestParam(value="pageNum",defaultValue="1") int currentPage) {
      System.out.println("popList = region"+region+",currentPage"+currentPage);
      //c_tourid=5 이면 region, currentPage 조건으로만 select
      Map<String,Integer> map=new HashMap<String,Integer>();
      map.put("region", region);

      int total_count = 10;
      PagingUtil page = tourService.page(currentPage,total_count,region,5,0,"list.do");
      System.out.println(page.getStartCount()+","+page.getEndCount());
      map.put("start",page.getStartCount());
      map.put("end", page.getEndCount());
      
      List<TourCommand> list=tourService.popList(map);
      int cnt = list.size();
      //System.out.println(list);
   
      ModelAndView mav=new ModelAndView("tour/list");//이동할 페이지명
      mav.addObject("list",list);
      mav.addObject("cnt",cnt);
      mav.addObject("pagingHtml",page.getPagingHtml());//링크문자열
      return mav;
   }   
   
   //여행지클릭했을때 자세히 보기
   @RequestMapping("/detailList.do")
   public ModelAndView detailList(@RequestParam(value="t_id") int t_id,
         @RequestParam(value="region") int region,@RequestParam(value="c_id") int c_id,@RequestParam(value="m_id") String m_id) {
      System.out.println("detailList.do의 t_id="+t_id);
      System.out.println("detailList.do의 region="+region);
      System.out.println("detailList.do의 c_id="+c_id);
      List<TourDetailCommand> detailList = tourService.detailList(t_id);
      System.out.println(detailList);
      
      //m_id 가 null이면 로그인 안되어 있는 상태 -> 좋아요 버튼 눌렀을때 -> 로그인 먼저 해주세요
      //m_id 가 null이 아니면 로그인 되어 있는 상태 ->c_id,m_id 조건-> 좋아요 체크 유무에 따라 ->(1) : 좋아요 취소하기 버튼 / (0) : 좋아요 버튼

      
      Map<String,Object> map=new HashMap<String,Object>();
      map.put("m_id", m_id);
      map.put("t_id", t_id);
      
      int ck_good=0;
      if(m_id!=null) {//로그인 되어 있다면      
         ck_good=tourService.checkGood(map);//좋아요 누름:1, 안누름:0
      }
      System.out.println("detailList.do의 ck_good=>"+ck_good);
      
      //찜하기 조회
      int ck_zzim=0;
      if(m_id!=null) {//로그인 되어 있다면
         ck_zzim= tourService.zzimIsExist(map); // 1 or 0 
      }
      System.out.println("detailList.do의 ck_zzim=>"+ck_zzim);
      
      ModelAndView mav=new ModelAndView("tour/tourDetail");
      mav.addObject("detailList",detailList);
      mav.addObject("region", region);
      mav.addObject("c_id", c_id);
      mav.addObject("ck_good",ck_good);//0(좋아요안함),1(좋아요함)
      mav.addObject("ck_zzim",ck_zzim);//0(찜하기안함),1(찜함)
      mav.addObject("m_id", m_id);//null(로그인 안함)
      return mav;
   }
   
   //리뷰 등록
   @RequestMapping("/insertReview.do")
   public ModelAndView insertReview(@RequestParam(value="t_id") int t_id,
         @RequestParam(value="m_id") String m_id,
         @RequestParam(value="region") int region, @RequestParam(value="c_id") int c_id,
         @RequestParam(value="reviewContent") String r_content) {
      //"reviewContent" //tourDetail.jsp의 리뷰입력한 name속성값


      System.out.println("r_content=>"+r_content);
      System.out.println("m_id=>"+m_id);
      System.out.println("t_id=>"+t_id);
      
      Map<String,Object> map=new HashMap<String,Object>();
      map.put("r_content", r_content);
      map.put("m_id", m_id);
      map.put("t_id", t_id);

      
      tourService.insertReview(map);
      ModelAndView mav=new ModelAndView("redirect:/tour/detailList.do");
      mav.addObject("t_id", t_id);
      mav.addObject("region", region);
      mav.addObject("c_id", c_id);
      mav.addObject("m_id",m_id);
      return mav;
      
   }
   //리뷰 조회하기
   @RequestMapping("/selectReview.do")
      public ModelAndView selectReview(@RequestParam(value="t_id") int t_id,
            @RequestParam(value="m_id") String m_id,
            @RequestParam(value="region") int region, @RequestParam(value="c_id") int c_id) {
         
         System.out.println("selectReview.do의 t_id="+t_id);
         List<ReviewCommand> selectReview = tourService.selectReview(t_id);
         
         System.out.println(selectReview);
         ModelAndView mav=new ModelAndView("tour/tourDetailReview");
         mav.addObject("selectReview",selectReview);
         mav.addObject("m_id",m_id);
         
         mav.addObject("region",region);
         mav.addObject("c_id",c_id);
         mav.addObject("t_id",t_id);
         return mav;
      }
   //리뷰 삭제하기
   @RequestMapping("/deleteReview.do")
   public ModelAndView selectReview(@RequestParam(value="r_id") int r_id,
         @RequestParam(value="t_id") int t_id, @RequestParam(value="region") int region,
         @RequestParam(value="c_id") int c_id, @RequestParam(value="m_id") String m_id) {
      
      System.out.println("deleteReview.do의 r_id="+r_id);
      tourService.deleteReview(r_id);

      ModelAndView mav=new ModelAndView("redirect:/tour/selectReview.do");
      mav.addObject("t_id", t_id);
      mav.addObject("region", region);
      mav.addObject("c_id", c_id);
      mav.addObject("m_id", m_id);
      return mav;
   }
   
   
   //날씨 정보 불러오기
   @RequestMapping("/weather.do")
   public ModelAndView temp(@RequestParam(value="jsonWeather") String jsonWeather) {
      System.out.println(jsonWeather);
      ModelAndView mav=new ModelAndView("tour/weather");
      mav.addObject("jsonWeather",JSONArray.fromObject(jsonWeather));
      return mav;
   }   
   
   //좋아요 버튼 클릭 
   @RequestMapping("/insertGood.do") 
   public ModelAndView insertGood(@RequestParam(value="m_id") String m_id,
         @RequestParam(value="t_id") int t_id) { 

      
      System.out.println("m_id=>"+m_id); 
      System.out.println("t_id=>"+t_id);
      
      Map<String,Object> map=new HashMap<String,Object>(); 
       map.put("m_id", m_id); 
       map.put("t_id",t_id);
       
       tourService.insertGood(map);
       tourService.updateLikeCnt(t_id);
       
       ModelAndView mav=new ModelAndView("tour/tourDetail"); 
       return mav;
   }
   
   //좋아요 취소 버튼 클릭
   @RequestMapping("/deleteGood.do") 
   public ModelAndView deleteGood(@RequestParam(value="m_id") String m_id,
         @RequestParam(value="t_id") int t_id) { 

      System.out.println("m_id=>"+m_id); 
      System.out.println("t_id=>"+t_id);
      
      Map<String,Object> map=new HashMap<String,Object>(); 
       map.put("m_id", m_id); 
       map.put("t_id",t_id);
       
       tourService.deleteGood(map);
       tourService.updateLikeCnt(t_id);
       
       ModelAndView mav=new ModelAndView("tour/tourDetail"); 
       return mav;
   }
   

   @RequestMapping("/deleteZZim.do")
   public ModelAndView deleteZZim(@RequestParam(value="m_id") String m_id,
         @RequestParam(value="t_id") int t_id) {

      //System.out.println("m_id=>"+m_id);
      //System.out.println("t_id=>"+t_id);
      
      //찜목록에서 삭제하기
      Map<String,Object> map=new HashMap<String,Object>();
      map.put("m_id", m_id);
      map.put("t_id",t_id);
      tourService.deleteZZim(map);
      ModelAndView mav=new ModelAndView("tour/tourDetail");      
      return mav;
   }
   
   @RequestMapping("/insertZZim.do")
   public ModelAndView insertZZim(@RequestParam(value="m_id") String m_id,
         @RequestParam(value="t_id") int t_id) {

      //System.out.println("m_id=>"+m_id);
      //System.out.println("t_id=>"+t_id);
      
      //찜목록에 추가하기
      Map<String,Object> map=new HashMap<String,Object>();
      map.put("m_id", m_id);
      map.put("t_id",t_id);
      tourService.insertZZim(map);
      ModelAndView mav=new ModelAndView("tour/tourDetail");      
      return mav;
   }

   @RequestMapping("/naver.do")
   public ModelAndView naver(@RequestParam(value="x") String x,
         @RequestParam(value="y") String y) {

      Double Mapx = Double.parseDouble(x);
      Double Mapy = Double.parseDouble(y);
      System.out.println(Mapx);
      System.out.println(Mapy);
      
      ModelAndView mav = new ModelAndView("tour/naverMap");
      mav.addObject("Mapx",Mapx);
      mav.addObject("Mapy",Mapy);
      
      return mav;
   
   }
   
   @RequestMapping("/regionImg.do")
   public ModelAndView regionImg(@RequestParam(value="region") int region) {
      System.out.println(region);
      
      ModelAndView mav = new ModelAndView("tour/regionImg");
      mav.addObject("region",region);

      return mav;
   
   }
   

   
}