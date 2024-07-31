package com.project.npnc.notice.model.dao;

import com.project.npnc.notice.model.dto.NoticeDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NoticeDao {
    List<NoticeDto> selectAllNotices();
    NoticeDto selectNoticeById(@Param("id") int id);
    void insertNotice(NoticeDto notice);
    void updateNotice(NoticeDto notice);
    void deleteNotice(@Param("id") int id);
}
