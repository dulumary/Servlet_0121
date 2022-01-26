<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Method</title>
</head>
<body>
	<%-- get method 를 통한 파라미터 전달 --%>
	<%-- 아이디, 이름, 나이 --%>
	<b>아이디 : </b> <%= request.getParameter("user_id") %> <br>
	<b>이름 : </b> <%= request.getParameter("name") %> <br>
	<b>나이 : </b> <%= request.getParameter("age") %> <br>
	

</body>
</html>