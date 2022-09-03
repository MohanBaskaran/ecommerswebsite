package project;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	public static Connection getCon() {
		try {
			System.out.println("this line is executing 1");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("this line is executing 2");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp","root","root");
			System.out.println("this line is executing 3");
			return con;
		} catch (Exception e) {
			System.out.println("conprovider class "+e);
			return null;
		}
	}
}