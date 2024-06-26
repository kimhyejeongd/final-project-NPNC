package com.project.npnc.job.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.job.model.dto.Job;

@Repository
public class JobDaoImpl implements JobDao {

	@Override
	public List<Job> selectJobAll(SqlSession session) {
	
		return session.selectList("job.selectJobAll");
	}

	@Override
	public int insertJob(SqlSession session, Job j) {
		
		return session.insert("job.insertJob",j);
	}

	@Override
	public int updateJob(SqlSession session, Job j) {
		return session.update("job.updateJob",j);
	}

	@Override
	public int deleteJob(SqlSession session, int jobKey) {
		return session.delete("job.deleteJob",jobKey);
	}

	
	
}
