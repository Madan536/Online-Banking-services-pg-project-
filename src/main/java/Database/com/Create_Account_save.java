package Database.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Create_Account_save
 */
@WebServlet("/Create_Account_save")
public class Create_Account_save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Create_Account_save() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		StringBuffer st=new StringBuffer("81321");
		Random rm=new Random();
		for(int i=1;i<=4;i++) {
		st.append(rm.nextInt(10)+1);
		}
		String Acn=String.valueOf(st);
			
		Thread t=new Thread();
  	  String url ="jdbc:mysql://localhost:3306/Bank";
  	  try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
			 Connection con=DriverManager.getConnection(url,"root","root123*");
  	 
		String query="insert into Createaccount"
				+ "(AccountNo, First_Name, Last_Name, Email, PhoneNO, "
				+ "DOB, Aadhar_NO,Amount, Address, City, State, Pin_code)"
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";
				
			PreparedStatement ps=con.prepareStatement(query);
			
			String an=req.getParameter("an");
			ps.setString(1, Acn);
			ps.setString(2, req.getParameter("fn"));
			ps.setString(3, req.getParameter("ln"));
			ps.setString(4, req.getParameter("e"));
			ps.setString(5,req.getParameter("pn"));
			ps.setString(6, req.getParameter("dob"));
			Statement st1=con.createStatement();
			ResultSet rs=st1.executeQuery("select * from createaccount where Aadhar_NO="+an);
			if(rs.next()) {	
				ps.close();
				con.close();
				res.sendRedirect("CreateAccount.jsp?msg=use");
			}else {
				ps.setString(7, req.getParameter("an"));		
			}
			
			ps.setString(8, "1000");
			ps.setString(9, req.getParameter("ad"));
			ps.setString(10, req.getParameter("c"));
			ps.setString(11, req.getParameter("s"));
			ps.setString(12,req.getParameter("pc"));
			ps.executeUpdate();
			
			try {		
			res.sendRedirect("CreateAccount.jsp?msg=vaild");
			}catch(Exception e) {	
				System.out.println(e.getMessage());
			}
	        ps.close();
	        rs.close();
	        con.close();
  	 }catch(Exception e) {
   		System.out.println(e.getMessage()); 
   		res.sendRedirect("CreateAccount.jsp?msg=invaild");
   		
         }
  	 }catch(Exception e) {
    		System.out.println(e.getMessage());  
    		
          }
  	
	}

}
