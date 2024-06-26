package com.project.npnc.job.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.job.model.dao.JobDao;
import com.project.npnc.job.model.dto.Job;

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
	public int insertJob(Job j) {
		
		return dao.insertJob(session, j);
	}

	@Override
	public int updateJob(Job j) {
		
		return dao.updateJob(session,j);
	}

	@Override
	public int deleteJob(int jobKey) {
		
		return dao.deleteJob(session, jobKey);
	}
	
	
	
	
	
}
