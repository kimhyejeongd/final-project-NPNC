package com.project.npnc.scheduler.controller;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.npnc.scheduler.MessageTask;
import com.project.npnc.scheduler.service.MessageSchedulerService;

@RestController
@RequestMapping("/schedule")
public class ScheduleController {

    @Autowired
    private MessageSchedulerService schedulerService;

    @Autowired
    private MessageTask messageTask;

    @PostMapping("/message")
    public String scheduleMessage(@RequestParam int second, 
                                  @RequestParam int minute, 
                                  @RequestParam int hour, 
                                  @RequestParam int dayOfMonth, 
                                  @RequestParam int month, 
                                  @RequestParam int dayOfWeek) {
        schedulerService.scheduleMessage(messageTask, second, minute, hour, dayOfMonth, month, dayOfWeek);
        
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");        
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월 dd일");         
        Date now = new Date();         String nowTime1 = sdf1.format(now);        
        String nowTime2 = sdf2.format(now);         
        System.out.println(nowTime1);        
        System.out.println(nowTime2);
        
        System.out.println(second+" "+minute+" "+hour+" "+dayOfMonth+" "+month+" "+dayOfWeek);
        return "메시지 전송이 예약되었습니다.";
    }

    @PostMapping("/cancel")
    public String cancelMessage() {
        schedulerService.cancelScheduledMessage();
        return "메시지 전송이 취소되었습니다.";
    }
}