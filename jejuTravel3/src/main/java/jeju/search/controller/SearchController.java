package jeju.search.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jeju.search.service.SearchService;

@Controller
@RequestMapping("/search/*")
public class SearchController {
 
	@Autowired
	public SearchService service;
	
	//메인화면 이동
	@RequestMapping("/main.do")
	public String main() {
		return "form/main";
	}
	//지역 검색 폼
		@RequestMapping("/searchForm.do")
		public String move() {
			return "search/searchForm";
	}
	//전체 검색 폼
	@RequestMapping("/allSearch.do")
	public String go() {
		return "search/allSearch";
	}
	
	//지역 검색 Ajax
	@RequestMapping("/search.do")
	public ModelAndView search(@RequestParam("t_keyword_main") String search) {
		
		ModelAndView mav=service.search(search);
		
		return mav;
	}
	
	//지역 검색 이동
	@RequestMapping("/region.do")
	public ModelAndView region(String region) {
		ModelAndView mav = new ModelAndView("search/region");
		mav.addObject("region",region);
		return mav;
	}

	//전체 검색 이동
	@RequestMapping("/content.do")
	public ModelAndView searchAll(String t_keyword) {
		
		ModelAndView mav=service.searchAll(t_keyword);
		
		return mav;
	}
}

