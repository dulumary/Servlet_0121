package com.marondal.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marondal.common.MysqlService;

@WebServlet("/db/ex02_insert")
public class ServletTest02Insert extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		String name = request.getParameter("name");
		String yyyymmdd = request.getParameter("yyyymmdd");
		String introduce = request.getParameter("introduce");
		String email = request.getParameter("email");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String insertQuery = "INSERT INTO `new_user`\r\n"
				+ "(`name`, `yyyymmdd`, `email`, `introduce`, `createdAt`, `updatedAt`)\r\n"
				+ "VALUES\r\n"
				+ "('" + name + "', '" + yyyymmdd + "', '" + email + "', '" + introduce + "', now(), now());";
				
		PrintWriter out = response.getWriter();
		
		int count = mysqlService.update(insertQuery);
		
		mysqlService.disconnect();
		
		response.sendRedirect("/db/ex02_1.jsp");
		
	}

}
