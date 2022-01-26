<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료구조 활용</title>
</head>
<body>

	<%-- 리스트, 맵 --%>
	
	<%
		// 과일 이름 리스트 
		List<String> fruits = new ArrayList<>();
		fruits.add("사과");
		fruits.add("바나나");
		fruits.add("딸기");
	%>
	
	<table border="1">
		<% for(String fruit : fruits) { %>
		<tr>
			<td><%=fruit %></td>
		</tr>
		<% } %>
	</table>
	
	
	<%
	// 과목, 성적 맵
		Map<String, Integer> scores = new HashMap<>();  
		scores.put("국어", 90);
		scores.put("수학", 85);
		scores.put("영어", 100);
	%>
	
	<table border="1">
		<thead>
			<tr>
				<th>과목</th>
				<th>성적</th>
			</tr>
		</thead>
		<tbody>
			<% 
				// 국어, 수학, 영어
				Set<String> keys = scores.keySet();
				for(String title : keys) {
			%>
			<tr>
				<td><%= title %></td>
				<td><%= scores.get(title) %></td>
			</tr>
			<% } %>
		
		</tbody>
	
	</table>

</body>
</html>




