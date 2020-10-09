package study.spring.overwatch.ajax;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/api/pw_find.do")
public class pwFind extends HttpServlet {
	private static final long serialVersionUID = -2942443909020135171L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json"); 
		
		String userId = request.getParameter("user_id");
		String userEmail = request.getParameter("user_email");
		
		if (userId == null) { userId = ""; }
		if (userEmail == null) { userEmail = ""; }

		String result = "FAIL";
		if (userId.equals("overwatch") && userEmail.equals("overwatch@gmail.com")) {
			result = "OK";	
		}
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		response.getWriter().print(json);
	}
}