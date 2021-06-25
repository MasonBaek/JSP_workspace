<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 	 <h1>WebContent/jsp1/testPro3.JSP</h1>
 	 
 	 <%
		request.setCharacterEncoding("UTF-8");
	 	String name = request.getParameter("name");
	 	String gender = request.getParameter("gender");
// 	 	String hb = request.getParameter("hb");
		// request.getParameterValues("파라미터명");
		// => String[] 리턴하는메서드
		String[] hbArr = request.getParameterValues("hb");
		String[] subjArr = request.getParameterValues("subject");
 	 	
 	 
 	 %>
 	이름 : <%= name %> <br>
 	성별 : <%=request.getParameter("gender") %> <br>
 	<%-- <%=request.getParameter("hb") %>
 	<%=request.getParameter("hb") %>
 	<%=request.getParameter("hb") %> --%>
 	<%
 			if(hbArr!=null){
 			for(int i=0;i<hbArr.length;i++){ 
 				%>취미 : <%=hbArr[i]%><br><%
 			} 
 			}
	%>
	
	<%
 			if(subjArr!=null){
 			for(int i=0;i<subjArr.length;i++){ 
 				%>
	과목 : <%=subjArr[i] %> <br><%
 	} 
 	}
	%>

 	
</body>
</html>