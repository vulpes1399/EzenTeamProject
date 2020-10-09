package study.spring.overwatch.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.spring.overwatch.model.Members;

public interface LoginService {
	
	
	public boolean loginConfirm(HttpSession session, String user_id, String user_pw);
	public void userInfoSession(HttpSession session, Members members);
	public void logout(HttpServletResponse response) throws Exception;
	
	
}
