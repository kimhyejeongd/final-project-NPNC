package com.project.npnc.organization.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.organization.dto.OrganizationDto;

@Repository
public class OrganizationDaoImpl implements OrganizationDao {

	@Override
	public List<OrganizationDto> selectOrganAll(SqlSession session) {
		
		return session.selectList("organization.organizationChart");
	}
	
}
