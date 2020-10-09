package study.spring.overwatch.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.overwatch.model.Delivery;
import study.spring.overwatch.service.DeliveryService;

@Slf4j
@Service
public class DeliveryServiceImpl implements DeliveryService{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Delivery getDeliveryItem(Delivery input) throws Exception {
		Delivery result = null;
		
		try {
			result = sqlSession.selectOne("DeliveryMapper.selectDeliveryItem", input);
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
	public List<Delivery> getDeliveryList(Delivery input) throws Exception {
		List<Delivery> result = null;
		
		try {
			result = sqlSession.selectList("DeliveryMapper.selectDeliveryList", input);
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
	public int getDeliveryCount(Delivery input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("DeliveryMapper.selectCountDelivery", input);
			} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	@Override
	public int addDelivery(Delivery input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.insert("DeliveryMapper.insertDelivery", input);

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
	public int editDelivery(Delivery input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.update("DeliveryMapper.updateDelivery", input);

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
	public int deleteDelivery(Delivery input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.delete("DeliveryMapper.deleteDelivery", input);

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
	public int updateDeliveryCancel(int iorders_order_no) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("DeliveryMapper.updateDeliveryCancel", iorders_order_no);

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
