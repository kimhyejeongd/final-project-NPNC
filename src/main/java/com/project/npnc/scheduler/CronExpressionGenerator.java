package com.project.npnc.scheduler;

public class CronExpressionGenerator {
	public static String createCronExpression(int second, int minute, int hour, int dayOfMonth, int month, int dayOfWeek) {
        return String.format("%d %d %d %d %d %d", second, minute, hour, dayOfMonth, month, dayOfWeek);
    }
}
