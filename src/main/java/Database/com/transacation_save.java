package Database.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class transacation_save
 */
@WebServlet("/transacation_save")
public class transacation_save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=Database_connection.Mysql_connect();
		
		
		
		
		String date=String.valueOf(LocalDate.now());
		String time=String.valueOf(LocalTime.now());
		int Amount=  Integer.parseInt(request.getParameter("am"));
		String id=request.getParameter("id");
		System.out.println(id);
		try {
			String checkquery="update createaccount set Amount=Amount+? where Id="+id;
			PreparedStatement ps=con.prepareStatement(checkquery);
			ps.setInt(1, Amount);
			ps.executeUpdate();
			PreparedStatement ps1 = con.prepareStatement("insert into transacation(Account_No,Transaction_type,Date, Time, Amount,tyt) values(?,?,?,?,?,?)");
			ps1.setString(1,request.getParameter("acc"));
			
			ps1.setString(2,request.getParameter("ty"));
			
			if(request.getParameter("ty").equals("Credit")) {
			ps1.setString(6,"1");
			}
			if(request.getParameter("ty").equals("Deposit")) {
				ps1.setString(6,"2");
				}
			System.out.println(request.getParameter("ty"));
			System.out.println(request.getParameter("acc"));
			ps1.setString(3,date);
			ps1.setString(4,time);
			ps1.setString(5,request.getParameter("am"));
			ps1.executeUpdate();
			con.close();
			ps1.close();
			response.sendRedirect("Admin_transacation.jsp?msg=vaild&name=Admin");
			
			ps.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("Admin_transacation.jsp?msg=invaild&name=Admin");
			
		}
	
	}

}
