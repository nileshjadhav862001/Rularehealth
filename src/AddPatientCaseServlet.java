

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
 * Servlet implementation class AddPatientCaseServlet
 */
public class AddPatientCaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPatientCaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int patient_id = 0;
		int doctor_id = 0;
		String name = request.getParameter("name");
		int av_id = AccountCredentials.getAv_id();
		System.out.println("av_id "+av_id);
		int age = Integer.parseInt(request.getParameter("age"));
		
		if(age > 0)
		{
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			Long mobileno = Long.parseLong(request.getParameter("mobileno"));
			if(mobileno > 0)
			{
				String symptom1 = request.getParameter("symptom1");
				String symptom2 = request.getParameter("symptom2");
				String symptom3 = request.getParameter("symptom3");
				String symptom4 = request.getParameter("symptom4");
				String comment = "pending";
				String disease_name = "none";
						
				Connection con = DbConnection.connect();
				PreparedStatement ps;
				try 
				{
					ps = con.prepareStatement("select patient_id from patient");
					ResultSet r = ps.executeQuery();
					if(r.last())
					{
						patient_id = r.getInt(1);
					}
					System.out.println(patient_id);
					
					PreparedStatement pstmt = con.prepareStatement("insert into patient values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
					pstmt.setInt(1, (patient_id+1));
					pstmt.setString(2, name);
					pstmt.setInt(3, age);
					pstmt.setString(4, gender);
					pstmt.setString(5, address);
					pstmt.setLong(6, mobileno);
					pstmt.setString(7, symptom1);
					pstmt.setString(8, symptom2);
					pstmt.setString(9, symptom3);
					pstmt.setString(10, symptom4);
					pstmt.setString(11, disease_name);
					pstmt.setInt(12, av_id);
					pstmt.setInt(13, doctor_id);
					
				    int i = pstmt.executeUpdate();
				    
					if(i > 0)
					{	
						PreparedStatement pstmt1 = con.prepareStatement("select disease from disease_dataset where symptom_1=? and (symptom_2=? or symptom_3=? or symptom_4=?)");
						pstmt1.setString(1, symptom1);
						pstmt1.setString(2, symptom2);
						pstmt1.setString(3, symptom3);
						pstmt1.setString(4, symptom4);
						
						ResultSet rs = pstmt1.executeQuery();
						if(rs.next())
						{
							String disease = rs.getString(1);
							System.out.println(disease+"here ");
							PreparedStatement pstmt2 = con.prepareStatement("update patient set disease_name=? where patient_id=?");
							pstmt2.setString(1, disease);
							pstmt2.setInt(2, (patient_id+1));		
							pstmt2.executeUpdate();
							System.out.println(disease+"here ");
							PreparedStatement pstmt3 = con.prepareStatement("select doctor_id from specialist_doctor where disease=?");
							System.out.println(disease);
							pstmt3.setString(1, disease);
							ResultSet rs1 = pstmt3.executeQuery();
							if(rs1.next())
							{
								System.out.println(rs1.getInt(1));
								PreparedStatement pstmt4 = con.prepareStatement("update patient set doctor_id=? where patient_id=?");
								pstmt4.setInt(1, rs1.getInt(1));
								pstmt4.setInt(2, (patient_id+1));
								pstmt4.executeUpdate();
						    }
					    }	
						response.sendRedirect("arogyavibhag_panel.html");	
					}
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				response.sendRedirect("invalid_input_error2.html");
			}
		}
		else
		{
			response.sendRedirect("invalid_input_error2.html");
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
