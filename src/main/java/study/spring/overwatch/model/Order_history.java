package study.spring.overwatch.model;

import lombok.Data;

@Data
public class Order_history {
	private int order_his_no;
	private String order_ok;
	private String order_change;
	private String order_refund;
	private String reg_date;
	private String edit_date;
	private int orders_order_no;
	
}
