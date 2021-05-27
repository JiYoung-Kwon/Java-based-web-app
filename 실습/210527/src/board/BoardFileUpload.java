package board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = "/boardUpload.do")
@MultipartConfig(
		location = "C:/Temp/",
		maxFileSize = 1024*1024*100,
		maxRequestSize = -1,
		fileSizeThreshold = -1
)


public class BoardFileUpload extends HttpServlet{
	BoardDao dao;
	RequestDispatcher rd;
	
	final static String saveDir = "C:\\eclipse\\workspace\\WebStudy\\WebContent\\upload\\";


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String flag = ""; //insert, update, repl
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		
		String contentType = req.getContentType();	
		
		if(contentType == null || !contentType.toLowerCase().startsWith("multipart/")) {
			return;
		}
		
		dao = new BoardDao();
		BoardVo bvo = new BoardVo();
		Page page = new Page();
		
		List<BoardAttVo> attList = new ArrayList<BoardAttVo>();
		Collection<Part> parts = req.getParts();
		for(Part p : parts) {	
			if(p.getHeader("Content-Disposition").contains("filename=")) { //file tag
				String fileName = p.getSubmittedFileName();
				BoardAttVo attVo = new BoardAttVo();
				attVo.setOriAtt(fileName);
				
				String date = sdf.format(new Date());
				
				if(p.getSize() >0) {
					p.write(saveDir + date + "-" + fileName);
					p.delete();
					attVo.setSysAtt(date + "-" + fileName);
				}
				attList.add(attVo);
				
			}else { //file tag가 아닌 경우
				/*
				 * String tagName = p.getName(); String value =
				 * req.getParameter(tagName).trim();
				 * 
				 * switch(tagName) {
				 * 
				 * }
				 */
		
			}
		}
		/*
		 * flag = req.getParameter("flag");
		 * 
		 * 
		 * if(flag.equals("insert")) { r = dao.insert(vo); }else
		 * if(flag.equals("update")) { r = dao.update(vo); }
		 * 
		 * req.setAttribute("page", page);
		 * 
		 * rd = req.getRequestDispatcher("./board/search.jsp"); rd.include(req, resp);
		 */
	}	
}