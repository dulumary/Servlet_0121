package com.marondal.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex03")
public class ServletEx03Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/html");
		response.setContentType("application/json");
		
		PrintWriter out = response.getWriter();
		
		// 사용자 아이디, 이름 , 나이 전달 받고 화면에 출력
		String userId = request.getParameter("user_id");
		String name = request.getParameter("name");
		String ageString = request.getParameter("age");
		
		int age = Integer.parseInt(ageString);
		
//		out.println("<html><head><title>get 메소드</title></head>");
//		out.println("<body>");
//		out.println("<h2>아이디 : " + userId + "</h2>");
//		out.println("<h2>이름 : " + name + "</h2>");
//		out.println("<h2>나이 : " + age + "</h2>");
//		
//		out.println("</body></html>");
		
		
//		{"userId":"hagulu", "name":"김인규", "age":24  }
		
//		out.println("{\"userId\":\"" + userId + "\"}");
		out.println("{\"userId\":\"" + userId + "\", \"name\":\"" + name + "\", \"age\":" + age + "}");
		
		
	}

}
