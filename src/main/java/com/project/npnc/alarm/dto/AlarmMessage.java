package com.project.npnc.alarm.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
//reMemberKey 필드가 JSON 데이터에서 필요 없는 경우, 
//클래스에 @JsonIgnoreProperties(ignoreUnknown = true) 어노테이션을 사용하여 무시
@JsonIgnoreProperties(ignoreUnknown = true)
public class AlarmMessage {
	
	private int alarmKey;
	private String alarmType;
	private String alarmPath;
	private int alarmReMember;
	private int alarmSendMember;
	private Date alarmDate;
	private String alarmRead;
	
	
}
