package com.marondal.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test06")
public class ServletTest06Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		PrintWriter out = response.getWriter();
		
		// 두 수를 파라미터로 전달 받고, 더하기 빼기 곱하기 나누기 결과를 json 데이터 형태로 전달
//		String number1String = request.getParameter("number1");
//		String number2String = request.getParameter("number2");
//		
//		int number1 = Integer.parseInt(number1String);
//		int number2 = Integer.parseInt(number2String);
		
		int number1 = Integer.parseInt(request.getParameter("number1"));
		int number2 = Integer.parseInt(request.getParameter("number2"));
		
		int addtion = number1 + number2;
		int subtraction = number1 - number2;
		int muliplication = number1 * number2;
		int division = number1 / number2;
		
// 		{"addtion":123, "subtraction":54, "muliplication":123, "division":130} 
		
		out.println("{\"addtion\":" + addtion + ", \"subtraction\":" + subtraction + ","
				+ " \"muliplication\":" + muliplication + ", \"division\":" + division + "}");
		
		
	}

}
