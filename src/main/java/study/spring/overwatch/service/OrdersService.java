package study.spring.overwatch.service;


import java.util.List;

import study.spring.overwatch.model.Orders;

public interface OrdersService {

	public int addOrders(Orders input) throws Exception;
	
	public int selectOrderNo();
	
	public Orders getOrdersResult(int user_no) throws Exception;
	public int deleteAllBasket(int user_no) throws Exception;
	public List<Orders> getOrdersList(int user_no) throws Exception;
	public List<Orders> getDeliveryList(int user_no) throws Exception;
	public List<Orders> getOrdersResultList(int user_no) throws Exception;
	

}
