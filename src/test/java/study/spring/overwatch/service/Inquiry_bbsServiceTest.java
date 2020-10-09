package study.spring.overwatch.service;

import java.util.List;

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

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class Inquiry_bbsServiceTest {
	@Autowired
	private Inquiry_bbsService inquiry_bbsService;
	
	@Test
	public void testA() {
		Inquiry_bbs input = new Inquiry_bbs();
		input.setInq_bbs_no(3);
		
		Inquiry_bbs output = null;
		
		try {
			output = inquiry_bbsService.getInquiry_bbsItem(input);
			log.debug(output.toString());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	@Test
	public void testB() {
		Inquiry_bbs input = new Inquiry_bbs();
		input.setType("Q");
		
		List<Inquiry_bbs> output = null;
		try {
			output = inquiry_bbsService.getInquiry_bbsList(input);
			log.debug(output.toString());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	/** 전체 데이터 수 조회 */
    @Test
    public void testC() {
        int count = 0;

        try {
            count = inquiry_bbsService.getInquiry_bbsCount(null);
            log.debug("전체 데이터 수: " + count);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            e.printStackTrace();
        }
    }
    
    /** 조건에 따른 데이터 수 조회 */
    @Test
    public void testD() {
        int count = 0;

        Inquiry_bbs input = new Inquiry_bbs();
        input.setType("A");

        try {
            count = inquiry_bbsService.getInquiry_bbsCount(input);
            log.debug("공학을 포함하는 학과이름을 갖는 데이터 수: " + count);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            e.printStackTrace();
        }
    }

    /** 데이터 저장 테스트 */
    @Test
    public void testE() {
        Inquiry_bbs input = new Inquiry_bbs();
        input.setMembers_user_no(1);
        input.setType("A");
        input.setWriter("관리자");
        input.setSubject("제발 한 번에 되면 좋겠다.");
        input.setContent("진짜");
        input.setReg_date("2020-08-27 11:10:55");
        input.setEdit_date("2020-08-27 11:10:55");

        int output = 0;

        try {
            output = inquiry_bbsService.addInquiry_bbs(input);
            log.debug("저장된 데이터 수: " + output);
            // [중요] 생성된 PK값은 MyBatis에 의해 입력 파라미터의 해당 멤버변수에 셋팅된다.
            log.debug("생성된 PK값 : " + input.getInq_bbs_no());
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            e.printStackTrace();
        }
    }

    /** 데이터 수정 테스트 */
    @Test
    public void testF() {
        Inquiry_bbs input = new Inquiry_bbs();
        input.setInq_bbs_no(3);
        input.setMembers_user_no(2);
        input.setType("A");
        input.setWriter("아이신나");
        input.setSubject("입점문의(수정)");
        input.setContent("다시 확인해주세요.");
        input.setReg_date("2020-08-27 11:10:55");
        input.setEdit_date("2020-08-27 11:10:55");

        int output = 0;

        try {
            output = inquiry_bbsService.editInquiry_bbs(input);
            log.debug("수정된 데이터 수: " + output);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            e.printStackTrace();
        }
    }

    /** 데이터 삭제 테스트 */
    @Test
    public void testG() {
        Inquiry_bbs input = new Inquiry_bbs();
        input.setInq_bbs_no(14);

        int output = 0;

        try {
            output = inquiry_bbsService.deleteInquiry_bbs(input);
            log.debug("삭제된 데이터 수: " + output);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            e.printStackTrace();
        }
    }

}
