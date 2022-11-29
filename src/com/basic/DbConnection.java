package com.basic;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection 
{
	public static Connection connect()
	{
		Connection con = null;
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruralehealth","root","");
			System.out.println("hello hhh");
			} 
		catch (Exception e) {
			e.printStackTrace(); 
			System.out.println("hello");
		}
		return(con);		
	}
}
