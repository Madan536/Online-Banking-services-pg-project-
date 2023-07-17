package Database.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Net_Banking_save
 */
@WebServlet("/Net_Banking_save")
public class Net_Banking_save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Connection con=Database_connection.Mysql_connect();
		 String accountno= req.getParameter("an");
		 String namess= req.getParameter("adhar");
		 String fnamess= req.getParameter("fn");
		String checkquery="select * from createaccount where AccountNo="+accountno+" and Aadhar_NO="+namess ;
		String query="insert into net_banking(username,Account_No,Password) values(?,?,?)";
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(checkquery);
			
			PreparedStatement ps=con.prepareStatement(query);
			if(rs.next()) {
				ps.setString(1, req.getParameter("un"));
				ps.setString(2,accountno);
				if(req.getParameter("pass").equals(req.getParameter("cpass")))
				{
				ps.setString(3, req.getParameter("pass"));	
				}
				ps.executeUpdate();
				res.sendRedirect("Net_Banking.jsp?msg=vaild");
			
				con.close();
				ps.close();
				st.close();
			
			}else {
				res.sendRedirect("Net_Banking.jsp?msg=invaild");
			}				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());	
			res.sendRedirect("Net_Banking.jsp?msg=Already");
		}
	
	}

}
