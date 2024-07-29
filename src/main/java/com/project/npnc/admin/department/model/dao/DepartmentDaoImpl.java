package com.project.npnc.admin.department.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.admin.department.model.dto.Department;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

	@Override
	public List<Department> selectDeptAll(SqlSession session) {

		return session.selectList("department.selectDeptAll");
	}

	@Override
	public int insertDept(SqlSession session, String deptName) {
		
		return session.insert("department.insertDept",deptName);
	}

	@Override
	public int updateDept(SqlSession session, Department d) {
		
		return session.update("department.updateDept",d);
	}

	@Override
	public int deleteDept(SqlSession session, String deptKey) {
		
		return session.delete("department.deleteDept",deptKey);
	}

	@Override
	public Department selectDeptByKey(SqlSession session, String deptKey) {
		
		return session.selectOne("department.selectDeptByKey",deptKey);
	}

	
	
}
