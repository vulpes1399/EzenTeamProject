package study.spring.overwatch.service;

import java.util.List;

import study.spring.overwatch.model.Inquiry_bbs;

public interface Inquiry_bbsService {
	public Inquiry_bbs getInquiry_bbsItem(Inquiry_bbs input) throws Exception;

	public List<Inquiry_bbs> getInquiry_bbsList(Inquiry_bbs input) throws Exception;

	public int getInquiry_bbsCount(Inquiry_bbs input) throws Exception;

	public int addInquiry_bbs(Inquiry_bbs input) throws Exception;

	public int editInquiry_bbs(Inquiry_bbs input) throws Exception;

	public int deleteInquiry_bbs(Inquiry_bbs input) throws Exception;
}
