package study.spring.overwatch.controllers;

import java.io.IOException;

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

import study.spring.overwatch.model.Members;
import study.spring.overwatch.service.MembersService;
import study.spring.overwatch.service.impl.LoginServiceImpl;

@Controller
public class MembersController {

	@Autowired
	MembersService membersService;

	@Autowired
	LoginServiceImpl loginService; // 로그인 서비스 객체 주입

	@Value("#{servletContext.contextPath}")
	String contextPath;

	// 회원 가입 페이지 이동
	@RequestMapping(value = "/sign_up.do", method = RequestMethod.GET)
	public String addUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		if (session.getAttribute("user_id") != null) {
			try {
				response.sendRedirect(contextPath);
				return "index";
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		return "sign_up";
	}

	// 회원 가입
	@RequestMapping(value = "/sign_up_ok.do", method = RequestMethod.POST)
	public void addUserOk(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "user_name") String user_name, @RequestParam(value = "user_id") String user_id,
			@RequestParam(value = "user_pw") String user_pw, @RequestParam(value = "email") String email,
			@RequestParam(value = "tel") String tel, @RequestParam(value = "postcode") String postcode,
			@RequestParam(value = "addr1") String addr1, @RequestParam(value = "addr2") String addr2,
			@RequestParam(value = "is_out", required = false) String is_out,
			@RequestParam(value = "reg_date", required = false) String reg_date,
			@RequestParam(value = "edit_date", required = false) String edit_date) {

		Members input = new Members();
		input.setUser_name(user_name);
		input.setUser_id(user_id);
		input.setUser_pw(user_pw);
		input.setEmail(email);
		input.setTel(tel);
		input.setPostcode(postcode);
		input.setAddr1(addr1);
		input.setAddr2(addr2);
		input.setIs_out("N");
		input.setReg_date(reg_date);
		input.setEdit_date(edit_date);

		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			membersService.addMembers(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String redirectUrl = contextPath + "/login_main.do";

		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 마이 페이지 이동
	@RequestMapping(value = "/my_page_main.do", method = RequestMethod.GET)
	public String mypage(Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String user_name = (String) session.getAttribute("user_name");

		if (session.getAttribute("user_id") == null) {
			try {
				response.sendRedirect(contextPath);
				return "index";
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Members input = new Members();

		// 조회결과를 저장할 객체 선언
		Members output = null;

		try {
			// 데이터 조회
			output = membersService.getMembersInfo(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("user_name", user_name);
		return "my_page_main";
	}

	// 마이 페이지 회원 정보 조회
	@RequestMapping(value = "/my_page_info.do", method = RequestMethod.GET)
	public String detail(Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		if (session.getAttribute("user_id") == null) {
			try {
				response.sendRedirect(contextPath);
				return "index";
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		int user_no = (int) session.getAttribute("user_no");
		Members output = null;

		try {
			output = membersService.getMembersselect(user_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// view 처리
		model.addAttribute("output", output);
		return "my_page_info";
	}

	// 마이 페이지 회원 정보 수정 페이지로 이동
	@RequestMapping(value = "/my_page_update.do", method = RequestMethod.GET)
	public String editUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		if (session.getAttribute("user_id") == null) {
			try {
				response.sendRedirect(contextPath);
				return "index";
			} catch (Exception e) {
				// TODO: handle exception
			}

			int user_no = (int) session.getAttribute("user_no");

			// 수정할 데이터의 원본 조회하기
			Members output = null;

			try {
				output = membersService.getMembersselect(user_no);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// View 처리
			model.addAttribute("output", output);
			return "my_page_update";

		}
		return "my_page_update";
	}

	// 비밀번호 수정
	@RequestMapping(value = "/update_pw.do", method = RequestMethod.GET)
	public void editPassowrd(Model model, HttpSession session, HttpServletResponse response,
			@RequestParam(value = "user_pw_new") String user_pw_new, @RequestParam(value = "user_pw") String user_pw) {

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Members input = new Members();
		input.setUser_pw(user_pw_new);

		String pwSession = (String) session.getAttribute("user_pw");
		int user_no = (int) session.getAttribute("user_no");
		input.setUser_no(user_no);

		if (pwSession.equals(user_pw)) {
			try {
				membersService.editPassword(input);
				session.setAttribute("user_pw", user_pw_new);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {

		}

		String redirectUrl = contextPath + "/my_page_update.do";
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 이메일 수정
	@RequestMapping(value = "/update_email.do", method = RequestMethod.GET)
	public void editEmail(Model model, HttpSession session, HttpServletResponse response,
			@RequestParam(value = "email_new") String email_new, @RequestParam(value = "email") String email) {

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Members input = new Members();
		input.setEmail(email_new);

		String emailSession = (String) session.getAttribute("email");

		int user_no = (int) session.getAttribute("user_no");
		input.setUser_no(user_no);

		if (emailSession.equals(email)) {
			try {
				membersService.editEmail(input);
				session.setAttribute("email", email_new);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 페이지 리다이렉트
		String redirectUrl = contextPath + "/my_page_update.do";
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 연락처 수정
	@RequestMapping(value = "/update_tel.do", method = RequestMethod.GET)
	public void editTel(Model model, HttpSession session, HttpServletResponse response,
			@RequestParam(value = "tel_new") String tel_new, @RequestParam(value = "tel") String tel) {

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Members input = new Members();
		input.setTel(tel_new);

		String telSession = (String) session.getAttribute("tel");

		int user_no = (int) session.getAttribute("user_no");
		input.setUser_no(user_no);

		if (telSession.equals(tel)) {
			try {
				membersService.editTel(input);
				session.setAttribute("tel", tel_new);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 페이지 리다이렉트
		String redirectUrl = contextPath + "/my_page_update.do";
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 주소 수정
	@RequestMapping(value = "/update_addr.do", method = RequestMethod.GET)
	public void editAddr(Model model, HttpSession session, HttpServletResponse response,
			@RequestParam(value = "postcode_new") String postcode_new,
			@RequestParam(value = "addr1_new") String addr1_new, @RequestParam(value = "addr2_new") String addr2_new) {

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Members input = new Members();
		input.setPostcode(postcode_new);
		input.setAddr1(addr1_new);
		input.setAddr2(addr2_new);

		int user_no = (int) session.getAttribute("user_no");
		input.setUser_no(user_no);

		try {
			membersService.editAddr(input);
			session.setAttribute("postcode", postcode_new);
			session.setAttribute("addr1", addr1_new);
			session.setAttribute("addr2", addr2_new);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 페이지 리다이렉트
		String redirectUrl = contextPath + "/my_page_update.do";
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 회원 탈퇴 페이지 이동
	@RequestMapping(value = "/withdraw.do", method = RequestMethod.GET)
	public String outUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		if (session.getAttribute("user_id") == null) {
			try {
				response.sendRedirect(contextPath);
				return "index";
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		return "withdraw";
	}

	/**
	 * 삭제 처리 구현
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/withdraw_ok.do", method = RequestMethod.GET)
	public void withdrawOk(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "user_id") String user_id, @RequestParam(value = "user_pw") String user_pw)
			throws Exception {
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Members input = new Members();
		input.setUser_id(user_id);
		input.setUser_pw(user_pw);

		String idSession = (String) session.getAttribute("user_id");

		String pwSession = (String) session.getAttribute("user_pw");

		int user_no = (int) session.getAttribute("user_no");
		input.setUser_no(user_no);

		if ((idSession.equals(user_id)) && (pwSession.equals(user_pw))) {
			try {
				// 데이터 삭제
				membersService.deleteMembers(input);
				session.invalidate();
				loginService.logout(response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 페이지 리다이렉트
		String redirectUrl = contextPath + "/withdraw.do";
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/id_pw_find.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String find(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		if (session.getAttribute("user_id") != null) {
			try {
				response.sendRedirect(contextPath);
				return "index";
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		return "id_pw_find";
	}


	@ResponseBody
	@RequestMapping(value = "id_find_ok.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String id_find(Model model, HttpServletResponse response, HttpServletRequest request) {

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		
		String user_name=request.getParameter("user_name");
		String email = request.getParameter("email");
		
		
		Members input = new Members();
		input.setUser_name(user_name);
		input.setEmail(email);
		
	//	// 조회결과를 저장할 객체 선언
	//	Members output = null;
		
		
		try {
			// 데이터 조회
			input = membersService.getMembersFindId(input);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		   String result = input.getUser_id();

	        return result;
	}
	@ResponseBody
	@RequestMapping(value = "pw_find_ok.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String pw_find(Model model, HttpServletResponse response, HttpServletRequest request) {

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		
		String user_id=request.getParameter("user_id");
		String email2 = request.getParameter("email2");
		
		
		Members input = new Members();
		input.setUser_id(user_id);
		input.setEmail(email2);
		
	//	// 조회결과를 저장할 객체 선언
	//	Members output = null;
		
		
		try {
			// 데이터 조회
			input = membersService.getMembersFindPw(input);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		   String result = input.getUser_pw();

	        return result;
	}

}
