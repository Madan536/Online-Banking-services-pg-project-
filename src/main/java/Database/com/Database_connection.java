package Database.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Database_connection {
         public static Connection Mysql_connect() {
        	 Connection con = null;
        	  String url ="jdbc:mysql://localhost:3306/Bank";
        	  try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				try {
					 con=DriverManager.getConnection(url,"root","root123*");
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
        	  }catch(Exception e) {
        		System.out.println(e.getMessage());  				
              }			
			return con;			
}
}       
          