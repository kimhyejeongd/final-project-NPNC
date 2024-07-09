package com.project.npnc.scheduler.service;
import java.util.concurrent.ScheduledFuture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Service;

import com.project.npnc.scheduler.CronExpressionGenerator;

@Service
public class MessageSchedulerService {

    @Autowired
    private TaskScheduler taskScheduler;

    private ScheduledFuture<?> scheduledFuture;

    public void scheduleMessage(Runnable task, int second, int minute, int hour, int dayOfMonth, int month, int dayOfWeek) {
        String cronExpression = CronExpressionGenerator.createCronExpression(second, minute, hour, dayOfMonth, month, dayOfWeek);
        
        CronTrigger cronTrigger = new CronTrigger(cronExpression);
        System.out.println(cronExpression+" cronExpression");
        System.out.println(cronTrigger+" cronTrigger");
        scheduledFuture = taskScheduler.schedule(task, cronTrigger);
    }

    public void cancelScheduledMessage() {
        if (scheduledFuture != null) {
            scheduledFuture.cancel(false);
        }
    }
}