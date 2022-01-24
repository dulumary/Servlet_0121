<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>

	<!-- jsp 기본 사용법 -->
	<%-- jsp 주석 : 클라이언트에서는 사라진다 --%>
	<%-- 1에서 10까지 합 구하고 결과 출력하기 --%>
	
	<%
		// 자바 주석
		int sum = 0;
		for(int i = 1; i <= 10; i++) {
			sum += i;
		}
	%>
	
	<h3>합계 : <%= sum %> </h3>
	<input type="text" value="<%=sum %>">
	
	<%
		List<String> animals = new ArrayList<>();
		animals.add("dog");
		animals.add("cat");
	%>
	
	<h4><%=animals.get(0) %></h4>
	<h4> <%=animals.get(1) %> </h4>
	
	<%!
		// 클래스 안의 멤버 변수, 메소드 선언 
		
		private int number = 100;
	
		public String getHelloWorld() {
			return "Hello World";
		}
	%>
	
	<%=getHelloWorld() %>
	
	<%= number + 50 %>
	

</body>
</html>