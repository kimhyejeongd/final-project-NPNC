package com.project.npnc.admin.department.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.admin.department.model.dto.Department;
import com.project.npnc.admin.department.model.service.DepartmentService;
import com.project.npnc.admin.job.model.dto.Job;
import com.project.npnc.security.dto.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/dept")
@Slf4j
public class DepartmentController {
	
	private final DepartmentService service;
	
	
	@PostMapping("/insertdept.do")
	public String insertDept(String deptName,Model m) {
		int result=service.insertDept(deptName);
		String msg,loc;
		if(result>0) {
			msg="성공";
			loc="/admin/dept/selectdeptall.do";
		}else {
			msg="실패";
			loc="/admin/dept/selectdeptall.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
	}
	
	@GetMapping("/selectdeptall.do")
	public String selectDeptAll(Authentication authentication,Model m) {
		Member loginMem=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		m.addAttribute("loginMember",loginMem);
		List<Department> d=service.selectDeptAll();
		m.addAttribute("depts",d);
		return "admin/dept/deptlist";
	}
	
	@PostMapping("/deletedept.do")
	public ResponseEntity<Map<String,Object>> deleteDept(String no) {
		Map<String,Object> response = new HashMap<>();
		int result=0;
		try {
			result = service.deleteDept(no);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "삭제에 실패했습니다.");
			return ResponseEntity.ok(response);
		}
		response.put("status", "success");
		response.put("message", "삭제 완료");
		return ResponseEntity.ok(response);
	}
	
	@GetMapping("/updatedept")
	public ResponseEntity<Map<String,Department>> updateDept(String deptKey) {
		Map<String,Department> response =new HashMap<>();
		response.put("dept", service.selectDeptByKey(deptKey));
		return ResponseEntity.ok(response);

	}

	
	@PostMapping("/updatedeptend")
	public String updateDept(Department d,Model m) {
		int result=service.updateDept(d);
		String msg,loc;
		if(result>0) {
			msg="성공";
			loc="/admin/dept/selectdeptall.do";
		}else {
			msg="실패";
			loc="/admin/dept/selectdeptall.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
}
