package member;

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

@WebServlet(urlPatterns = "/member/member.do")
public class MemberServlet extends HttpServlet {
	Connection conn;
	MemberDao dao;
	RequestDispatcher disp; //요청결과를 forward할 때 사용됨.
	String job = "search";
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String url = "/member/";
		dao = new MemberDao(conn);
		Page page = new Page();
		
		if(request.getParameter("job") != null) {
			job = request.getParameter("job");
		}
		
		switch(job) {
		case "search":
			url += "search.jsp";
			List<MemberVo> list = dao.select(page);
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			break;
			
		case "modify":
			url += "modify.jsp";
			break;
		case "modifyR":
			url += "modify_result.jsp";
			break;
		case "deleteR":
			url += "delete_result.jsp";
			break;
		case "view":
			url += "view.jsp";
			break;
		case "register":
			url += "register.jsp";
			break;
		case "registerR":
			url += "register_result.jsp";
			break;
		}
		
		disp = request.getRequestDispatcher(url);
		disp.include(request, response);
	}

	@Override
	public void init() throws ServletException{
		conn = new DBConn().getConn();
	}
}
