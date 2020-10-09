package study.spring.overwatch.model;

import lombok.Data;

@Data
public class Inquiry_bbs {
	private int inq_bbs_no;
	private int members_user_no;
	private String type;
	private String writer;
	private String subject;
	private String content;
	private String reg_date;
	private String edit_date;
	

	   // 페이지 구현이 필요한 경우 아래 속성도 추가한다.
	    private static int offset;
	    private static int listCount;

	    public static int getOffset() {
	        return offset;
	    }

	    public static void setOffset(int offset) {
	    	Inquiry_bbs.offset = offset;
	    }

	    public static int getListCount() {
	        return listCount;
	    }

	    public static void setListCount(int listCount) {
	    	Inquiry_bbs.listCount = listCount;
	    }
}


