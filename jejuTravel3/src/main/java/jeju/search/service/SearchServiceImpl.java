package jeju.search.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import jeju.search.command.CategoryCommand;
import jeju.search.command.TourCommand;
import jeju.search.dao.SearchDAO;
 
@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	public SearchDAO dao;
	
	@Override
	public ModelAndView search(String t_keyword) {
		// TODO Auto-generated method stub
		List<CategoryCommand> region=dao.search(t_keyword);
		if(t_keyword.equals("")) {
			region=null;
		}
		ModelAndView mav=new ModelAndView("search/search");
		mav.addObject("region",region);
		return mav;
	}

	@Override
	public ModelAndView searchAll(String t_keyword) {
		// TODO Auto-generated method stub
		List<TourCommand> content=dao.searchAll(t_keyword);
		int count=dao.getSearchCount(t_keyword);
		ModelAndView mav=new ModelAndView("search/allSearch_List");
		mav.addObject("content",content);
		mav.addObject("count",count);
		return mav;
	}
}
