package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class TestServlet1 extends HttpServlet{
	//http://localhost:8088/JSTL_ELJSP/test1/
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("TestServlet1_doGet() 호출");
		request.setAttribute("cnt", 100);
		
		
		// [forward] 사용-이유-1)주소처리용이(서블릿페이지주소유지) 2)request 영역의 정보를 가지고이동
			RequestDispatcher dis = request.getRequestDispatcher("./el/AttributeTest.jsp");
			dis.forward(request, response);
		
		// [./] : 상대경로 
		//     - ./test1  : 가상주소 호출시 [./]의 의미 => 프로젝트명
		//     - ./el/AttributeTest.jsp : 실제주소 호출시 [./]의 의미 => WebContent 폴더
			
	}
	
}
