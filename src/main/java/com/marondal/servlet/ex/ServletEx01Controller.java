package com.marondal.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletEx01Controller extends HttpServlet {
	@Override 
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		//  문서타입 설정 (MIME)
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		Date now = new Date();
		out.println(now);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-d H:m:s");
		String formatString = formatter.format(now);
		
		out.println(formatString);
		
		
	}

}
