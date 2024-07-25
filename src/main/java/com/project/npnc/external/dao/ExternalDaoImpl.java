package com.project.npnc.external.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.npnc.external.dto.ExternalDto;
import java.util.List;

@Repository
public class ExternalDaoImpl implements ExternalDao {

    private final SqlSession sqlSession;

    @Autowired
    public ExternalDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<ExternalDto> getAllContacts() {
        return sqlSession.selectList("external.getAllContacts");
    }

    @Override
    public ExternalDto getContactById(int AB_EXTERNAL_KEY) {
        return sqlSession.selectOne("external.getContactById", AB_EXTERNAL_KEY);
    }

    @Override
    public void addContact(ExternalDto externalDto) {
        sqlSession.insert("external.addContact", externalDto);
    }

    @Override
    public void updateContact(ExternalDto externalDto) {
        sqlSession.update("external.updateContact", externalDto);
    }

    @Override
    public void deleteContact(int AB_EXTERNAL_KEY) {
        sqlSession.delete("external.deleteContact", AB_EXTERNAL_KEY);
    }
}
