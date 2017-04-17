package cs5530;

import java.sql.*;
import java.io.Serializable;

public class Connector extends Object implements Serializable {
	public Connection con;
	public Statement stmt;
	public Connector() throws Exception {
		try{
		 	String userName = "5530u13";
	   		String password = "qd3ie6vn";
	        String url = "jdbc:mysql://georgia.eng.utah.edu/5530db13";
		    Class.forName ("com.mysql.jdbc.Driver").newInstance ();
        	con = DriverManager.getConnection (url, userName, password);
			stmt = con.createStatement();
			
        } catch(Exception e) {
			System.err.println("Unable to open mysql jdbc connection. The error is as follows,\n");
            		System.err.println(e.getMessage());
			throw(e);
		}
	}
	
	public void closeConnection() throws Exception{
		con.close();
	}
}
