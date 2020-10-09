package study.spring.overwatch.service.impl;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.overwatch.model.Members;

import study.spring.overwatch.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*로그인*/
	public boolean loginConfirm(HttpSession session, String user_id, String user_pw) {
		Members input = new Members();		
		Members result = new Members();
		input.setUser_id(user_id);
		result = sqlSession.selectOne("MembersMapper.selectUser",input);
	
		if(result==null||!user_pw.equals(result.getUser_pw())) { return false; }
		else { userInfoSession(session, result); return true; }
	}
	
	/*세션에 회원정보 저장*/
	 public void userInfoSession(HttpSession session, Members members) {
			session.setAttribute("user_id", members.getUser_id());
			session.setAttribute("user_pw", members.getUser_pw());
			session.setAttribute("user_no", members.getUser_no());
			session.setAttribute("user_name", members.getUser_name());
			session.setAttribute("email", members.getEmail());
			session.setAttribute("tel", members.getTel());
			session.setAttribute("postcode", members.getPostcode());
			session.setAttribute("addr1", members.getAddr1());
			session.setAttribute("addr2", members.getAddr2());
	   }

		@Override
		public void logout(HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("location.href=document.referrer;");
			out.println("</script>");
			out.close();
		} 
	 
}
