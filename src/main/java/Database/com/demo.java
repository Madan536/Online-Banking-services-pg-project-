package Database.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class demo
 */
@WebServlet("/demo")
public class demo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public demo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.getWriter().append("Served at: ").append(request.getContextPath());
		String url ="jdbc:mysql://localhost:3306/Bank";
	  	 
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					 try {
						Connection con=DriverManager.getConnection(url,"root","root123*");
						PreparedStatement ps=con.prepareStatement("insert into demo values(?)");
						ps.setString(1, request.getParameter("fn"));
						
						HttpSession session=request.getSession();
						session.setAttribute("name", "");
						session.getAttribute(url);
						session.getLastAccessedTime();
						ps.executeUpdate();
						con.close();
						ps.close();
						res.getWriter().append("success ").append(request.getContextPath());
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						RequestDispatcher rs=request.getRequestDispatcher(url);
						rs.include(request, res);
						e.printStackTrace();
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				

	}

	

}
