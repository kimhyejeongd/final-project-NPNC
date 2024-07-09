package com.project.npnc.scheduler;
import org.springframework.stereotype.Component;

@Component
public class MessageTask implements Runnable {

    @Override
    public void run() {
        // 메시지 전송 로직 구현
        System.out.println("메시지가 전송되었습니다.");
    }
}