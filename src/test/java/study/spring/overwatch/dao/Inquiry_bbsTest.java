package study.spring.overwatch.dao;


import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.overwatch.model.Inquiry_bbs;

/** Lombok의 Log4j 객체 */
// import lombok.extern.slf4j.Slf4j;
@Slf4j
/** JUnit에 의한 테스트 클래스로 정의 */
// import org.junit.runner.RunWith;
// import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
// import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
// import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
// import org.junit.FixMethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class Inquiry_bbsTest {

    /** MyBatis의 SQL세션 주입 설정 */
    // import org.springframework.beans.factory.annotation.Autowired;
    @Autowired
    private SqlSession sqlSession;

    /** 단일행 조회 테스트 */
    @Test
    public void testA() {    
        // import study.spring.simplespring.model.Inquiry_bbs;
    	Inquiry_bbs input= new Inquiry_bbs();
        input.setInq_bbs_no(1);
        sqlSession.selectOne("Inquiry_bbsMapper.selectInquiry_bbsItem", input);
    }
    
    
    /** 다중행 조회 테스트 */
    @Test
    public void testB() {    
        // import study.spring.simplespring.model.Cart;
        Inquiry_bbs input = new Inquiry_bbs();
        input.setInq_bbs_no(2);
        sqlSession.selectList("Inquiry_bbsMapper.selectInquiry_bbsList", input);
    }
    /** 데이터 저장 테스트 */
    @Test
    public void testC() {        
        Inquiry_bbs input = new Inquiry_bbs();
        input.setMembers_user_no(1);
        input.setType("Q");
        input.setWriter("최준호");
        input.setSubject("제발 한 번에 되면 좋겠다.");
        input.setContent("진짜");
        input.setReg_date("2020-08-27 11:10:55");
        input.setEdit_date("2020-08-27 11:10:55");
        sqlSession.insert("Inquiry_bbsMapper.insertInquiry_bbs", input);
    }
    
    /** 데이터 삭제 테스트 */
    @Test
    public void testD() {        
        Inquiry_bbs input = new Inquiry_bbs();
        input.setInq_bbs_no(6);
        sqlSession.delete("Inquiry_bbsMapper.deleteInquiry_bbs", input);
    }

    /** 데이터 수정 테스트 */
    @Test
    public void testE() {        
        Inquiry_bbs input = new Inquiry_bbs();
        input.setInq_bbs_no(1);
        input.setMembers_user_no(2);
        input.setType("Q");
        input.setWriter("최준호");
        input.setSubject("입점문의(수정)");
        input.setContent("다시 확인해주세요.");
        input.setReg_date("2020-08-27 11:10:55");
        input.setEdit_date("2020-08-27 11:10:55");
   
        sqlSession.update("Inquiry_bbsMapper.updateInquiry_bbs", input);
    }

    /** 전체 데이터 수 조회 */
    @Test
    public void testF() {
        int count = sqlSession.selectOne("Inquiry_bbsMapper.selectCountInquiry_bbs", null);
        log.debug("전체 데이터 수: " + count);
    }

    /** 조건에 따른 데이터 수 조회 */
    @Test
    public void testG() {    
        // import study.spring.simplespring.model.Inquiry_bbs;
        Inquiry_bbs input = new Inquiry_bbs();
        input.setWriter("관리자");
        int count = sqlSession.selectOne("Inquiry_bbsMapper.selectCountInquiry_bbs", input);
        log.debug("조건에 따른 데이터 수: " + count);
    }


}