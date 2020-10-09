package study.spring.overwatch.model;

import lombok.Data;

@Data
public class Cart {
	private int cart_no;
	private int prod_qty;   
	private int product_prod_no;
	private String prod_opt;
	private int opt_price;
	private int members_user_no;
	private String reg_date;
	private String edit_date;
	
}
