package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.jobtc.json.DBConn;

@WebServlet(urlPatterns = "/upload.do")
@MultipartConfig(
		location = "C:/Temp/",
		maxFileSize = 1024000000L,
		maxRequestSize = -1,
		fileSizeThreshold = -1		
)



public class FileUpload extends HttpServlet{
	Connection conn;
	MemberDao dao;
	RequestDispatcher disp;
	
	String saveDir = "C:\\eclipse\\workspace\\WebStudy\\WebContent\\member\\picture\\";
	
	@Override
	public void init() throws ServletException {
		conn = new DBConn().getConn();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String contentType = req.getContentType();	
		
		if(contentType == null || !contentType.toLowerCase().startsWith("multipart/")) {
			return;
		}
		
		dao = new MemberDao(conn);
		MemberVo vo = new MemberVo();
		Page page = new Page();
		
		Collection<Part> parts = req.getParts();
		for(Part p : parts) {	
			if(p.getHeader("Content-Disposition").contains("filename=")) {
				String fileName = p.getSubmittedFileName();
				
				vo.setPhoto(fileName);
				
				if(p.getSize() >0) {
					p.write(saveDir + fileName);
					p.delete();
				}
			}else { //file tag가 아닌 경우
				String tagName = p.getName();
				String value = req.getParameter(tagName);
	
				switch(tagName) {
				case "mid":
					vo.setMid(value);
					break;
				case "irum":
					vo.setIrum(value);
					break;
				case "pwd":
					vo.setPwd(value);
					break;
				case "phone":
					vo.setPhone(value);
					break;
				case "post":
					vo.setPost(value);
					break;
				case "address":
					vo.setAddress(value);
					break;
				case "address2":
					vo.setAddress2(value);
					break;
				case "account":
					vo.setAccount(value);
					break;
				case "host":
					vo.setHost(value);
					break;
					
				case "findStr":
					page.setFindStr(value);
					break;
				case "nowPage":
					page.setNowPage(Integer.parseInt(value));
					break;
				}
			}
		}
		
		int r = dao.insert(vo);
		req.setAttribute("page", page);
		
		disp = req.getRequestDispatcher("./member/search.jsp");
		disp.include(req, resp);
	}	
}
