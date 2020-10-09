package study.spring.overwatch.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.overwatch.model.Cart;
import study.spring.overwatch.service.CartService;

@Slf4j
@Service
public class CartServiceImpl implements CartService{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Cart getCartItem(Cart input) throws Exception {
		Cart result = null;
		
		try {
			result = sqlSession.selectOne("CartMapper.selectCartItem", input);
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
	public List<Cart> getCartList(Cart input) throws Exception {
		List<Cart> result = null;
		
		try {
			result = sqlSession.selectList("CartMapper.selectCartList", input);
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
	public int getCartCount(Cart input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("CartMapper.selectCountCart", input);
			} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	@Override
	public int addCart(Cart input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.insert("CartMapper.insertCart", input);

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
	public int editCart(Cart input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.update("CartMapper.updateCart", input);

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
	public int deleteCart(Cart input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.delete("CartMapper.deleteCart", input);

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
