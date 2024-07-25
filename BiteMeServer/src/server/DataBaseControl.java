package server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import gui.ServerPortFrameController;

public class DataBaseControl {

	public static Connection conn;
	
	
	static final String internalDatabaseLink = "jdbc:mysql://localhost/" + ServerPortFrameController.DBInfo.get(0) + "?serverTimezone=IST";
	static final String externalDatabaseLink = "jdbc:mysql://localhost/" + ServerPortFrameController.DBInfo.get(1) + "?serverTimezone=IST";
	static final String user = "root";
	static final String password = ServerPortFrameController.DBInfo.get(2);
	
	
	
	// the function handle the connection to the Internal DataBase
	public static Connection connectToInternalDB() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			System.out.println("Driver definition succeed");
		} catch (Exception ex) {
			System.out.println("Driver definition failed");
		}

		try {
			conn = DriverManager.getConnection(internalDatabaseLink, user, password);
			System.out.println("Internal SQL DataBase connected successfully");
			return conn;
		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return null;
		}
	}

	
	// the function handle the connection to the External DataBase
	public static Connection connectToExternalDB() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			System.out.println("Driver definition succeed");
		} catch (Exception ex) {
			System.out.println("Driver definition failed");
		}
		try {
			conn = DriverManager.getConnection(externalDatabaseLink, user, password);
			System.out.println("External SQL DataBase connected successfully");
			return conn;
		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return null;
		}
	}
	
	
	
	
	//the function update the "isLoggedIn" to all users to zero when exiting - logging out
	public static void LogOutAllAccounts() throws SQLException {
		PreparedStatement ps;

		ps = conn.prepareStatement("UPDATE Assignment3_DB.users SET IsLoggedIn = ? ");
		ps.setInt(1, 0);
		ps.executeUpdate();
	}
	
}
