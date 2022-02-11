<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.marondal.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
        <title>홍당무 마켓</title>
        <meta charset="utf-8">


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="style.css" type="text/css">
    </head>
<body>
	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String query = "SELECT `nickname` FROM `seller`;";
		ResultSet resultSet = mysqlService.select(query);
		
	
	%>

	<div id="wrap">
		<jsp:include page="header.jsp" />
		
		<section class="mt-5 d-flex justify-content-center">
	        <div>
	            <div class="display-4">물건 올리기</div>
	            <div class="input-box mt-5">
	                <form id="inputForm" action="/db/test03/insert" method="POST">
	                    <div class="d-flex justify-content-between">
	                        <select class="form-control col-3" name="sellerId">
	                            <option value="0">-아이디 선택-</option>
	                            <% while(resultSet.next()) { %>
	                            <option><%= resultSet.getString("nickname") %></option>
	                            <% } %>
	                            
	                        </select>
	                        
	                        <input type="text" class="form-control col-5" name="title" placeholder="제목" >
	                        <div class="input-group  col-3">
	                            <input type="text" class="form-control" name="price" placeholder="가격">
	                            <div class="input-group-append"> 
	                            <span class="input-group-text">원</span>
	                            </div>
	                        </div>
	                        
	                    </div>
	                    <textarea class="form-control mt-3" cols="100" rows="5" name="description">
	                    </textarea>
	                    <div class="input-group mt-3">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text">이미지 url</span>
	                        </div>
	                        <input type="text" class="form-control" name="imageUrl">
	                        
	                    </div>
	                    <input type="submit" value="저장" class="btn btn-block mt-3">
	                </form>
	            </div>
	        </div>
       </section>
		
		<jsp:include page="footer.jsp" />
	</div>
	

</body>
</html>