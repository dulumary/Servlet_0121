package com.marondal.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marondal.common.MysqlService;

@WebServlet("/db/ex01")
public class SevletDBEx01 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
//		try {
//			
//			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
//			
//			String url = "jdbc:mysql://localhost:3306/test_db0107";
//			String userId = "root";
//			String password = "root";
//			
//			Connection connection = DriverManager.getConnection(url, userId, password);
//			Statement statement = connection.createStatement();
//			
//			// 중고물품 리스트 가져오기 
//			String selectQuery = "SELECT * FROM `used_goods`";
//			ResultSet resultSet = statement.executeQuery(selectQuery);
//			
//			while(resultSet.next()) {
//				String title = resultSet.getString("title");
//				int price = resultSet.getInt("price");
//				
//				out.println("제품명 : " + title);
//				out.println("가격 : " + price);
//			}
//			
//			String insertQuery = "INSERT INTO `used_goods`\r\n"
//					+ "(`sellerId`, `title`, `price`, `description`, `picture`, `createdAt`, `updatedAt`)\r\n"
//					+ "VALUES\r\n"
//					+ "(3, '고양이 간식 팝니다', 2000, '저희 고양이가 까다로워서 안먹네요', NULL, now(), now());";
//			
//			// insert, update, delete 쿼리 
//			// 리턴 결과는 실행된 행의 갯수 
//			int count = statement.executeUpdate(insertQuery);
//			
//			out.println("삽입 : " + count);
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String selectQuery = "SELECT * FROM `used_goods`";
		ResultSet resultSet = mysqlService.select(selectQuery);
		
		try {
			while(resultSet.next()) {
				String title = resultSet.getString("title");
				int price = resultSet.getInt("price");
				
				out.println("제품명 : " + title);
				out.println("가격 : " + price);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
