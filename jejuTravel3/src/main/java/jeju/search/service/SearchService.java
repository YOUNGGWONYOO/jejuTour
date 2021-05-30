package jeju.search.service;

import org.springframework.web.servlet.ModelAndView;

 
public interface SearchService {

	//지역 검색
	public ModelAndView search(String t_keyword);
	
	//전체 검색
	public ModelAndView searchAll(String t_keyword);
}
