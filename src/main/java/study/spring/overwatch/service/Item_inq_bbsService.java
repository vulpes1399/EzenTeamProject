package study.spring.overwatch.service;

import java.util.List;

import study.spring.overwatch.model.Item_inq_bbs;

public interface Item_inq_bbsService {
	public Item_inq_bbs getItem_inq_bbsItem(Item_inq_bbs input) throws Exception;

	public List<Item_inq_bbs> getItem_inq_bbsList(int product_prod_no) throws Exception;

	public int getItem_inq_bbsCount(Item_inq_bbs input) throws Exception;

	public int addItem_inq_bbs(Item_inq_bbs input) throws Exception;

	public int editItem_inq_bbs(Item_inq_bbs input) throws Exception;

	public int deleteItem_inq_bbs(Item_inq_bbs input) throws Exception;
}
