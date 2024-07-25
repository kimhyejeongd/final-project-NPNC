package com.project.npnc.external.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.npnc.external.dto.ExternalDto;

import java.util.List;

@Repository
public class ExternalDaoImpl implements ExternalDao {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<ExternalDto> getAllContacts() {
        return sqlSession.selectList("com.project.npnc.external.dao.ExternalDao.getAllContacts");
    }

    @Override
    public ExternalDto getContactById(int id) {
        return sqlSession.selectOne("com.project.npnc.external.dao.ExternalDao.getContactById", id);
    }

    @Override
    public void addContact(ExternalDto externalDto) {
        sqlSession.insert("com.project.npnc.external.dao.ExternalDao.addContact", externalDto);
    }

    @Override
    public void updateContact(ExternalDto externalDto) {
        sqlSession.update("com.project.npnc.external.dao.ExternalDao.updateContact", externalDto);
    }

    @Override
    public void deleteContact(int id) {
        sqlSession.delete("com.project.npnc.external.dao.ExternalDao.deleteContact", id);
    }
}
