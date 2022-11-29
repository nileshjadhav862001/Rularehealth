
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.DbConnection;

/**
 * Servlet implementation class AddDoctorServlet
 */
public class AddSpecialistDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSpecialistDoctorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int doctor_id = 0;
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Long mobileno = Long.parseLong(request.getParameter("mobileno"));
		if(mobileno > 0)
		{
			String password = request.getParameter("password");
			String city = request.getParameter("city");
			String specialization = request.getParameter("specialization");
			String disease = request.getParameter("disease");
			System.out.println(disease);
			
			Connection con = DbConnection.connect();
			try 
			{
				System.out.println("hello");
				PreparedStatement pstmt = con.prepareStatement("insert into specialist_doctor values(?,?,?,?,?,?,?,?)");
				pstmt.setInt(1, doctor_id);
				pstmt.setString(2, name);
				pstmt.setString(3, email);
				pstmt.setLong(4, mobileno);
				pstmt.setString(5, password);
				pstmt.setString(6, city);
				pstmt.setString(7, specialization);
				pstmt.setString(8, disease);
			
			    int i = pstmt.executeUpdate();
				if(i > 0)
				{
					response.sendRedirect("admin_panel.html");
				}
				else
				{
					response.sendRedirect("invalid_input_error.html");
				}
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			response.sendRedirect("invalid_input_error.html");
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
