package board;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController { // 서블렛과 다르게 상속받지 않아도 된다. (simple해짐)
	
	@Autowired
	BoardDao dao;
	
	@Autowired
	BoardFileUploadController fileUpload;
	
	List<BoardAttVo> attList;
	
	@RequestMapping(value = "/search.brd", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView search(Page page) {
		ModelAndView mv = new ModelAndView();
		
		List<BoardVo> list = dao.select(page);
		
		mv.addObject("list", list);
		mv.addObject("page",page);
		mv.setViewName("search");
		return mv;
	}
	
	@RequestMapping(value = "/register.brd", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView register(Page page) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("page",page);
		mv.setViewName("register");
		return mv;
	}
	
	@RequestMapping(value = "/registerR.brd", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView registerR(BoardVo vo, Page page, HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();

		try {
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/html; charset=utf-8");
			vo.setAttList(attList);
			dao.insert(vo);
			
			mv = search(page);
			/*
			 * mv.addObject("page",page); mv.setViewName("search");
			 */
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	
	@RequestMapping(value = "/fup.brd", method = {RequestMethod.POST})
	public void upload(HttpServletRequest req, HttpServletResponse resp) { 
		attList = fileUpload.upload(req);  
		
		PrintWriter pw;
		
		try {
			pw = resp.getWriter();
			pw.print("OK");
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	 
	
	@RequestMapping(value = "/view.brd", method = {RequestMethod.POST})
	public ModelAndView view(BoardVo v,Page p) {
		ModelAndView mv = new ModelAndView();
		BoardVo vo = dao.view(v.getSerial());
		
		mv.addObject("vo", vo);
		mv.addObject("page",p);
		mv.setViewName("view");
		return mv;
	}
	
	@RequestMapping(value = "/modify.brd", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView modify(BoardVo v,Page p) {
		ModelAndView mv = new ModelAndView();
		BoardVo vo = dao.view(v.getSerial());
		
		mv.addObject("vo", vo);
		mv.addObject("page",p);
		mv.setViewName("modify");
		return mv;
	}
	
	@RequestMapping(value = "/modifyR.brd", method = {RequestMethod.POST})
	public ModelAndView modifyR(BoardVo v,Page p) {
		ModelAndView mv = new ModelAndView();
		v.setAttList(attList);
		
		dao.update(v);
		
		mv.addObject("vo", v);
		mv.addObject("page",p);
		mv.setViewName("search");
		return mv;
	}
	
	@RequestMapping(value = "/delete.brd", method = {RequestMethod.POST})
	public ModelAndView delete(BoardVo v,Page p) {
		ModelAndView mv = new ModelAndView();
		
		dao.delete(v.getSerial());
		List<BoardVo> list = dao.select(p);
		
		mv.addObject("list", list);
		mv.addObject("page",p);
		mv.setViewName("search");
		return mv;
	}
	
	@RequestMapping(value = "/repl.brd", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView repl(Page p) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("page",p);
		mv.setViewName("repl");
		return mv;
	}
	
	@RequestMapping(value = "/replR.brd", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView replR(BoardVo vo, Page p) {
		ModelAndView mv = new ModelAndView();
		
		vo.setAttList(attList);
		dao.repl(vo);
		
		mv =search(p);
		mv.setViewName("search");
		return mv;
	}
	
}
