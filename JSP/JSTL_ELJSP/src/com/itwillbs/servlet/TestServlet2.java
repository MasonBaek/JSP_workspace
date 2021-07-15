package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet2 extends HttpServlet {
  
	//http://localhost:8088/JSTL_ELJSP/test2
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet2_doGet() 호출");
		
		//페이지 이동(./el/ArrayTest.jsp)-forward이동
		String[] foods={
			"짜장면","짬뽕","냉면","삼겹살","피자","돈까스"
		};
		//request 영역에 ArrayList 저장전달
		ArrayList<String> sports = new ArrayList<>();
		sports.add("야구");
		sports.add("탁구");
		sports.add("테니스");
		sports.add("발야구");
		sports.add("배드민턴");
		sports.add("배구");
		sports.add("축구");
		request.setAttribute("sports", sports);
		request.setAttribute("foods", foods);
		RequestDispatcher dis = request.getRequestDispatcher("./el/ArrayTest.jsp");
		dis.forward(request, response);
	}
	
	
	

}
