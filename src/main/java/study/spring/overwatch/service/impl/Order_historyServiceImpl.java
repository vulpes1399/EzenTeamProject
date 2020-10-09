package study.spring.overwatch.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.overwatch.model.Order_history;
import study.spring.overwatch.service.Order_historyService;

@Slf4j
@Service
public class Order_historyServiceImpl implements Order_historyService{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Order_history getOrder_historyItem(Order_history input) throws Exception {
		Order_history result = null;
		
		try {
			result = sqlSession.selectOne("Order_historyMapper.selectOrder_historyItem", input);
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
	public List<Order_history> getOrder_historyList(Order_history input) throws Exception {
		List<Order_history> result = null;
		
		try {
			result = sqlSession.selectList("Order_historyMapper.selectOrder_historyList", input);
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
	public int getOrder_historyCount(Order_history input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("Order_historyMapper.selectCountOrder_history", input);
			} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	@Override
	public int addOrder_history(Order_history input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.insert("Order_historyMapper.insertOrder_history", input);

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
	public int editOrder_history(Order_history input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.update("Order_historyMapper.updateOrder_history", input);

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
	public int deleteOrder_history(Order_history input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.delete("Order_historyMapper.deleteOrder_history", input);

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
	public int updateOrderDecide(int iorders_order_no) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("Order_historyMapper.updateOrderDecide", iorders_order_no);

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
	public int updateOrderChange(int iorders_order_no) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("Order_historyMapper.updateOrderChange", iorders_order_no);

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
	public int updateOrderRefund(int iorders_order_no) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("Order_historyMapper.updateOrderRefund", iorders_order_no);

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

}
