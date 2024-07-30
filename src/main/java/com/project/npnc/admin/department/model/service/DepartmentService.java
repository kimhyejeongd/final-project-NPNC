package com.project.npnc.admin.department.model.service;

import java.util.List;

import com.project.npnc.admin.department.model.dto.Department;

public interface DepartmentService {

	List<Department> selectDeptAll();
	Department selectDeptByKey(String deptKey);
	int insertDept(String deptName);
	int updateDept(Department d);
	int deleteDept(String deptKey);
	
}
