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
 * Servlet implementation class Search_show
 */
@WebServlet("/Search_show")
public class Search_show extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=Database_connection.Mysql_connect();
		String account=request.getParameter("sr");
		System.out.println(account);
		try {
			String checkquery="select * from createaccount where AccountNo="+account;
			PreparedStatement ps=con.prepareStatement(checkquery);
			ResultSet rs=ps.executeQuery();
			
			
			response.sendRedirect("Login_All_Account.jsp?msg=vaild");
			
			ps.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			response.sendRedirect("Login_All_Account.jsp=invaild");
			
		}
	}

}
