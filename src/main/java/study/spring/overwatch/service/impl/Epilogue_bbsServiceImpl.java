package study.spring.overwatch.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.overwatch.model.Epilogue_bbs;
import study.spring.overwatch.service.Epilogue_bbsService;

@Slf4j
@Service
public class Epilogue_bbsServiceImpl implements Epilogue_bbsService{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Epilogue_bbs getEpilogue_bbsItem(Epilogue_bbs input) throws Exception {
		Epilogue_bbs result = null;
		
		try {
			result = sqlSession.selectOne("Epilogue_bbsMapper.selectEpilogue_bbsItem", input);
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
	public List<Epilogue_bbs> getEpilogue_bbsList(int product_prod_no) throws Exception {
		List<Epilogue_bbs> result = null;
		
		try {
			result = sqlSession.selectList("Epilogue_bbsMapper.selectEpilogue_bbsList", product_prod_no);
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
	public int getEpilogue_bbsCount(Epilogue_bbs input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("Epilogue_bbsMapper.selectCountEpilogue_bbs", input);
			} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	@Override
	public int addEpilogue_bbs(Epilogue_bbs input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.insert("Epilogue_bbsMapper.insertEpilogue_bbs", input);

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
	public int editEpilogue_bbs(Epilogue_bbs input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.update("Epilogue_bbsMapper.updateEpilogue_bbs", input);

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
	public int deleteEpilogue_bbs(Epilogue_bbs input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.delete("Epilogue_bbsMapper.deleteEpilogue_bbs", input);

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
