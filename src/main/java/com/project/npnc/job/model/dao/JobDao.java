package com.project.npnc.job.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.job.model.dto.Job;

public interface JobDao {

	List<Job> selectJobAll(SqlSession session);
	int insertJob(SqlSession session,String jobName);
	int updateJob(SqlSession session,Job j);
	int deleteJob(SqlSession session,String jobKey);
	
}
