package study.spring.overwatch.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.overwatch.model.Basket;
import study.spring.overwatch.model.Cart;
import study.spring.overwatch.service.BasketService;

@Slf4j
@Service
public class BasketServiceImpl implements BasketService{
	@Autowired
	SqlSession sqlSession;
	@Override
	public List<Basket> getBasketList(int user_no) throws Exception {
		List<Basket> result = null;
		
		try {
			result = sqlSession.selectList("BasketMapper.selectBasketList", user_no);
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
	public void insertBasket(Cart input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.insert("BasketMapper.insertBasket", input);

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

	}


	@Override
	public int deleteBasket(Basket input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("BasketMapper.deleteBasket", input);

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
