package jeju.search.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import jeju.search.command.CategoryCommand;
import jeju.search.command.TourCommand;
 
@Repository
public class SearchDAOImpl extends SqlSessionDaoSupport implements SearchDAO {

	@Override
	public List<CategoryCommand> search(String t_keyword) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("search",t_keyword);
	}

	@Override
	public List<TourCommand> searchAll(String t_keyword) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("searchAll",t_keyword);
	}

	@Override
	public int getSearchCount(String t_keyword) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("searchCount",t_keyword);
	}
}
