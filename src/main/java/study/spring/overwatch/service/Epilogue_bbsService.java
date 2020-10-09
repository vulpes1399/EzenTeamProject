package study.spring.overwatch.service;

import java.util.List;

import study.spring.overwatch.model.Epilogue_bbs;

public interface Epilogue_bbsService {
	public Epilogue_bbs getEpilogue_bbsItem(Epilogue_bbs input) throws Exception;

	public List<Epilogue_bbs> getEpilogue_bbsList(int product_prod_no) throws Exception;

	public int getEpilogue_bbsCount(Epilogue_bbs input) throws Exception;

	public int addEpilogue_bbs(Epilogue_bbs input) throws Exception;

	public int editEpilogue_bbs(Epilogue_bbs input) throws Exception;

	public int deleteEpilogue_bbs(Epilogue_bbs input) throws Exception;
}
