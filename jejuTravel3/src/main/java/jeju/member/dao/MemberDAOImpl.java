package jeju.member.dao;

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
public class MemberDAOImpl extends SqlSessionDaoSupport implements MemberDAO {
	
	@Override
	public void insertUser(MemberCommand mem) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertUser",mem);
	}

	@Override
	public void insertUser_Detail(Member_DetailCommand mem_de) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertUser_Detail",mem_de);
	}
	
	
	@Override
	public boolean idCheck(String m_id) {
		// TODO Auto-generated method stub
		String id=getSqlSession().selectOne("idCheck",m_id);
		
		boolean check;

		if(id==null){ 
			check=true;
		}else {
			check=false;
		}	
		return check;
	}
	
	
	@Override
	public boolean loginCheck(Map<String,Object> map,HttpSession session) {
		// TODO Auto-generated method stub
		String login = getSqlSession().selectOne("loginCheck", map);
		boolean result;
		if(login==null) { 
			result=false;
		}else {
			result=true;
		}
		
        return result;
	}
	
	@Override
	public List<QnaCommand> u_getQnaList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("u_getQnaList",map);
	}
	
	@Override
	public QnaCommand u_viewQna(int q_seq) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("u_viewQna",q_seq);
	}
	

	
	@Override
	public List<NoticeCommand> u_getNoticeList() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("u_getNoticeList");
	}
	
	@Override
	public int u_getQnaCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("u_getQnaCount");
	}
	
	@Override
	public int u_getNoticeCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("u_getNoticeCount");
	}
	
	@Override
	public NoticeCommand u_viewNotice(int n_seq) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("u_viewNotice",n_seq);
	}
	
	@Override
	public void u_insertQna(QnaCommand qna) {
		// TODO Auto-generated method stub
		getSqlSession().insert("u_insertQna",qna);
	}
	
	@Override
	public void u_updateQna(QnaCommand qna) {
		// TODO Auto-generated method stub
		getSqlSession().update("u_updateQna",qna);
	}
	
	
	@Override
	public void u_deleteQna(QnaCommand qna) {
		// TODO Auto-generated method stub
		getSqlSession().delete("u_deleteQna",qna);
	}
	
	@Override
	public List<ReplyCommand> u_viewReply(int q_seq) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("u_viewReply",q_seq);
	}
	
	@Override
	public void u_insertReply(ReplyCommand re) {
		// TODO Auto-generated method stub
		getSqlSession().insert("u_insertReply",re);
	}
	
	@Override
	public void u_deleteReply(ReplyCommand re) {
		// TODO Auto-generated method stub
		getSqlSession().delete("u_deleteReply",re);
	}
	
	@Override
	public MemberCommand viewUser(String m_id) {
		// TODO Auto-generated method stub
	    return getSqlSession().selectOne("viewUser", m_id);
	}
	
	@Override
	public Member_DetailCommand viewUser2(String m_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("viewUser2", m_id);
	}
	
	@Override
	public Member_DetailCommand passwordConfirm(Member_DetailCommand mem_de) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("passwordConfirm",mem_de);
	}
	
	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
	}
	
	@Override
	public void updateUser(MemberCommand mem) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateUser",mem);
	}
	
	@Override
	public void updateUser2(Member_DetailCommand mem_de) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateUser2",mem_de);
	}
	
	@Override
	public void deleteUser(String m_id,HttpSession session) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteUser",m_id);
	}
}
