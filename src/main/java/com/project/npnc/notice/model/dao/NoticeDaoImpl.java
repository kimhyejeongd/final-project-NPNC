package com.project.npnc.notice.model.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.npnc.notice.model.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

    private final SqlSession sqlSession;

    @Autowired
    public NoticeDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<NoticeDto> selectAllNotices() {
        return sqlSession.selectList("com.project.npnc.notice.model.dao.NoticeDao.selectAllNotices");
    }

    @Override
    public NoticeDto selectNoticeById(int noticeKey) {
        return sqlSession.selectOne("com.project.npnc.notice.model.dao.NoticeDao.selectNoticeById", noticeKey);
    }

    @Override
    public void insertNotice(NoticeDto noticeDto) {
        sqlSession.insert("com.project.npnc.notice.model.dao.NoticeDao.insertNotice", noticeDto);
    }

    @Override
    public void updateNotice(NoticeDto noticeDto) {
        sqlSession.update("com.project.npnc.notice.model.dao.NoticeDao.updateNotice", noticeDto);
    }

    @Override
    public void deleteNotice(int noticeKey) {
        sqlSession.delete("com.project.npnc.notice.model.dao.NoticeDao.deleteNotice", noticeKey);
    }
}
