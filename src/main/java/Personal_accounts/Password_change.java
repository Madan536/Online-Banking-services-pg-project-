package Personal_accounts;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.com.Database_connection;

/**
 * Servlet implementation class Password_change
 */
@WebServlet("/Password_change")
public class Password_change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String account;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		System.out.println(id);
		Connection con=Database_connection.Mysql_connect();
		try {
			String checkquery="update net_banking set Password=? where Account_No="+request.getParameter("ac");
			String query="select * from net_banking where Account_No=? and Password=?";
			PreparedStatement psupdate=con.prepareStatement(checkquery);
			PreparedStatement pscheck=con.prepareStatement(query);
			 account=request.getParameter("ac"); 
			String oldpass=request.getParameter("op"); 
			String newpass=request.getParameter("np"); 
			String cpass=request.getParameter("cp"); 
		     
			pscheck.setString(1, account);
			pscheck.setString(2, oldpass);
			ResultSet rs=pscheck.executeQuery();
			if(rs.next()) {
				String name=rs.getString(2);
				if(newpass.equals(cpass)) {
					psupdate.setString(1, cpass);
					psupdate.executeUpdate();
					psupdate.close();
					con.close();
					response.sendRedirect("password_change.jsp?msg=vaild&ac="+account+"&name="+name);
			   }else {
				   
				   response.sendRedirect("password_change.jsp?msg=invaild&ac="+account+"&name="+name);
			   }
			}
			
			pscheck.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			response.sendRedirect("password_change.jsp?msg=invaild&ac="+account);
			
		}
	}

}
