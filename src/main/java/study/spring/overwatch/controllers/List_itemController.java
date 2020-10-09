package study.spring.overwatch.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.overwatch.helper.PageData;
import study.spring.overwatch.model.Epilogue_bbs;
import study.spring.overwatch.model.Item_inq_bbs;
import study.spring.overwatch.model.List_item;
import study.spring.overwatch.service.Epilogue_bbsService;
import study.spring.overwatch.service.Item_inq_bbsService;
import study.spring.overwatch.service.List_itemService;

/** 학과 관리 컨트롤러 */
@Controller
public class List_itemController {

	/** Service 패턴 구현체 주입 */
	// --> import study.spring.springhelper.service.CartService;
	@Autowired
	List_itemService list_itemService;
	@Autowired
	Epilogue_bbsService epilogue_bbsService;
	@Autowired
	Item_inq_bbsService item_inq_bbsService;
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 목록 페이지 */
	@RequestMapping(value = "/list_best.do", method = RequestMethod.GET)
	public String listbest(Model model, HttpServletResponse response,

			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		List_item input = new List_item();

		List<List_item> output = null; // 조회결과가 저장될 객체
		PageData pageData = null;
		try {

			// 전체 게시글 수 조회
			totalCount = list_itemService.getList_itemCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			List_item.setOffset(pageData.getOffset());
			List_item.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = list_itemService.getSelectJoin(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return "list_best";
	}

	/** 목록 페이지 */
	@RequestMapping(value = "/list_new.do", method = RequestMethod.GET)
	public String listnew(Model model, HttpServletResponse response,

			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		List_item input = new List_item();

		List<List_item> output = null; // 조회결과가 저장될 객체
		PageData pageData = null;
		try {

			// 전체 게시글 수 조회
			totalCount = list_itemService.getList_itemCount2(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			List_item.setOffset(pageData.getOffset());
			List_item.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = list_itemService.getSelectJoin2(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return "list_new";
	}

	/** 목록 페이지 */
	@RequestMapping(value = "/list_man.do", method = RequestMethod.GET)
	public String listman(Model model, HttpServletResponse response,

			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		List_item input = new List_item();

		List<List_item> output = null; // 조회결과가 저장될 객체
		PageData pageData = null;
		try {

			// 전체 게시글 수 조회
			totalCount = list_itemService.getList_itemCount3(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			List_item.setOffset(pageData.getOffset());
			List_item.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = list_itemService.getSelectJoin3(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return "list_man";
	}

	/** 목록 페이지 */
	@RequestMapping(value = "/list_woman.do", method = RequestMethod.GET)
	public String listwoman(Model model, HttpServletResponse response,

			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		List_item input = new List_item();

		List<List_item> output = null; // 조회결과가 저장될 객체
		PageData pageData = null;
		try {

			// 전체 게시글 수 조회
			totalCount = list_itemService.getList_itemCount4(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			List_item.setOffset(pageData.getOffset());
			List_item.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = list_itemService.getSelectJoin4(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return "list_woman";
	}

	/** 상세 페이지 */
	@RequestMapping(value = "/item_details.do", method = RequestMethod.GET)
	public String detail(Model model, HttpServletResponse response, @RequestParam(value = "prod_no") int prod_no,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		int totalCount = 0; // 전체 게시글
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
		int product_prod_no = prod_no;
		
		List_item input = new List_item();
		input.setProd_no(prod_no);

		List_item input1 = new List_item();
		input1.setProd_no(product_prod_no);

		
		Epilogue_bbs input2 = new Epilogue_bbs();
		Item_inq_bbs input3 = new Item_inq_bbs();


		// 조회결과를 저장할 객체 선언
		List_item output = null;
		List_item output1 = null;
		List<Epilogue_bbs> output2 = null;
		List<Item_inq_bbs> output3 = null;

		PageData pageData = null;
		try {
			// 전체 게시글 수 조회
        	totalCount = epilogue_bbsService.getEpilogue_bbsCount(input2);
        	
        	// 페이지 번호 계산 --> 계산 결과를 로그로 출력될 것이다.
        	pageData = new PageData(nowPage, totalCount, listCount, pageCount);
        	
        	//SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
        	Epilogue_bbs.setOffset(pageData.getOffset());
        	Epilogue_bbs.setListCount(pageData.getListCount());
        	
			// 데이터 조회
			output = list_itemService.getList_itemItem(input);
			output1 = list_itemService.getSelectProdDeImg(input1);
			output2 = epilogue_bbsService.getEpilogue_bbsList(product_prod_no);
		    output3 = item_inq_bbsService.getItem_inq_bbsList(product_prod_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);
		model.addAttribute("output3", output3);
		model.addAttribute("pageData", pageData);
		return "item_details";
	}

	/** 검색 페이지 */
	@RequestMapping(value = "list_search.do", method = RequestMethod.GET)
	public String list(Model model, HttpServletResponse response,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		List_item input = new List_item();
		input.setProd_name(keyword);

		List<List_item> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = list_itemService.getList_itemCount5(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			List_item.setOffset(pageData.getOffset());
			List_item.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = list_itemService.getSelectJoin(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageData", pageData);
		return "list_search";
	}

	@RequestMapping(value = "/list_my_watch.do", method = RequestMethod.GET)
	public String mywatch(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "sendChk", required = false) String[] sendChk) {

		List_item input = new List_item();
		input.setGender(sendChk[0]);
		input.setProd_style(sendChk[1]);
		input.setProd_strap(sendChk[2]);
		input.setProd_size(sendChk[3]);
		input.setProd_move(sendChk[4]);

		List<List_item> output = null; // 조회결과가 저장될 객체

		try {

			output = list_itemService.getSelectMyWatch(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);

		return "list_my_watch";
	}

}
