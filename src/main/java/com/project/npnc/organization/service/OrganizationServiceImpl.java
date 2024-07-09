package com.project.npnc.organization.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.organization.dao.OrganizationDao;
import com.project.npnc.organization.dto.OrganizationDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrganizationServiceImpl implements OrganizationService {
	private final OrganizationDao dao;
	private final SqlSession session;
	
	@Override
	public List<OrganizationDto> selectOrganAll() {
		
		
		return dao.selectOrganAll(session);
	}

}
