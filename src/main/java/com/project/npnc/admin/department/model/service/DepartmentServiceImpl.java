package com.project.npnc.admin.department.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.admin.department.model.dao.DepartmentDao;
import com.project.npnc.admin.department.model.dto.Department;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {

	private final DepartmentDao dao;
	private final SqlSession session;
	
	@Override
	public List<Department> selectDeptAll() {
		
		return dao.selectDeptAll(session);
	}

	@Override
	public int insertDept(String deptName) {
		
		return dao.insertDept(session, deptName);
	}

	@Override
	public int updateDept(Department d) {
	
		return dao.updateDept(session, d);
	}

	@Override
	public int deleteDept(String deptKey) {
		return dao.deleteDept(session, deptKey);
	}

	
}
