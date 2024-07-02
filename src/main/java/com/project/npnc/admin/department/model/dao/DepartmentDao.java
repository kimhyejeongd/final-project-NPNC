package com.project.npnc.admin.department.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.admin.department.model.dto.Department;

public interface DepartmentDao {
	
	List<Department> selectDeptAll(SqlSession session);
	int insertDept(SqlSession session,String deptName);
	int updateDept(SqlSession session,Department d);
	int deleteDept(SqlSession session,String deptKey);
}
