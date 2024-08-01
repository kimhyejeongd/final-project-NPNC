package com.project.npnc.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.npnc.notice.model.dao.NoticeDao;
import com.project.npnc.notice.model.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeDao noticeDao;

    @Override
    public List<NoticeDto> getAllNotices() {
        return noticeDao.selectAllNotices();
    }

    @Override
    public NoticeDto getNoticeById(int id) {
        return noticeDao.selectNoticeById(id);
    }

    @Override
    public void createNotice(NoticeDto notice) {
        noticeDao.insertNotice(notice);
    }

    @Override
    public void updateNotice(NoticeDto notice) {
        noticeDao.updateNotice(notice);
    }

    @Override
    public void deleteNotice(int id) {
        noticeDao.deleteNotice(id);
    }
}