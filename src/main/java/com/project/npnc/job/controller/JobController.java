package com.project.npnc.job.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.job.model.dto.Job;
import com.project.npnc.job.model.service.JobService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/job")
@RequiredArgsConstructor
public class JobController {

	private final JobService service;
	
	
	@GetMapping("/insertjob.do")
	public void insertJob() {}
	
	@PostMapping("/insertjobend.do")
	public String insertJob(Job j,Model m) {
		int result=service.insertJob(j);
		String msg,loc;
		if(result>0) {
			msg="등록성공";
			loc="/";
		}else {
			msg="등록실패";
			loc="/";
		}
		return "common/msg";
	}
	
	@GetMapping("/selectjoball.do")
	public String selectJobAll(Model m) {
		m.addAttribute("job",service.selectJobAll());
		return "job/joblist";
	}
	
	@PostMapping("/deletejob.do")
	public String deleteJob(int jobKey,Model m) {
		int result=service.deleteJob(jobKey);
		String msg,loc;
		if(result>0) {
			msg="삭제성공";
			loc="/";
		}else {
			msg="삭제실패";
			loc="/";
		}
		return "common/msg";
	}
	
	@PostMapping("/updatejob.do")
	public String updateJob(int key,int jobName,Model m) {
		m.addAttribute("key",key);
		m.addAttribute("jobName",jobName);
		
		return "job/updatejob";
	}
	
	
	
	@PostMapping("/updatejobend.do")
	public String updateJob(Job j,Model m) {
		int result=service.updateJob(j);
		String msg,loc;
		if(result>0) {
			msg="수정성공";
			loc="/joblist";
		}else {
			msg="수정실패";
			loc="/joblist";
		}
		return "common/msg";
	}
	
	
	
	
	
	
}
