package jeju.manager.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import jeju.manager.command.NoticeCommand;
import jeju.member.command.MemberCommand;
import jeju.member.command.Member_DetailCommand;
import jeju.member.command.QnaCommand;
import jeju.member.command.ReplyCommand;
 
@Repository
public class ManagerDAOImpl extends SqlSessionDaoSupport implements ManagerDAO {

	
	@Override
	public boolean loginCheck(Map<String, Object> map, HttpSession session) {
		// TODO Auto-generated method stub
		String mgr_id = getSqlSession().selectOne("managerLoginCheck", map);
		boolean result;
		if(mgr_id==null) { 
			result=false;
		}else {
			result=true;
		}
		
        return result;
	}
	
	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
	}
	
	@Override
	public List<MemberCommand> getMemberList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("getMemberList",map);
	}
	
	@Override
	public List<QnaCommand> getQnaList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("getQnaList",map);
	}
	
	@Override
	public List<NoticeCommand> getNoticeList() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("getNoticeList");
	}
	
	@Override
	public void insertNotice(NoticeCommand not) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertNotice",not);
	}
	
	@Override
	public void updateNotice(NoticeCommand not) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateNotice",not);
	}
	
	@Override
	public void deleteNotice(int n_seq) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteNotice",n_seq);
	}
	
	@Override
	public NoticeCommand viewNotice(int n_seq) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("viewNotice",n_seq);
	}
	
	@Override
	public QnaCommand viewQna(int q_seq) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("viewQna",q_seq);
	}
	
	@Override
	public List<ReplyCommand> viewReply(int q_seq) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("viewReply",q_seq);
	}
	
	@Override
	public void insertReply(ReplyCommand re) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertReply",re);
	}
	
	@Override
	public void deleteReply(ReplyCommand re) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteReply",re);
	}
	
	@Override
	public MemberCommand viewUser(String m_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("man_viewUser", m_id);
	}
	
	@Override
	public Member_DetailCommand viewUser2(String m_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("man_viewUser2", m_id);
	}
	@Override
	public void updateUser(MemberCommand mem) {
		// TODO Auto-generated method stub
		getSqlSession().update("man_updateUser",mem);
	}
	
	@Override
	public void updateUser2(Member_DetailCommand mem_de) {
		// TODO Auto-generated method stub
		getSqlSession().update("man_updateUser2",mem_de);
	}
	
	@Override
	public int getMemberCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("getMemberCount");
	}
	
	@Override
	public int getQnaCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("getQnaCount");
	}
	
	@Override
	public int getNoticeCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("getNoticeCount");
	}
	
	@Override
	public void delete(String m_id) {
		// TODO Auto-generated method stub
		getSqlSession().delete("delete",m_id);
	}

	@Override
	public void deleteQna(int q_seq) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteQna",q_seq);
	}
}
