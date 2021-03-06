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
      System.out.println("ListController??? total_count=>"+total_count);
      
      PagingUtil page = tourService.page(currentPage,total_count,region,c_tourid,c_subid,"list.do");
      System.out.println(page.getStartCount()+","+page.getEndCount());
      map.put("start",page.getStartCount());
      map.put("end", page.getEndCount());
      
      List<TourCommand> list=tourService.list(total_count, map);
      int cnt = list.size();
      ModelAndView mav=new ModelAndView("tour/list");//????????? ????????????
      mav.addObject("list",list);//????????? ??????
      mav.addObject("cnt", cnt);
      mav.addObject("pagingHtml",page.getPagingHtml());//???????????????
      return mav;
   }
   
   //?????? ????????? ??????(????????? 10???)
   @RequestMapping("/popListContent.do")
   public ModelAndView popList(@RequestParam(value="region",defaultValue="1") int region,
         @RequestParam(value="pageNum",defaultValue="1") int currentPage) {
      System.out.println("popList = region"+region+",currentPage"+currentPage);
      //c_tourid=5 ?????? region, currentPage ??????????????? select
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
   
      ModelAndView mav=new ModelAndView("tour/list");//????????? ????????????
      mav.addObject("list",list);
      mav.addObject("cnt",cnt);
      mav.addObject("pagingHtml",page.getPagingHtml());//???????????????
      return mav;
   }   
   
   //???????????????????????? ????????? ??????
   @RequestMapping("/detailList.do")
   public ModelAndView detailList(@RequestParam(value="t_id") int t_id,
         @RequestParam(value="region") int region,@RequestParam(value="c_id") int c_id,@RequestParam(value="m_id") String m_id) {
      System.out.println("detailList.do??? t_id="+t_id);
      System.out.println("detailList.do??? region="+region);
      System.out.println("detailList.do??? c_id="+c_id);
      List<TourDetailCommand> detailList = tourService.detailList(t_id);
      System.out.println(detailList);
      
      //m_id ??? null?????? ????????? ????????? ?????? ?????? -> ????????? ?????? ???????????? -> ????????? ?????? ????????????
      //m_id ??? null??? ????????? ????????? ?????? ?????? ?????? ->c_id,m_id ??????-> ????????? ?????? ????????? ?????? ->(1) : ????????? ???????????? ?????? / (0) : ????????? ??????

      
      Map<String,Object> map=new HashMap<String,Object>();
      map.put("m_id", m_id);
      map.put("t_id", t_id);
      
      int ck_good=0;
      if(m_id!=null) {//????????? ?????? ?????????      
         ck_good=tourService.checkGood(map);//????????? ??????:1, ?????????:0
      }
      System.out.println("detailList.do??? ck_good=>"+ck_good);
      
      //????????? ??????
      int ck_zzim=0;
      if(m_id!=null) {//????????? ?????? ?????????
         ck_zzim= tourService.zzimIsExist(map); // 1 or 0 
      }
      System.out.println("detailList.do??? ck_zzim=>"+ck_zzim);
      
      ModelAndView mav=new ModelAndView("tour/tourDetail");
      mav.addObject("detailList",detailList);
      mav.addObject("region", region);
      mav.addObject("c_id", c_id);
      mav.addObject("ck_good",ck_good);//0(???????????????),1(????????????)
      mav.addObject("ck_zzim",ck_zzim);//0(???????????????),1(??????)
      mav.addObject("m_id", m_id);//null(????????? ??????)
      return mav;
   }
   
   //?????? ??????
   @RequestMapping("/insertReview.do")
   public ModelAndView insertReview(@RequestParam(value="t_id") int t_id,
         @RequestParam(value="m_id") String m_id,
         @RequestParam(value="region") int region, @RequestParam(value="c_id") int c_id,
         @RequestParam(value="reviewContent") String r_content) {
      //"reviewContent" //tourDetail.jsp??? ??????????????? name?????????


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
   //?????? ????????????
   @RequestMapping("/selectReview.do")
      public ModelAndView selectReview(@RequestParam(value="t_id") int t_id,
            @RequestParam(value="m_id") String m_id,
            @RequestParam(value="region") int region, @RequestParam(value="c_id") int c_id) {
         
         System.out.println("selectReview.do??? t_id="+t_id);
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
   //?????? ????????????
   @RequestMapping("/deleteReview.do")
   public ModelAndView selectReview(@RequestParam(value="r_id") int r_id,
         @RequestParam(value="t_id") int t_id, @RequestParam(value="region") int region,
         @RequestParam(value="c_id") int c_id, @RequestParam(value="m_id") String m_id) {
      
      System.out.println("deleteReview.do??? r_id="+r_id);
      tourService.deleteReview(r_id);

      ModelAndView mav=new ModelAndView("redirect:/tour/selectReview.do");
      mav.addObject("t_id", t_id);
      mav.addObject("region", region);
      mav.addObject("c_id", c_id);
      mav.addObject("m_id", m_id);
      return mav;
   }
   
   
   //?????? ?????? ????????????
   @RequestMapping("/weather.do")
   public ModelAndView temp(@RequestParam(value="jsonWeather") String jsonWeather) {
      System.out.println(jsonWeather);
      ModelAndView mav=new ModelAndView("tour/weather");
      mav.addObject("jsonWeather",JSONArray.fromObject(jsonWeather));
      return mav;
   }   
   
   //????????? ?????? ?????? 
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
   
   //????????? ?????? ?????? ??????
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
      
      //??????????????? ????????????
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
      
      //???????????? ????????????
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