package Database.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login_check")
public class Login_check extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		    String Ac=req.getParameter("an");
		    String pass=req.getParameter("pass");
		Connection con=Database_connection.Mysql_connect();
		try {
			String checkquery="select * from net_banking where Account_No="+Ac+" and Password="+pass;
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(checkquery);
			if(rs.next()) {
				 System.out.println("Account=== "+rs.getString(3));
     		RequestDispatcher rs1=req.getRequestDispatcher("personal_home_page.jsp?name="+rs.getString(2)+"&ac="+rs.getString(3));
				rs1.forward(req, res);
				
		//		res.sendRedirect("personal_home_page.jsp?Account_No="+Ac);

				

			}else {
				
				RequestDispatcher rs1=req.getRequestDispatcher("Login.jsp?msg=invaild");
				rs1.include(req, res);
				
			}
			st.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		
            if(req.getParameter("an").equals("admin") && req.getParameter("pass").equals("123")) {
            	res.sendRedirect("Admin_login.jsp?name=Admin");
            }else {
            	res.sendRedirect("Login.jsp?msg=invaild");
            }
	}

}
