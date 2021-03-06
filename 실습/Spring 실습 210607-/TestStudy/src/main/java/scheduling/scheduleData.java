package scheduling;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import corona.CityData;
import corona.GenderAgeData;
import corona.GlobalData;
import corona.KoreaData;

@Controller
public class scheduleData {
	@Autowired
	KoreaData kData;
	
	@Autowired
	GlobalData gData;
	
	@Autowired
	GenderAgeData gaData;
	
	@Autowired
	CityData cData;
	

	@Scheduled(cron = "00 00 11 * * *")
	public void fixedKGAC() {
		try {
			//나머지는 11시 갱신
			kData.parsingKorea();
			gaData.parsingGenderAge();
			cData.parsingCity();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Scheduled(cron = "00 00 15 * * *")
	public void fixedG() {
		try {
			//global은 3시 갱신
			gData.parsingGlobal();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
