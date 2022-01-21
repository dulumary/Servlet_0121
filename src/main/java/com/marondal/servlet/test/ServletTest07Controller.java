package com.marondal.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/servlet/test07")
public class ServletTest07Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String address = request.getParameter("address");
		String card = request.getParameter("card");
		int price = Integer.parseInt(request.getParameter("price"));
		
		//  서울시로 시작하지 않으면, 배달 불가지역입니다. 
		
		// 카드가 신한카드면 결제 불가 카드
		
		out.println("<html><head><title>배달정보</title></head>");
		out.println("<body>");
		
		if(!address.startsWith("서울시")) {
			out.println("<h1>배달 불가 지역입니다. </h1>");
			return ;
		}
		
		if(card.equals("신한카드")) {
			out.println("<h1>결제 불가 카드입니다. </h1>");
			return ;
		}
		
		out.println("<h2>" + address + "로 배달준비중</h2> <hr>");
		out.println("결제가격 : " + price + "원");
		
		out.println("</body></html>");
		
	}
}
