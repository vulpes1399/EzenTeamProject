package study.spring.overwatch.model;

import lombok.Data;

@Data
public class Basket {
		
		private int user_no; // 맴버 유저 넘버 
		private int prod_no; // 프로덕트  테이블 프로덕트 넘버
		private String prod_name;
		private int prod_price;
		
		private String file_path;
		private String img_type;
		private String origin_name;
		
		
		private int cart_no;
		private int prod_qty;   
		private int product_prod_no;
		
		
		private String prod_opt;
		private int opt_price;
		private int members_user_no;

}
