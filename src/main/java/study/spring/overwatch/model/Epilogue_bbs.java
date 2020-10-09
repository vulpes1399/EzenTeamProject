package study.spring.overwatch.model;

import lombok.Data;

@Data
public class Epilogue_bbs {
	private int epil_bbs_no;
	private int members_user_no;
	private String writer;
	private String subject;
	private String content;
	private int product_prod_no;
	private int order_history_order_his_no;
	private String reg_date;
	private String edit_date;
	
	 
	   // 페이지 구현이 필요한 경우 아래 속성도 추가한다.
    private static int offset;
    private static int listCount;

    public static int getOffset() {
        return offset;
    }

    public static void setOffset(int offset) {
    	Epilogue_bbs.offset = offset;
    }

    public static int getListCount() {
        return listCount;
    }

    public static void setListCount(int listCount) {
    	Epilogue_bbs.listCount = listCount;
    }
}
