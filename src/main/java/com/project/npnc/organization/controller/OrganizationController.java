package com.project.npnc.organization.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.organization.dto.OrganizationDto;
import com.project.npnc.organization.service.OrganizationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OrganizationController {
	private final OrganizationService service;
	
	
	
	@RequestMapping("/organ")
	public String notein(Model m) {
		
		List<OrganizationDto> list=service.selectOrganAll();
		System.out.println(list);
		m.addAttribute("list",list);
		
		return "organ/organ";
	}
	
}
