

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
 * Servlet implementation class AddPatientCommentServlet
 */
public class AddPatientCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPatientCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = 0;
		int doctor_id = 0;
		String doctor_comment = request.getParameter("comment");
	    int patient_id = AccountCredentials.getId();
	    int av_id = AccountCredentials.getAv_id();
	    String defaultmsg = "pending";
	    String disease = AccountCredentials.getDisease();
	    
	    Connection con = DbConnection.connect();
		
		try 
		{
			PreparedStatement pstmt = con.prepareStatement("select doctorid from specialist_doctor where diseased_treat=?");
		    pstmt.setString(1, disease);
		    ResultSet rs = pstmt.executeQuery();
		    if(rs.next())
		    	doctor_id = rs.getInt(1);
		    
			System.out.println(doctor_id);
			pstmt = con.prepareStatement("insert into av_comments values(?,?,?,?,?)");
			//pstmt.setString(1, comment);
			//pstmt.setInt(2, patient_id);
			pstmt.setInt(1, id);
		    pstmt.setInt(2, patient_id);
		    pstmt.setInt(3, av_id);
		    pstmt.setInt(4, doctor_id);
		    pstmt.setString(5, doctor_comment);
		    /*pstmt.setString(5, doctor_comment);*/
			
		    int i = pstmt.executeUpdate();
			if(i > 0)
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
