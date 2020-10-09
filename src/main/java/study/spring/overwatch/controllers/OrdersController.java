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

import study.spring.overwatch.model.Delivery;
import study.spring.overwatch.model.Order_history;
import study.spring.overwatch.model.Orders;
import study.spring.overwatch.service.BasketService;
import study.spring.overwatch.service.DeliveryService;
import study.spring.overwatch.service.Order_historyService;
import study.spring.overwatch.service.OrdersService;

/** 학과 관리 컨트롤러 */
@Controller
public class OrdersController {

	@Autowired
	OrdersService ordersService;
	@Autowired
	DeliveryService deliveryService;

	@Autowired
	Order_historyService order_historyService;
	@Autowired
	BasketService basketService;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	// 오더 등록
	@RequestMapping(value = "/order_ok.do", method = RequestMethod.POST)
	public void orderOk(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "recive_name") String recive_name,
			@RequestParam(value = "recive_tel") String recive_tel,
			@RequestParam(value = "recive_postcode") String recive_postcode,
			@RequestParam(value = "recive_addr1") String recive_addr1,
			@RequestParam(value = "recive_addr2") String recive_addr2, @RequestParam(value = "prod_no") String prod_no,
			@RequestParam(value = "prod_name") String prod_name, @RequestParam(value = "prod_price") String prod_price,
			@RequestParam(value = "prod_qty") String prod_qty, @RequestParam(value = "prod_opt") String prod_opt,
			@RequestParam(value = "opt_price") String opt_price, @RequestParam(value = "bank") String bank,
			@RequestParam(value = "deposit_name") String deposit_name,
			@RequestParam(value = "reg_date", required = false) String reg_date,
			@RequestParam(value = "edit_date", required = false) String edit_date) {

		String[] prodNo = prod_no.split(",");
		String[] prodName = prod_name.split(",");
		String[] prodPrice = prod_price.split(",");
		String[] prodQty = prod_qty.split(",");
		String[] prodOpt = prod_opt.split(",");
		String[] optPrice = opt_price.split(",");
		

		int user_no = (int) session.getAttribute("user_no");
		int tmp = ordersService.selectOrderNo();
		Orders input = new Orders();

		try {
			for (int i = 0; i < prodName.length; i++) {
				// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.

				input.setMembers_user_no(user_no);
				input.setRecive_name(recive_name);
				input.setRecive_tel(recive_tel);
				input.setRecive_postcode(recive_postcode);
				input.setRecive_addr1(recive_addr1);
				input.setRecive_addr2(recive_addr2);
				input.setBank(bank);
				input.setDeposit_name(deposit_name);

				input.setProd_no(Integer.parseInt(prodNo[i]));
				input.setProd_name(prodName[i]);
				input.setProd_price(Integer.parseInt(prodPrice[i]));
				input.setProd_qty(Integer.parseInt(prodQty[i]));
				input.setProd_opt(prodOpt[i]);
				input.setOpt_price(Integer.parseInt(optPrice[i]));

				ordersService.addOrders(input);

				tmp++;

				Delivery input2 = new Delivery();
				input2.setOrders_order_no(tmp);

				deliveryService.addDelivery(input2);

				Order_history input3 = new Order_history();
				input3.setOrders_order_no(tmp);
				order_historyService.addOrder_history(input3);

			}

			ordersService.deleteAllBasket(user_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 페이지 리다이렉트
		String redirectUrl = contextPath + "/buy_result.do";
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "buy_result.do", method = RequestMethod.GET)
	public String buy_result(Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		if (session.getAttribute("user_id") == null) {
			try {
				response.sendRedirect(contextPath + "/login_main.do");
				return "login_main";
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		
		int user_no = (int) session.getAttribute("user_no");

		Orders output = null; // 조회결과가 저장될 객체
		List<Orders> output1 = null;

		try {
			// 데이터 조회하기
			output = ordersService.getOrdersResult(user_no);
			//output1 = basketService.getBasketList(user_no);
			output1 = ordersService.getOrdersResultList(user_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("output1", output1);

		return "buy_result";

	}

	/** 배송 조회 페이지 */
	@RequestMapping(value = "my_delivery.do", method = RequestMethod.GET)
	public String deliveryList(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		if (session.getAttribute("user_id") == null) {
			try {
				response.sendRedirect(contextPath + "/login_main.do");
				return "login_main";
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
			int user_no = (int) session.getAttribute("user_no");
			List<Orders> output = null; // 조회결과가 저장될 객체

			try {
				// 데이터 조회하기
				output = ordersService.getOrdersList(user_no);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// View 처리
			model.addAttribute("output", output);
		

		return "my_delivery";
	}

	/** 구매 조회 페이지 */
	@RequestMapping(value = "my_order.do", method = RequestMethod.GET)
	public String orderList(Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		if (session.getAttribute("user_id") == null) {
			try {
				response.sendRedirect(contextPath + "/login_main.do");
				return "login_main";
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		int user_no = (int) session.getAttribute("user_no");
		List<Orders> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = ordersService.getOrdersList(user_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);

		return "my_order";
	}
	
	// 배송 취소
			@RequestMapping(value = "deliveryCancelOk.do", method = { RequestMethod.GET, RequestMethod.POST})
			public void updateDeliveryCancel(Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
				String orders_order_no=request.getParameter("orders_order_no");
				//String order_cancel = request.getParameter("order_cancel");
				int iorders_order_no = Integer.parseInt(orders_order_no);
			
				Delivery input = new Delivery();
				input.setOrders_order_no(iorders_order_no);
				//input.setOrder_cancel(order_cancel);
					try {
						deliveryService.updateDeliveryCancel(iorders_order_no);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					
				// 페이지 리다이렉트
				String redirectUrl = contextPath + "/my_delivery.do";
				try {
					response.sendRedirect(redirectUrl);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			// 구매확정
			@RequestMapping(value = "OrderDecideOk.do", method = { RequestMethod.GET, RequestMethod.POST})
			public void updateOrderDecide(Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
				String orders_order_no=request.getParameter("orders_order_no");
				//String order_cancel = request.getParameter("order_cancel");
				int iorders_order_no = Integer.parseInt(orders_order_no);
			
				Delivery input = new Delivery();
				input.setOrders_order_no(iorders_order_no);
				//input.setOrder_cancel(order_cancel);
					try {
						order_historyService.updateOrderDecide(iorders_order_no);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					
				// 페이지 리다이렉트
				String redirectUrl = contextPath + "/my_order.do";
				try {
					response.sendRedirect(redirectUrl);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			

			// 교환요청
			@RequestMapping(value = "OrderChangeOk.do", method = { RequestMethod.GET, RequestMethod.POST})
			public void updateOrderChange(Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
				String orders_order_no=request.getParameter("orders_order_no");
				//String order_cancel = request.getParameter("order_cancel");
				int iorders_order_no = Integer.parseInt(orders_order_no);
			
				Delivery input = new Delivery();
				input.setOrders_order_no(iorders_order_no);
				//input.setOrder_cancel(order_cancel);
					try {
						order_historyService.updateOrderChange(iorders_order_no);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					
				// 페이지 리다이렉트
				String redirectUrl = contextPath + "/my_order.do";
				try {
					response.sendRedirect(redirectUrl);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			

			// 구매확정
			@RequestMapping(value = "OrderRefundOk.do", method = { RequestMethod.GET, RequestMethod.POST})
			public void updateOrderRefund(Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
				String orders_order_no=request.getParameter("orders_order_no");
				//String order_cancel = request.getParameter("order_cancel");
				int iorders_order_no = Integer.parseInt(orders_order_no);
			
				Delivery input = new Delivery();
				input.setOrders_order_no(iorders_order_no);
				//input.setOrder_cancel(order_cancel);
					try {
						order_historyService.updateOrderRefund(iorders_order_no);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					
				// 페이지 리다이렉트
				String redirectUrl = contextPath + "/my_order.do";
				try {
					response.sendRedirect(redirectUrl);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			

}
