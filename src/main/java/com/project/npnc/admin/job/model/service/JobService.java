package com.project.npnc.admin.job.model.service;

import java.util.List;

import com.project.npnc.admin.job.model.dto.Job;

public interface JobService {
	
	List<Job> selectJobAll();
	int insertJob(String jobName);
	int updateJob(Job j);
	int deleteJob(String jobKey);
	
}
