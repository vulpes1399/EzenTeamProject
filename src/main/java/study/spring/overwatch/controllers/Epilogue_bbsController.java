package study.spring.overwatch.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.overwatch.helper.PageData;
import study.spring.overwatch.model.Epilogue_bbs;

import study.spring.overwatch.service.Epilogue_bbsService;
import study.spring.overwatch.service.List_itemService;

@Controller
public class Epilogue_bbsController {

	/** Service 패턴 구현제 주입 */
	@Autowired
	Epilogue_bbsService epilogue_bbsService;
	@Autowired
	List_itemService list_itemService;
	
	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 목록 페이지 */
	@RequestMapping(value = "/epil_list.do", method = RequestMethod.GET)
	public String list(Model model, HttpServletResponse response,
			// 검색어
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		  int totalCount = 0;	// 전체 게시글 
		  int listCount = 10;	// 한 페이지당 표시할 목록 수
		  int pageCount = 5;	// 한 그룹당 표시할 페이지 번호 수
		
		  //조회에 필요한 조건값(검색어)를 Beans에 담는다
		  Epilogue_bbs input = new Epilogue_bbs();
		  input.setWriter(keyword);
		  input.setSubject(keyword);
		
		  List<Epilogue_bbs> output = null; // 조회결과가 저장될 객체
		  PageData pageData = null;

	        try {
	        	// 전체 게시글 수 조회
	        	totalCount = epilogue_bbsService.getEpilogue_bbsCount(input);
	        	// 페이지 번호 계산 --> 계산 결과를 로그로 출력될 것이다.
	        	pageData = new PageData(nowPage, totalCount, listCount, pageCount);
	        	
	        	//SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
	        	Epilogue_bbs.setOffset(pageData.getOffset());
	        	Epilogue_bbs.setListCount(pageData.getListCount());
	        	
	            // 데이터 조회하기
	          //  output = epilogue_bbsService.getEpilogue_bbsList(input);
	        } catch (Exception e) { e.printStackTrace(); }

	        // View 처리
	        model.addAttribute("output", output);
	        model.addAttribute("keyword", keyword);
	        model.addAttribute("pageData", pageData);
	        return "epil_list";
	    }
	
	/** 작성 폼 페이지 */
	@RequestMapping(value = "/epil_add.do", method = RequestMethod.GET)
	public String add(Model model, HttpServletResponse response,
			@RequestParam(value="dw") int product_prod_no) {
		
		Epilogue_bbs input = new Epilogue_bbs();
		input.setProduct_prod_no(product_prod_no);
		
		model.addAttribute("product_prod_no", product_prod_no);
		
		return "epil_add";
	}
	
	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/epil_add_ok.do", method = RequestMethod.POST)
	public void addOk(Model model, HttpServletResponse response, HttpSession session,
		@RequestParam(value="writer") String subject,
		@RequestParam(value="subject") String writer,
		@RequestParam(value="content") String content,
		@RequestParam(value="product_prod_no") int product_prod_no) {
		
		// 저장할 값들을 Beans에 담는다.
		Epilogue_bbs input = new Epilogue_bbs();
        input.setWriter(writer);
        input.setSubject(subject);
        input.setContent(content);
        input.setProduct_prod_no(product_prod_no);
        
        
        int user_no = (int) session.getAttribute("user_no");
        input.setMembers_user_no(user_no);
        
		
		try {
			// 데이터 저장 -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			epilogue_bbsService.addEpilogue_bbs(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/item_details.do?prod_no=" + input.getProduct_prod_no();
		
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/** 상세 페이지 */
	@RequestMapping(value = "/epil_detail.do", method = RequestMethod.GET)
	public String detail(Model model, HttpServletResponse response,
			@RequestParam(value="epil_bbs_no") int epil_bbs_no) {
		
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Epilogue_bbs input = new Epilogue_bbs();
		input.setEpil_bbs_no(epil_bbs_no);
		
		// 조회결과를 저장할 객체 선언
		Epilogue_bbs output = null;
		
		try {
			// 데이터 조회
			output = epilogue_bbsService.getEpilogue_bbsItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// view 처리
		model.addAttribute("output", output);
		return "epil_detail";
	}
	
	/** 삭제 처리 구현 */
	@RequestMapping(value = "/epil_delete_ok.do", method = RequestMethod.GET)
	public void deleteOk(Model model, HttpServletResponse response,
			@RequestParam(value="epil_bbs_no") int epil_bbs_no,
			@RequestParam(value="product_prod_no") int product_prod_no) {
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Epilogue_bbs input = new Epilogue_bbs();
		input.setEpil_bbs_no(epil_bbs_no);
		input.setProduct_prod_no(product_prod_no);
		
		try {
			// 데이터 삭제
			epilogue_bbsService.deleteEpilogue_bbs(input);
		} catch (Exception e) {e.printStackTrace();}
		
		String redirectUrl = contextPath + "/item_details.do?prod_no=" + input.getProduct_prod_no();
		
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 수정 폼 페이지 */
	@RequestMapping(value = "/epil_edit.do", method = RequestMethod.GET)
	public String edit(Model model, HttpServletResponse response,
			@RequestParam(value="epil_bbs_no") int epil_bbs_no) {
		
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Epilogue_bbs input = new Epilogue_bbs();
		input.setEpil_bbs_no(epil_bbs_no);
		
		// 수정할 데이터의 원본 조회하기
		Epilogue_bbs output = null;
		
		try {
			output = epilogue_bbsService.getEpilogue_bbsItem(input);
		} catch (Exception e) {e.printStackTrace();}
		
		// view 처리
		model.addAttribute("output", output);
		return "epil_edit";
	}
	
	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "/epil_edit_ok.do", method = RequestMethod.POST)
	public void editOk(Model model, HttpServletResponse response,
			@RequestParam(value="epil_bbs_no") int epil_bbs_no,
			@RequestParam(value="subject") String subject,
			@RequestParam(value="content") String content) {
		
		// 수정할 값들을 Beans에 담는다
		Epilogue_bbs input = new Epilogue_bbs();
		input.setEpil_bbs_no(epil_bbs_no);
		input.setSubject(subject);
		input.setContent(content);
		
		try {
			// 데이터 수정
			epilogue_bbsService.editEpilogue_bbs(input);
		} catch (Exception e) {e.printStackTrace();}
		
		// 수정한 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다.
		String redirectUrl = contextPath + "/epil_detail.do?epil_bbs_no=" + input.getEpil_bbs_no();
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {e.printStackTrace();}
	}
}