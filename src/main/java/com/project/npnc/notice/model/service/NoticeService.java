package com.project.npnc.notice.model.service;

import java.util.List;

import com.project.npnc.notice.model.dto.NoticeDto;

public interface NoticeService {
    List<NoticeDto> getAllNotices();
    NoticeDto getNoticeById(int id);
    void createNotice(NoticeDto notice);
    void updateNotice(NoticeDto notice);
    void deleteNotice(int id);
}