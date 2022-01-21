package com.marondal.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test05")
public class ServletTest05Controller  extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException { 
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		// 단수를 파라미터로 받아서, 그에 해당하는 구구단을 출력하라
		// 5단의 구구단 출력
		// 구구단 반복문 출력
		// 단수를 변수로 관리하기
		// 변수에 파라미터러 전달 받은 값 저장하기 
		
		String numberString = request.getParameter("number");
		
		int number = Integer.parseInt(numberString);
		
		out.println("<html><head><title>구구단</title></head>");
		out.println("<body>");
		out.println("<ul>");
		
		for(int i = 1; i <= 9; i++) {
			out.println("<li>" + number + " X " + i + " = " + (number * i) + "</li>");			
		}
		
		out.println("</ul>");
		out.println("</body></html>");
		
		
	}

}
