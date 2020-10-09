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
import study.spring.overwatch.model.Members;

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
public class MembersTest {

    /** MyBatis의 SQL세션 주입 설정 */
    // import org.springframework.beans.factory.annotation.Autowired;
    @Autowired
    private SqlSession sqlSession;

    /** 단일행 조회 테스트 */
    @Test
    public void testA() {    
        // import study.spring.simplespring.model.Members;
        Members input= new Members();
        input.setUser_no(1);
        sqlSession.selectOne("MembersMapper.selectMembersItem", input);
    }
    
    
    /** 다중행 조회 테스트 */
    @Test
    public void testB() {    
        // import study.spring.simplespring.model.Cart;
        Members input = new Members();
        input.setAddr2("1층");
        sqlSession.selectList("MembersMapper.selectMembersList", input);
    }
    /** 데이터 저장 테스트 */
    @Test
    public void testC() {        
        Members input = new Members();
        input.setUser_name("주영아");
        input.setUser_id("zzu");
        input.setUser_pw("sadf");
        input.setEmail("poi@opi.com");
        input.setTel("01096385274");
        input.setPostcode("45369");
        input.setAddr1("서울시 개봉동");
        input.setAddr2("15층");
        input.setIs_out("N");
        input.setReg_date("2020-08-27 11:10:55");
        input.setEdit_date("2020-08-27 11:10:55");
        sqlSession.insert("MembersMapper.insertMembers", input);
    }
    
    /** 데이터 삭제 테스트 */
    @Test
    public void testD() {        
        Members input = new Members();
        input.setUser_no(5);
        sqlSession.delete("MembersMapper.deleteMembers", input);
    }

    /** 데이터 수정 테스트 */
    @Test
    public void testE() {        
        Members input = new Members();
        input.setUser_no(3);
        input.setUser_name("이호진");
        input.setUser_id("mung");
        input.setUser_pw("sadfff");
        input.setEmail("mun@opi.com");
        input.setTel("01011385274");
        input.setPostcode("11112");
        input.setAddr1("서울시 도봉구");
        input.setAddr2("8층");
        input.setIs_out("N");
        input.setReg_date("2020-08-27 12:10:55");
        input.setEdit_date("2020-08-27 13:18:55");
        sqlSession.update("MembersMapper.updateMembers", input);
    }

    /** 전체 데이터 수 조회 */
    @Test
    public void testF() {
        int count = sqlSession.selectOne("MembersMapper.selectCountMembers", null);
        log.debug("전체 데이터 수: " + count);
    }

    /** 조건에 따른 데이터 수 조회 */
    @Test
    public void testG() {    
        // import study.spring.simplespring.model.Members;
        Members input = new Members();
        input.setAddr2("1층");
        int count = sqlSession.selectOne("MembersMapper.selectCountMembers", input);
        log.debug("1층을 포함하는 상세주소인 데이터 수: " + count);
    }


}