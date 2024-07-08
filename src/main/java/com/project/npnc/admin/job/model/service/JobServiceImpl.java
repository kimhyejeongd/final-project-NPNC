package com.project.npnc.admin.job.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.admin.job.model.dao.JobDao;
import com.project.npnc.admin.job.model.dto.Job;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JobServiceImpl implements JobService{

	private final JobDao dao;
	private final SqlSession session;
	
	@Override
	public List<Job> selectJobAll() {
		
		return dao.selectJobAll(session);
	}

	@Override
	public int insertJob(String jobName) {
		
		return dao.insertJob(session, jobName);
	}

	@Override
	public int updateJob(Job j) {
		
		return dao.updateJob(session,j);
	}

	@Override
	public int deleteJob(String jobKey) {
		
		return dao.deleteJob(session, jobKey);
	}
	
	
	
	
	
}
