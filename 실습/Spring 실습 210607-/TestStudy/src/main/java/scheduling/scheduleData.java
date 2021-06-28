package scheduling;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import corona.KoreaData;

@Controller
public class scheduleData {
	@Autowired
	KoreaData kData;
	
	@Scheduled(fixedRate = 2000) // 수행 시작 기점, 2초 후 실행
	public void fixedRateTest() {
		System.out.println("fixedRate: 2sec -> " + new Date());
	}

	@Scheduled(cron = "35 22 17 * * *")
	public void fixedDelayTest() {
		try {
			kData.parsingKorea();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
