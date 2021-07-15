package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.bean.Person;
import com.itwillbs.bean.Phone;

public class TestServlet3 extends HttpServlet {
	//http://localhost:8088/JSTL_ELJSP/test3
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Phone phone = new Phone("갤럭시2","010-9358-2120");
		Person person = new Person("홍길동", 20, phone);
		
		request.setAttribute("person", person);
		RequestDispatcher dis = request.getRequestDispatcher("./el/BeanTest.jsp");
		dis.forward(request, response);
		
	}
	
}