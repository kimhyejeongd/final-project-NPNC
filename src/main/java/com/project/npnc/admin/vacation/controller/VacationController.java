package com.project.npnc.admin.vacation.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.admin.vacation.model.dto.Vacation;
import com.project.npnc.admin.vacation.model.service.VacationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/vacation")
@RequiredArgsConstructor
public class VacationController {
	
	private final VacationService service;
	
	@GetMapping("/selectVacationAll")
	public String selectVacationAll(Model m){
		List<Vacation> vacation =service.selectVacationAll();
		m.addAttribute("vacation",vacation);
		return "admin/vacation/vacationlist";
	}
	
	@PostMapping("/insertVacation")
	public String insertVacation(String vacationName,Model m) {
		int result=service.insertVacation(vacationName);
		String msg,loc;
		if(result>0) {
			msg="등록성공";
			loc="/job/selectjoball.do";
		}else {
			msg="등록실패";
			loc="/job/selectjoball.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
	}
	
	@PostMapping("/updateVacation")
	public String updateVacation(Vacation v,Model m) {
		int result=service.updateVacation(v);
		String msg,loc;
		if(result>0) {
			msg="등록성공";
			loc="/job/selectjoball.do";
		}else {
			msg="등록실패";
			loc="/job/selectjoball.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
	}
	
	@PostMapping("/deleteVacation")
	public String deleteVacation(int vacationKey,Model m) {
		int result=service.deleteVacation(vacationKey);
		String msg,loc;
		if(result>0) {
			msg="삭제성공";
			loc="/job/selectjoball.do";
		}else {
			msg="삭제실패";
			loc="/job/selectjoball.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
		
	}
	
	
}
