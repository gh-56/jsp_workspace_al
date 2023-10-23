package a_base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionExample {

	public static void main(String[] args) {
	// jar는 .class파일을 저장하고 JRE에서 .java로 JVM에서 변환해줘서 어느 운영체제에서도 사용가능하다.
		// DataBase 인증된 사용자 정보로 Session
		// 정보를 저장하는 객체
		Connection conn;
		
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/sqldb";
		String user = "root";
		String password = "12345";
		
		try {
			Class.forName(driver); // mySql jar에 Driver가 있는지 경로로 확인 + 로드
			System.out.println("Driver Class load 완료");
			
			// 1번째 방법
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn-1 : " + conn);
			// 외부 리소스 자원 해제
			conn.close();
			
			// 2번째 방법
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sqldb?user=root&password=12345"
					);
			System.out.println("conn-2 : " + conn);
			conn.close();
			
			// 3번째 방법
			// java.util.Properties import
			// import 단축키 ctrl + shift + o
			Properties prop = new Properties();
			prop.setProperty("user", user);
			prop.setProperty("password", password);
			System.out.println(prop.getProperty("user"));
			System.out.println(prop.getProperty("password"));
			conn = DriverManager.getConnection(url, prop);
			System.out.println("conn-3 : " + conn);
			conn.close();
			
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Class를 찾을 수 없음");
		} catch (SQLException e) {
			System.out.println("DB 연결 정보 오류 : " + e.getMessage());
		}

	}

}
