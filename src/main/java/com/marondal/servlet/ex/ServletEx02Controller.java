package com.marondal.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/servlet/ex02")
public class ServletEx02Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		// 1 ~ 100 까지 합 
		int sum = 0; 
		for(int i = 1; i <= 100; i++) {
			sum += i;
		}
		
		out.println("<html><head><title>합계</title></head>");
		out.println("<body><h2>" + sum + "</h2></body></html>");
		
	}

}
