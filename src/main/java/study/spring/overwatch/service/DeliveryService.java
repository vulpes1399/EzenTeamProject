package study.spring.overwatch.service;

import java.util.List;

import study.spring.overwatch.model.Delivery;

public interface DeliveryService {
	public Delivery getDeliveryItem(Delivery input) throws Exception;

	public List<Delivery> getDeliveryList(Delivery input) throws Exception;

	public int getDeliveryCount(Delivery input) throws Exception;

	public int addDelivery(Delivery input) throws Exception;

	public int editDelivery(Delivery input) throws Exception;

	public int deleteDelivery(Delivery input) throws Exception;
	
	public int updateDeliveryCancel(int iorders_order_no) throws Exception;
	

}
