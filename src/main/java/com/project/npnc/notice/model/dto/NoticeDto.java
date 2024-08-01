package com.project.npnc.notice.model.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeDto {
    private int noticeKey;
    private int memberKey;
    private String noticeTitle;
    private String noticeDetail;
    private Date noticeEnrollDate;
    private Date noticeUpdateDate;
    private String noticeDelete;
}
