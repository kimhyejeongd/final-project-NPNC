package com.project.npnc.memberVacation.controller;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.memberVacation.model.dto.MemberVacation;
import com.project.npnc.memberVacation.model.service.MemberVacationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/memberVacation")
@RequiredArgsConstructor
public class MemberVacationController {

	private final MemberVacationService service;
	
	@Scheduled(cron="0 0 0 1 1 ?")
	public void memberVacationCheck() {
		List<MemberVacation> mv=service.selectMemberVacationEnrollDate();
		service.updateMemberVacationYear(mv);
	}
	
}
