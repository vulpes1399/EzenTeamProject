package study.spring.overwatch.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.overwatch.model.Inquiry_bbs;
import study.spring.overwatch.service.Inquiry_bbsService;

@Slf4j
@Service
public class Inquiry_bbsServiceImpl implements Inquiry_bbsService{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Inquiry_bbs getInquiry_bbsItem(Inquiry_bbs input) throws Exception {
		Inquiry_bbs result = null;
		
		try {
			result = sqlSession.selectOne("Inquiry_bbsMapper.selectInquiry_bbsItem", input);
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
	public List<Inquiry_bbs> getInquiry_bbsList(Inquiry_bbs input) throws Exception {
		List<Inquiry_bbs> result = null;
		
		try {
			result = sqlSession.selectList("Inquiry_bbsMapper.selectInquiry_bbsList", input);
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
	public int getInquiry_bbsCount(Inquiry_bbs input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("Inquiry_bbsMapper.selectCountInquiry_bbs", input);
			} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	@Override
	public int addInquiry_bbs(Inquiry_bbs input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.insert("Inquiry_bbsMapper.insertInquiry_bbs", input);

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
	public int editInquiry_bbs(Inquiry_bbs input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.update("Inquiry_bbsMapper.updateInquiry_bbs", input);

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
	public int deleteInquiry_bbs(Inquiry_bbs input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.delete("Inquiry_bbsMapper.deleteInquiry_bbs", input);

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
