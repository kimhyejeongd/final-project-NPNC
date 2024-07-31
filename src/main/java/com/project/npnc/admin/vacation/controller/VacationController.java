package com.project.npnc.admin.vacation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.admin.member.model.dto.AdminMember;
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
	public String insertVacation(Vacation vacation,Model m) {
		int result=service.insertVacation(vacation);
		String msg,loc;
		if(result>0) {
			msg="등록성공";
			loc="/admin/vacation/selectVacationAll";
		}else {
			msg="등록실패";
			loc="/admin/vacation/selectVacationAll";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
	}
	
	@GetMapping("/updateVacation")
	public ResponseEntity<Map<String,Vacation>> updateVacation(int vacationKey) {
		Vacation vacation=service.selectVacationByKey(vacationKey);
		Map<String,Vacation> response =new HashMap<>();
		response.put("vacation", vacation);

		return ResponseEntity.ok(response);
	}
	
	@PostMapping("/updateVacationEnd")
	public String updateVacation(Vacation v,Model m) {
		int result=service.updateVacation(v);
		String msg,loc;
		if(result>0) {
			msg="수정성공";
			loc="/admin/vacation/selectVacationAll";
		}else {
			msg="수정실패";
			loc="/admin/vacation/selectVacationAll";
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
			loc="/admin/vacation/selectVacationAll";
		}else {
			msg="삭제실패";
			loc="/admin/vacation/selectVacationAll";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
		
	}
	
	
}
