

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.AccountCredentials;
import com.basic.DbConnection;

/**
 * Servlet implementation class AddDoctorCommentServlet
 */
public class AddDoctorCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctorCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = 0;
		String doctor_comment = request.getParameter("comment");
	    int patient_id = AccountCredentials.getPatient_id();
	    int doctor_id = AccountCredentials.getDoctor_id();
	    
	    //System.out.println(patient_id);
	    //System.out.println(av_id);
	    
	    try 
		{
	    	Connection con = DbConnection.connect();
		    PreparedStatement pstmt = con.prepareStatement("insert into comments values(?,?,?,?)");
		    pstmt.setInt(1, id);
		    pstmt.setInt(2, patient_id);
		    pstmt.setInt(3, doctor_id);
		    pstmt.setString(4, doctor_comment);
		    int i = pstmt.executeUpdate();
		    if(i > 0)
		    {
				response.sendRedirect("specialistdoctor_panel.html");
		    }
		    else
		    {
				response.sendRedirect("view_doctorpatientcase.jsp");
		    }	
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
