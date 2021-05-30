package jeju.search.dao;
 
import java.util.List;

import jeju.search.command.CategoryCommand;
import jeju.search.command.TourCommand;

public interface SearchDAO {

	//지역 검색
	public List<CategoryCommand> search(String t_keyword);
	
	//전체 검색
	public List<TourCommand> searchAll(String t_keyword);
	
	//전체 검색 레코드 수
	public int getSearchCount(String t_keyword);
}
