package study.spring.overwatch.service;

import java.util.List;

import study.spring.overwatch.model.Order_history;

public interface Order_historyService {
	public Order_history getOrder_historyItem(Order_history input) throws Exception;

	public List<Order_history> getOrder_historyList(Order_history input) throws Exception;

	public int getOrder_historyCount(Order_history input) throws Exception;

	public int addOrder_history(Order_history input) throws Exception;

	public int editOrder_history(Order_history input) throws Exception;

	public int deleteOrder_history(Order_history input) throws Exception;
	
public int updateOrderDecide(int iorders_order_no) throws Exception;
	
	public int updateOrderChange(int iorders_order_no) throws Exception;
	
	public int updateOrderRefund(int iorders_order_no) throws Exception;
}
