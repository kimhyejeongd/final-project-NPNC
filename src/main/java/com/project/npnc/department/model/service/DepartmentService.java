package com.project.npnc.department.model.service;

import java.util.List;

import com.project.npnc.department.model.dto.Department;

public interface DepartmentService {

	List<Department> selectDeptAll();
	int insertDept(String deptName);
	int updateDept(Department d);
	int deleteDept(String deptKey);
	
}
