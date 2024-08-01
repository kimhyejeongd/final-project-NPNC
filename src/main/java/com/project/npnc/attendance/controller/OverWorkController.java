package com.project.npnc.attendance.controller;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.npnc.attendance.model.service.AttendanceService;
import com.project.npnc.common.PageFactory;
import com.project.npnc.common.SearchPageFactory;
import com.project.npnc.document.model.dto.OvertimeApply;
import com.project.npnc.security.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/overwork")
@RequiredArgsConstructor
public class OverWorkController {

	private final AttendanceService service;
	private final PageFactory pageFactory;
	private final SearchPageFactory searchPageFactory;
	
	
	
	@GetMapping("/selectoverworkByMemberKey")
	public String selectoverworkByMemberKey(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,
			Authentication authentication,
			Model m
			){
		Map page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		System.out.println("두번 ???");
		Member member=(Member)authentication.getPrincipal();
		
		List<OvertimeApply> overTimeApply=service.selectoverworkByMemberKey(member.getMemberKey(),page);
		int totaldata=service.selectoverworkByMemberKeyCount(member.getMemberKey());
		m.addAttribute("pagebar",pageFactory.getPage(cPage, numPerpage, totaldata, "selectoverworkByMemberKey"));
		m.addAttribute("overtimework",overTimeApply);
		
		return "attendance/overwork/overworklist";
	}
	
	@GetMapping("/searchoverworkByMemberKey")
	public String searchoverworkByMemberKey(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,
			String searchType,
			Authentication authentication,
			Model m
			){
		Member member=(Member)authentication.getPrincipal();
		Map<String,Object> searchMap=Map.of("searchType",searchType,"memberKey",member.getMemberKey());
		Map page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<OvertimeApply> overTimeApply=service.searchoverworkByMemberKey(searchMap,page);
		int totaldata=service.searchoverworkByMemberKeyCount(searchMap);
		m.addAttribute("pagebar",searchPageFactory.getPage(cPage, numPerpage, totaldata,null,searchType,null,null,"searchoverworkByMemberKey"));
		m.addAttribute("overtimework",overTimeApply);
		
		return "attendance/ajax_response/overworkresponse";
	}
	
	
	
	
}
