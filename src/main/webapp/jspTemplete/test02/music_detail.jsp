<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<style>
  		header {
  			height:70px;
  		}
  		
  		nav {
  			height: 50px;
  		}
  		
  		footer {
  			height:50px;
  		}
  		
  	</style>
</head>
<body>
	<%@ include file="data.jsp" %>
	<%
		String musicIdString = request.getParameter("id");
	
		String title = request.getParameter("title");
				
		
		Map<String, Object> targetMusic = null;
		
		// id 로 전달되는 경우 (title은 null)
		if(musicIdString != null) {
			int musicId = Integer.parseInt(musicIdString);
			for(Map<String, Object> music : musicList) {
				if(musicId == (Integer)music.get("id")) {
					// 보여줄 대상 
					targetMusic = music;
				}
			}
			
		} else if(title != null) {
			for(Map<String, Object> music : musicList) {
				if(title.equals(music.get("title"))) {
					targetMusic = music;
				}
			}
		}
	%>
	
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="menu.jsp" />
		<section>
			<% if(targetMusic != null) { 
				int time = (Integer)targetMusic.get("time");
			%>
			<article class="music-info">
				<h3>곡정보</h3>
				<div class="music-box d-flex border border-success p-3">
					<div class="album-image">
						<img width="150" src="<%= targetMusic.get("thumbnail") %>" alt="사진">
					</div>
					<div class="music-info ml-3">
						<div class="display-4"><%= targetMusic.get("title") %></div>
						<div class="text-success font-weight-bold"><%= targetMusic.get("singer") %></div>
						<div>앨범 : <%= targetMusic.get("album") %></div>
						<div>재생시간 : <%= time / 60 %>:<%= time % 60 %></div>
					</div>
				</div>
			</article>
			<article class="music-lyrics my-3">
				<h4>가사</h4>
				<hr>
				<div>가사정보 없음</div>
			
			</article>
			<% } else { %>
				<article>
					<div class="display-4">검색 결과 없음</div>
				</article>
			
			<% } %>
		</section>
		<jsp:include page="footer.jsp" />
	
	</div>


</body>
</html>