package study.spring.overwatch.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.overwatch.model.Item_inq_bbs;
import study.spring.overwatch.service.Item_inq_bbsService;

@Slf4j
@Service
public class Item_inq_bbsServiceImpl implements Item_inq_bbsService{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Item_inq_bbs getItem_inq_bbsItem(Item_inq_bbs input) throws Exception {
		Item_inq_bbs result = null;
		
		try {
			result = sqlSession.selectOne("Item_inq_bbsMapper.selectItem_inq_bbsItem", input);
			if(result==null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
			// TODO: handle exception
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	@Override
	public List<Item_inq_bbs> getItem_inq_bbsList(int product_prod_no) throws Exception {
		List<Item_inq_bbs> result = null;
		
		try {
			result = sqlSession.selectList("Item_inq_bbsMapper.selectItem_inq_bbsList", product_prod_no);
			if(result==null) {
				throw new NullPointerException("result=null");
				}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
			// TODO: handle exception
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
		
	}
	@Override
	public int getItem_inq_bbsCount(Item_inq_bbs input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("Item_inq_bbsMapper.selectCountItem_inq_bbs", input);
			} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	@Override
	public int addItem_inq_bbs(Item_inq_bbs input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.insert("Item_inq_bbsMapper.insertItem_inq_bbs", input);

	            if (result == 0) {
	                throw new NullPointerException("result=0");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("저장된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 저장에 실패했습니다.");
	        }

		return result;
	}
	@Override
	public int editItem_inq_bbs(Item_inq_bbs input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.update("Item_inq_bbsMapper.updateItem_inq_bbs", input);

	            if (result == 0) {
	                throw new NullPointerException("result=0");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("수정된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 수정에 실패했습니다.");
	        }
		return result;
	}
	@Override
	public int deleteItem_inq_bbs(Item_inq_bbs input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.delete("Item_inq_bbsMapper.deleteItem_inq_bbs", input);

	            if (result == 0) {
	                throw new NullPointerException("result=0");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("삭제된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 삭제에 실패했습니다.");
	        }
		return result;
	}

}
