package study.spring.overwatch.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import study.spring.overwatch.service.impl.LoginServiceImpl;


@Controller
public class LoginController{

	@Autowired
	LoginServiceImpl loginService; //로그인 서비스 객체 주입
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	// 로그인 페이지 이동
	@RequestMapping(value = "/login_main.do", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user_id")!=null) {
			try {
				response.sendRedirect(contextPath);
				return "index";
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return "login_main";
	}
	
	/*로그인 페이지 로그인 ajax처리*/
	@ResponseBody
	@RequestMapping(value="login_main.do", method=RequestMethod.POST)
	public String loginGo(HttpSession session,
			@RequestParam(value="user_id") String user_id,
			@RequestParam(value="user_pw") String user_pw) {
		
		if(loginService.loginConfirm(session, user_id, user_pw)) { return "1"; }
		return "0";

	}
	
	// 로그아웃
		@RequestMapping(value = "logout.do", method = RequestMethod.GET)
		public void logout(HttpSession session, HttpServletResponse response) throws Exception{
			session.invalidate();
			loginService.logout(response);
		}

}