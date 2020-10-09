package study.spring.overwatch.controllers;

import java.io.IOException;
import java.util.List;

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

import study.spring.overwatch.helper.PageData;
import study.spring.overwatch.model.Item_inq_bbs;
import study.spring.overwatch.service.Item_inq_bbsService;
import study.spring.overwatch.service.List_itemService;

@Controller
public class Item_inq_bbsController {

	/** Service 패턴 구현제 주입 */
	@Autowired
	Item_inq_bbsService item_inq_bbsService;
	@Autowired
	List_itemService list_itemService;
	
	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 목록 페이지 */
	@RequestMapping(value = "item_bbs_list.do", method = RequestMethod.GET)
	public String list(Model model, HttpServletResponse response,
			// 검색어
			@RequestParam(value="keyword", required=false) String keyword,
			//@RequestParam(value = "prod_no") int prod_no, 
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		  int totalCount = 0;	// 전체 게시글 수
		  int listCount = 10;	// 한 페이지당 표시할 목록 수
		  int pageCount = 5;	// 한 그룹당 표시할 페이지 번호 수
		
		  //조회에 필요한 조건값(검색어)를 Beans에 담는다
		  Item_inq_bbs input = new Item_inq_bbs();
		  
		  
		  input.setWriter(keyword);
		  input.setSubject(keyword);
		  //int product_prod_no = prod_no;
		
		  List<Item_inq_bbs> output = null; // 조회결과가 저장될 객체
		  PageData pageData = null;

	        try {
	        	// 전체 게시글 수 조회
	        	totalCount = item_inq_bbsService.getItem_inq_bbsCount(input);
	        	// 페이지 번호 계산 --> 계산 결과를 로그로 출력될 것이다.
	        	pageData = new PageData(nowPage, totalCount, listCount, pageCount);
	        	
	        	//SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
	        	Item_inq_bbs.setOffset(pageData.getOffset());
	        	Item_inq_bbs.setListCount(pageData.getListCount());
	        	
	            // 데이터 조회하기
	            // output2 = item_inq_bbsService.getItem_inq_bbsList(product_prod_no);
	        } catch (Exception e) { e.printStackTrace(); }

	        // View 처리
	        // model.addAttribute("output2", output2);
	        model.addAttribute("keyword", keyword);
	        model.addAttribute("output", output);
	        model.addAttribute("pageData", pageData);
	        return "item_bbs_list";
	    }

	
	/** 작성 폼 페이지 */
	@RequestMapping(value = "/item_bbs_add.do", method = RequestMethod.GET)
	public String add(Model model, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value="wd") int product_prod_no){
		
		Item_inq_bbs input = new Item_inq_bbs();
		input.setProduct_prod_no(product_prod_no);
		//String product_prod_no = request.getParameter("product_prod_no").trim();
		// int iproduct_prod_no = Integer.valueOf((String) input.get("product_prod_no"));
		
		//int iproduct_prod_no = Integer.parseInt(product_prod_no);
		// int iproduct_prod_no = 21;
		// Item_inq_bbs input = new Item_inq_bbs();
		//input.setProduct_prod_no("product_prod_no");
		
		//Item_inq_bbs output = null;
		
		model.addAttribute("product_prod_no", product_prod_no);
		
		return "item_bbs_add";
	}
	
	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/item_bbs_add_ok.do", method = RequestMethod.POST)
	public void addOk(Model model, HttpServletResponse response, HttpSession session,
		@RequestParam(value="writer") String subject,
		@RequestParam(value="subject") String writer,
		@RequestParam(value="content") String content,
		@RequestParam(value="product_prod_no") int product_prod_no) {
		
		// 저장할 값들을 Beans에 담는다.
		Item_inq_bbs input = new Item_inq_bbs();
        input.setWriter(writer);
        input.setSubject(subject);
        input.setContent(content);
        input.setProduct_prod_no(product_prod_no);
        
        int user_no = (int) session.getAttribute("user_no");
        input.setMembers_user_no(user_no);
        
		
		try {
			// 데이터 저장 -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			item_inq_bbsService.addItem_inq_bbs(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/item_bbs_detail.do?item_inq_no=" + input.getItem_inq_no();
		
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/** 상세 페이지 */
	@RequestMapping(value = "/item_bbs_detail.do", method = RequestMethod.GET)
	public String detail(Model model, HttpServletResponse response,
			@RequestParam(value="item_inq_no") int item_inq_no) {
		
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Item_inq_bbs input = new Item_inq_bbs();
		input.setItem_inq_no(item_inq_no);
		
		// 조회결과를 저장할 객체 선언
		Item_inq_bbs output = null;
		
		try {
			// 데이터 조회
			output = item_inq_bbsService.getItem_inq_bbsItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// view 처리
		model.addAttribute("output", output);
		return "item_bbs_detail";
	}
	
	/** 삭제 처리 구현 */
	@RequestMapping(value = "/item_bbs_delete_ok.do", method = RequestMethod.GET)
	public void deleteOk(Model model, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value="item_inq_no") int item_inq_no,
			@RequestParam(value="product_prod_no") int product_prod_no) {
		
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Item_inq_bbs input = new Item_inq_bbs();
		input.setItem_inq_no(item_inq_no);
		input.setProduct_prod_no(product_prod_no);
		
		try {
			// 데이터 삭제
			item_inq_bbsService.deleteItem_inq_bbs(input);
		} catch (Exception e) {e.printStackTrace();}
		
		String redirectUrl = contextPath + "/item_details.do?prod_no=" + input.getProduct_prod_no();
		
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 수정 폼 페이지 */
	@RequestMapping(value = "/item_bbs_edit.do", method = RequestMethod.GET)
	public String edit(Model model, HttpServletResponse response,
			@RequestParam(value="item_inq_no") int item_inq_no) {
		
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Item_inq_bbs input = new Item_inq_bbs();
		input.setItem_inq_no(item_inq_no);
		
		// 수정할 데이터의 원본 조회하기
		Item_inq_bbs output = null;
		
		try {
			output = item_inq_bbsService.getItem_inq_bbsItem(input);
		} catch (Exception e) {e.printStackTrace();}
		
		// view 처리
		model.addAttribute("output", output);
		return "item_bbs_edit";
	}
	
	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "/item_bbs_edit_ok.do", method = RequestMethod.POST)
	public void editOk(Model model, HttpServletResponse response,
			@RequestParam(value="item_inq_no") int item_inq_no,
			@RequestParam(value="subject") String subject,
			@RequestParam(value="content") String content) {
		
		// 수정할 값들을 Beans에 담는다
		Item_inq_bbs input = new Item_inq_bbs();
		input.setItem_inq_no(item_inq_no);
		input.setSubject(subject);
		input.setContent(content);
		
		try {
			// 데이터 수정
			item_inq_bbsService.editItem_inq_bbs(input);
		} catch (Exception e) {e.printStackTrace();}
		
		// 수정한 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다.
		String redirectUrl = contextPath + "/item_bbs_detail.do?item_inq_no=" + input.getItem_inq_no();
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {e.printStackTrace();}
	}
}
