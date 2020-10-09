package study.spring.overwatch.model;

import lombok.Data;

@Data
public class List_item {
	 private int prod_no;
	 private String prod_name;
	 private int prod_price;
	 private int hit;
	 private String prod_opt;
	 private int opt_price;
	 
	 private String gender;
	 private String prod_style;
	 private String prod_strap;
	 private String prod_size;
	 private String prod_move;
	 
	 private int prod_img_no;
	 private String origin_name;
	 private String file_path;
	 private String img_type;
	 private String product_prod_no;
	 private String reg_date;
	 private int epil_bbs_no;
	 
	 
	   // 페이지 구현이 필요한 경우 아래 속성도 추가한다.
	    private static int offset;
	    private static int listCount;

	    public static int getOffset() {
	        return offset;
	    }

	    public static void setOffset(int offset) {
	        List_item.offset = offset;
	    }

	    public static int getListCount() {
	        return listCount;
	    }

	    public static void setListCount(int listCount) {
	    	List_item.listCount = listCount;
	    }
}
