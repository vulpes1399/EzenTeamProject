package study.spring.overwatch.model;

import lombok.Data;

@Data
public class Orders {
	private int order_no;
	private int members_user_no;
	private String recive_name;
	private String recive_tel;
	private String recive_postcode;
	private String recive_addr1;
	private String recive_addr2;
	private int prod_no;
	private String prod_name;
	private int prod_price;
	private int prod_qty;
	private String prod_opt;
	private int opt_price;
	private String bank;
	private String deposit_name;
	private String reg_date;
	private String edit_date;

	private String file_path;
	private String img_type;
	private String origin_name;

	private String order_cancel;
	private int orders_order_no;

	private String order_ok;
	private String order_change;
	private String order_refund;
}
