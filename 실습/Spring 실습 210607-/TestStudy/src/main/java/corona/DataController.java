package corona;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DataController {
	
	@Autowired
	KoreaDao kDao;
	
	@Autowired
	GlobalDao gDao;
	
	@Autowired
	GenderAgeDao gaDao;
	
	@Autowired
	CityDao cDao;
	
	@RequestMapping(value = "/corona/searchK.corona", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchKorea() {
		ModelAndView mv = new ModelAndView();
		
		List<KoreaVo> kList = kDao.select();
		List<GenderAgeVo> gaList = gaDao.select();
		CityVo cVo = cDao.selectCK();
		
		mv.addObject("kList", kList);
		mv.addObject("gaList", gaList);
		mv.addObject("cVo", cVo);
		
		mv.setViewName("CasesInKorea");
		return mv;
	}
	
	
}
