package com.itwillbs.bean;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test1.do")
public class ServletTest extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet() 호출");
        
        // request 영역에 데이터 저장
        req.setAttribute("name", "컴퓨터");
        
        // reqeust 영역에 객체 데이터 저장
        // MemberBean 객체의 생성 -> set2.jsp 출력
        MemberBean mb = new MemberBean();
        mb.setId("admin");
        mb.setPw("1234");
        mb.setName("홍길동");
        mb.setAge(20);
        req.setAttribute("mb", mb);
        
        MemberBean kim = new MemberBean();
        kim.setId("itwill");
        kim.setPw("1q2w3e");
        kim.setName("김학생");
        kim.setAge(21);
        req.setAttribute("mb2", kim);
        
        Vector<MemberBean> v = new Vector<>();
        
        v.add(mb);
        v.add(kim);
        req.setAttribute("memberList", v);
        
        
        
        // 페이지이동(forward)
        RequestDispatcher dis 
          = req.getRequestDispatcher("/core/set2.jsp");
        dis.forward(req, resp);
	}
	
	
}
