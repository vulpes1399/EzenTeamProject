package study.spring.overwatch.service;

import java.util.List;
import study.spring.overwatch.model.List_item;

public interface List_itemService {

	public List<List_item> getSelectJoin(List_item input) throws Exception;

	public List<List_item> getSelectJoin2(List_item input) throws Exception;

	public List<List_item> getSelectJoin3(List_item input) throws Exception;

	public List<List_item> getSelectJoin4(List_item input) throws Exception;
	
	public List_item getSelectProdDeImg(List_item input) throws Exception;
	
	public List<List_item> getSelectMyWatch(List_item input) throws Exception;

	public List_item getList_itemItem(List_item input) throws Exception;

	public int getList_itemCount(List_item input) throws Exception;

	public int getList_itemCount2(List_item input) throws Exception;

	public int getList_itemCount3(List_item input) throws Exception;

	public int getList_itemCount4(List_item input) throws Exception;

	public int getList_itemCount5(List_item input) throws Exception;

}
