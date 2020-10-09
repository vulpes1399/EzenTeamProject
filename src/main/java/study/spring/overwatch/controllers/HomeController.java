package study.spring.overwatch.controllers;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import study.spring.overwatch.model.List_item;
import study.spring.overwatch.service.List_itemService;

@Controller
public class HomeController {
	@Autowired
	List_itemService list_itemService;
	
	@RequestMapping(value = {"/", "home"},method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {

	      
    List_item input = new List_item();
     
    List<List_item> output = null; // 조회결과가 저장될 객체
    List<List_item> output1 = null; // 조회결과가 저장될 객체
    try {
        
        // 데이터 조회하기
        output = list_itemService.getSelectJoin(input);
        output1 = list_itemService.getSelectJoin2(input);
    } catch (Exception e) { e.printStackTrace(); }

    // View 처리
    model.addAttribute("output", output);
    model.addAttribute("output1", output1);
	
		return "index";
	}
}
