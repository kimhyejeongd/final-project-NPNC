package com.project.npnc.organization.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.organization.dto.OrganizationDto;

public interface OrganizationDao {
	
	public List<OrganizationDto> selectOrganAll(SqlSession session);
}
