package smart.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.dao.SmartDao;
import study.dto.SmartDto;


@WebServlet("/board/updateform")
public class BoardUpdateFormServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//1. num 읽기
		int num=Integer.parseInt(request.getParameter("num"));
		
		//2. dao 선언
		SmartDao dao = new SmartDao();
		
		//3. dto 선언
		SmartDto dto = dao.getData(num);
		
		//4. request에 저장
		request.setAttribute("dto", dto);
		
		//5. 출력
		RequestDispatcher rd=request.getRequestDispatcher("../day0405_smart/updateform.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
