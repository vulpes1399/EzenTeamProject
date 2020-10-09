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
import org.springframework.web.bind.annotation.ResponseBody;

import study.spring.overwatch.model.Basket;
import study.spring.overwatch.model.Cart;
import study.spring.overwatch.service.BasketService;

/** 장바구니컨트롤러 */
@Controller
public class BasketController {

	@Autowired
	BasketService basketService;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 목록 페이지 */
	@RequestMapping(value = "basket.do", method = RequestMethod.GET)
	public String list(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		if (session.getAttribute("user_id") == null) {
			try {
				response.sendRedirect(contextPath + "/login_main.do");
				return "login_main";
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		int user_no = (int) session.getAttribute("user_no");

		List<Basket> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = basketService.getBasketList(user_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		return "basket";
	}

	/**
	 * 작성 폼에 대한 action 페이지
	 * 
	 * @param members_user_no
	 */
	@RequestMapping(value = "add_basket.do", method = RequestMethod.GET)
	public void addOk(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "prod_qty", required = false) String prod_qty,
			@RequestParam(value = "product_prod_no") String product_prod_no,
			@RequestParam(value = "prod_opt", required = false) String prod_opt,
			@RequestParam(value = "opt_price", required = false) String opt_price,
			@RequestParam(value = "reg_date", required = false) String reg_date,
			@RequestParam(value = "edit_date", required = false) String edit_date) {

		int user_no = (int) session.getAttribute("user_no");
		
		System.out.println(prod_qty);
		System.out.println(prod_qty);	
		System.out.println(prod_qty);
		System.out.println(prod_qty);
		System.out.println(prod_qty);
		System.out.println(prod_qty);
		
		String[] prodNo = product_prod_no.split(",");
		String[] prodQty = prod_qty.split(",");
		String[] prodOpt = prod_opt.split(",");
		String[] optPrice = opt_price.split(",");
		// 저장할 값들을 Beans에 담는다.
		Cart input = new Cart();

		try {
			for (int i = 0; i <prodQty.length; i++) {
				
				System.out.println(prodQty.length);
				System.out.println(prodNo[i]);
				System.out.println(prodQty[i]);
				System.out.println(prodOpt[i]);
				System.out.println(optPrice[i]);
				System.out.println(user_no);
				
				
				input.setProd_qty(Integer.parseInt(prodQty[i]));
				input.setProduct_prod_no(Integer.parseInt(prodNo[i]));
				input.setProd_opt(prodOpt[i]);
				input.setOpt_price(Integer.parseInt(optPrice[i]));
				input.setMembers_user_no(user_no);
				basketService.insertBasket(input);
				
						
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 페이지 리다이렉트
		String redirectUrl = contextPath + "/basket.do";
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
	}

	/**
	 * 삭제 처리 구현
	 * 
	 * @throws Exception
	 */
	

	@ResponseBody
	@RequestMapping(value = "/basket_del_ok.do", method = RequestMethod.GET)
	public void basketDelOk(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "cart_no") int cart_no) throws Exception {

		int user_no = (int) session.getAttribute("user_no");
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Basket input = new Basket();
		input.setMembers_user_no(user_no);
		input.setCart_no(cart_no);
		
			try {
				// 데이터 삭제
				basketService.deleteBasket(input);

			} catch (Exception e) {
				e.printStackTrace();
			}
		// 페이지 리다이렉트
		String redirectUrl = contextPath + "/basket.do";
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	

	/** 목록 페이지 */
	@RequestMapping(value = "pay.do", method = RequestMethod.GET)
	public String payList(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		if (session.getAttribute("user_id") == null) {
			try {
				response.sendRedirect(contextPath + "/login_main.do");
				return "login_main";
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		int user_no = (int) session.getAttribute("user_no");

		List<Basket> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = basketService.getBasketList(user_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		return "pay";
	}

	
	
}
