package Personal_accounts;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.com.Database_connection;


@WebServlet("/Send_money_save")
public class Send_money_save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ac=request.getParameter("ac");
		System.out.println("aaa= "+ac);
		Connection con=Database_connection.Mysql_connect();
		try {
			String checkquery="update createaccount set Amount=Amount+? where AccountNo="+request.getParameter("account");
			String updatequery="update createaccount set Amount=Amount-? where AccountNo="+ac;
			String query="select * from createaccount where AccountNo=? and First_Name=?";
			String iquery="insert into transacation(Account_No, Transaction_type, Date, Time, Amount, tyt) values(?,?,?,?,?,?)";
			String query1="select * from createaccount where AccountNo="+ac;
			
			PreparedStatement psupdate1=con.prepareStatement(updatequery);
			PreparedStatement psinsert=con.prepareStatement(iquery);
			
	        Statement st=con.createStatement();
			PreparedStatement pscheck=con.prepareStatement(query);
			PreparedStatement psupdate=con.prepareStatement(checkquery);
			pscheck.setString(1, request.getParameter("account"));
			pscheck.setString(2, request.getParameter("fname"));
			
			
			ResultSet rs=pscheck.executeQuery();
			ResultSet rs1=st.executeQuery(query1);
			if(rs.next()) {
				
				psinsert.setString(1,request.getParameter("account"));
				psinsert.setString(2,"Account Transaction ( "+request.getParameter("ac")+" )");
				psinsert.setString(3, String.valueOf(LocalDate.now()));
				psinsert.setString(4, String.valueOf(LocalTime.now()));
				
				
				psinsert.setString(5,request.getParameter("amount"));
				psinsert.setString(6,"Account Transaction");
				if(rs1.next()) {
				int dataamount1=rs1.getInt(9);
				int intamount2=Integer.parseInt(request.getParameter("amount"));
				int sum=dataamount1-intamount2;
				System.out.println("Balance  = "+sum);
				if(sum<0) {
					response.sendRedirect("Send_money.jsp?msg=checkbalance&ac="+ac+"&name="+request.getParameter("name"));
				}else {
					psupdate.setInt(1, Integer.parseInt(request.getParameter("amount")));
					psupdate1.setInt(1, Integer.parseInt(request.getParameter("amount")));
				}
				}
				psupdate.executeUpdate();
				psinsert.executeUpdate();
				psupdate1.executeUpdate();
				response.sendRedirect("Send_money.jsp?msg=vaild&ac="+ac+"&name="+request.getParameter("name"));
				psupdate.close();
				psinsert.close();
				con.close();
			}else {
				response.sendRedirect("Send_money.jsp?msg=invaild&ac="+ac+"&name="+request.getParameter("name"));
			}
			pscheck.close();
			con.close();
			
	}catch(Exception e) {
		System.out.println(e.getMessage());
	}
	}

}
