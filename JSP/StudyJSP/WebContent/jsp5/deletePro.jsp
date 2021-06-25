<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> deletePro_JSP </h1>
	<% 
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	// 전달된 파라미터값 저장 (delID,delPW)
	String delID = request.getParameter("delID");
	String delPW = request.getParameter("delPW");
	// DB에 연결해서 해당 회원정보를 확인후 삭제 
	// 디비연결 정보
	final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL ="jdbc:mysql://localhost:3306/jspdb";
	final String DBID ="root";
	final String DBPW ="1234";
	// 1) 드라이버 로드 
	Class.forName(DRIVER);
	// 2) 디비 연결 
	Connection con 
	  = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println(" 디비 연결 성공! "+con);
	// 3) sql 쿼리 & pstmt 객체 
	// 3) sql 쿼리 & pstmt 객체 
	String sql = "select pass from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// ?
	pstmt.setString(1, delID);
	
	// 4) sql 실행
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){ // if (true) -> 회원이다
		if(delPW.equals(rs.getString(2))){//회원확인 && 비밀번호확인 => 본인 => 수정/삭제 
			//3) sql생성 & pstmt 객체
			sql = "delete from itwill_member where id=?";	// Butter
			pstmt = con.prepareStatement(sql);				// Bread
			pstmt.setString(1, delID);
			pstmt.executeUpdate();
			System.out.println("제발 돌아와...내가더 잘할게");
		}else{//회원확인됨 . 비밀번호는 오류남
			System.out.println("아이디 또는 비밀번호 오류입니다.");
		}
	} else { //비회원
		System.out.println("어디 비회원나부랭이가 탈퇴를하나?\n회원가입부터하고 탈퇴해라");
	}
	
	%>	
</body>
</html>