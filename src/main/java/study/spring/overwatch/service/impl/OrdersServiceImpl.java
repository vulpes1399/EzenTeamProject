package study.spring.overwatch.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.overwatch.model.Orders;
import study.spring.overwatch.service.OrdersService;

@Slf4j
@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int addOrders(Orders input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.insert("OrdersMapper.insertOrders", input);

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
	public int selectOrderNo() {
		int result = sqlSession.selectOne("OrdersMapper.selectOrdersNo");
		return result;
	}
	
	@Override
	public Orders getOrdersResult(int user_no) throws Exception {
		Orders result = null;

		try {
			result = sqlSession.selectOne("OrdersMapper.selectOrdersResult", user_no);
			if (result == null) {
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
	public int deleteAllBasket(int user_no) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("BasketMapper.deleteAllBasket", user_no);

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

	@Override
	public List<Orders> getDeliveryList(int user_no) throws Exception {
			List<Orders> result = null;
			
			try {
				result = sqlSession.selectList("OrdersMapper.selectDeliveryList", user_no);
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
	public List<Orders> getOrdersList(int user_no) throws Exception {
			List<Orders> result = null;
			
			try {
				result = sqlSession.selectList("OrdersMapper.selectOrdersList", user_no);
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
	public List<Orders> getOrdersResultList(int user_no) throws Exception {
			List<Orders> result = null;
			
			try {
				result = sqlSession.selectList("OrdersMapper.selectOrdersResultList", user_no);
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


}
