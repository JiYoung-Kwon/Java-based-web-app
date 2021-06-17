package com.mycompany.task;

import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

@Controller
public class testCron {
	
	@Scheduled(fixedRate = 2000) // 수행 시작 기점, 2초 후 실행 
    public void fixedRateTest() {
        System.out.println("fixedRate: 2sec -> " + new Date());
    }
    @Scheduled(fixedDelay = 7000) // 수행 종료 기점, 7초 후 실행 
    public void fixedDelayTest() {
        System.out.println("fixedDelay: 7sec -> " + new Date());
    }
	
}
