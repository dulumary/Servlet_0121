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
    		
    		String query = "SELECT seller.nickname, used_goods.title, used_goods.price, used_goods.picture " 
    				+ "FROM `seller` "
    				+ "JOIN `used_goods` "
    				+ "ON seller.id = used_goods.sellerId;";
    		ResultSet resultSet = mysqlService.select(query);
    	
    	%>

        <div id="wrap">
			<jsp:include page="header.jsp" />
            <section class="mt-4 d-flex justify-content-center">
                <div class="d-flex flex-wrap ">
                <!-- 
                    <div class="goods-box mb-3 mr-2">
                        <div class="goods-image-box ">
                            <div class="d-flex h-100 justify-content-center align-items-center">
                                <h4 class="text-secondary">이미지 없음</h4>
                            </div>
                        </div>
                        <div class="title mt-1">플스4 팝니다.</div>
                        <div class="price mt-1">100000원</div>
                        <div class="seller mt-1">마로비</div>
                    </div>
                    
                     -->
                     
                   <% while(resultSet.next()) { %>
                    <div class="goods-box mb-3 mr-2">
                        <div class="goods-image-box">
                        	<% if(resultSet.getString("picture") == null) { %>
	                        	<div class="d-flex h-100 justify-content-center align-items-center">
	                                <h4 class="text-secondary">이미지 없음</h4>
	                            </div>
                            <% } else { %>
                        		<img class="w-100" src="<%= resultSet.getString("used_goods.picture") %>">
                        	<% } %>
                        </div>
                        <div class="title mt-1"><%= resultSet.getString("used_goods.title") %></div>
                        <div class="price mt-1"><%= resultSet.getInt("used_goods.price") %>원</div>
                        <div class="seller mt-1"><%= resultSet.getString("seller.nickname") %></div>
                    </div>
                  <% } %>
                  
                </div>
            </section>
            <jsp:include page="footer.jsp" />
        </div>

    </body>

</html>