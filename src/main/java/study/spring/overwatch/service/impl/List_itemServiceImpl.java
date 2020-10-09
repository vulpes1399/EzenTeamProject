package study.spring.overwatch.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.overwatch.model.List_item;
import study.spring.overwatch.service.List_itemService;

@Slf4j
@Service
public class List_itemServiceImpl implements List_itemService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List_item getList_itemItem(List_item input) throws Exception {
		List_item result = null;

		try {
			result = sqlSession.selectOne("List_itemMapper.selectList_itemItem", input);
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
	public List<List_item> getSelectJoin(List_item input) throws Exception {
		List<List_item> result = null;

		try {
			result = sqlSession.selectList("List_itemMapper.selectJoin", input);
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
	public List<List_item> getSelectJoin2(List_item input) throws Exception {
		List<List_item> result = null;

		try {
			result = sqlSession.selectList("List_itemMapper.selectJoin2", input);
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
	public List<List_item> getSelectJoin3(List_item input) throws Exception {
		List<List_item> result = null;

		try {
			result = sqlSession.selectList("List_itemMapper.selectJoin3", input);
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
	public List<List_item> getSelectJoin4(List_item input) throws Exception {
		List<List_item> result = null;

		try {
			result = sqlSession.selectList("List_itemMapper.selectJoin4", input);
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
	public int getList_itemCount(List_item input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("List_itemMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getList_itemCount2(List_item input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("List_itemMapper.selectCountAll2", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getList_itemCount3(List_item input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("List_itemMapper.selectCountAll3", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getList_itemCount4(List_item input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("List_itemMapper.selectCountAll4", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getList_itemCount5(List_item input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("List_itemMapper.selectCountAll5", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<List_item> getSelectMyWatch(List_item input) throws Exception {
		List<List_item> result = null;

		try {
			result = sqlSession.selectList("List_itemMapper.selectMyWatch", input);
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
	public List_item getSelectProdDeImg(List_item input) throws Exception {
		List_item result = null;

		try {
			result = sqlSession.selectOne("List_itemMapper.selectProdDeImg", input);
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

}
