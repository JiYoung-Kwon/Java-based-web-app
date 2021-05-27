package board;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.jobtc.json.DBConn;
import board.Page;

@WebServlet(urlPatterns = "/board")
public class BoardServlet extends HttpServlet{
	BoardDao dao;
	RequestDispatcher rd; //요청결과를 include할 때 사용됨
	String job = "search";
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		job = "search";
		doPost(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		BoardVo vo = null;
		
		String url = "./board/";
		dao = new BoardDao();
		
		Page page = new Page();
		String tempNowPage = req.getParameter("nowPage");
		
		if(req.getParameter("job") != null) {
			job = req.getParameter("job");
		}
		
		if(req.getParameter("findStr") != null) {
			page.setFindStr(req.getParameter("findStr"));
		}
		
		if(tempNowPage == null || tempNowPage.equals("")) {
			page.setNowPage(1);
		}else {
			page.setNowPage(Integer.parseInt(tempNowPage));
		}
		
		switch(job) {
		case "search":
			url += "search.jsp";
			List<BoardVo> list = dao.select(page);
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			break;
		}
		
		
		rd = req.getRequestDispatcher(url);
		rd.include(req, resp);
	}
	
	@Override
	public void init() throws ServletException {
		
	}
}
