package Database.com;

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

/**
 * Servlet implementation class Edit_save
 */
@WebServlet("/Edit_save")
public class Edit_save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=Database_connection.Mysql_connect();
		String email=request.getParameter("e");
		String phone=request.getParameter("pn");
		String dob=request.getParameter("dob");
		String address=request.getParameter("ad");
		String state=request.getParameter("s");
		String city=request.getParameter("c");
		String pin=request.getParameter("pc");
		String id=request.getParameter("id");
		System.out.println(id);
		try {
			String checkquery="update createaccount set Email=?, PhoneNO=?, DOB=?, Address=?, City=?, State=?, Pin_code=? where Id="+id;
			PreparedStatement ps=con.prepareStatement(checkquery);
			ps.setString(1,email);
			ps.setString(2,phone);
			ps.setString(3,dob);
			ps.setString(4,address);
			ps.setString(5,state);
			ps.setString(6,city);
			ps.setString(7,pin);
			
			ps.executeUpdate();
			
			response.sendRedirect("Login_All_Account.jsp?msg=vaild&name=Admin");
			
			ps.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			response.sendRedirect("Login_All_Account.jsp?msg=invaild&name=Admin");
			
		}
	}

}
