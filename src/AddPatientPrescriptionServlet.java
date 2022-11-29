
import com.basic.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.basic.AccountCredentials;
import com.basic.DbConnection;
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215) 
/**
 * Servlet implementation class AddPatientPrescriptionServlet
 */
public class AddPatientPrescriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPatientPrescriptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		InputStream inputStream = null; // input stream of the upload file
		String msg = null;
		int id = 0;
        
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection con = DbConnection.connect();
         
        try 
        {
        	int patient_id = AccountCredentials.getPatient_id();
            System.out.println(patient_id);
            PreparedStatement statement = con.prepareStatement("insert into prescription_image values(?,?,?)");
           
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
            	statement.setInt(1, id);
            	statement.setInt(2, patient_id);
                statement.setBlob(3, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                response.sendRedirect("view_doctorpatientcase.jsp");
            }
        } 
        catch (SQLException ex) {
            msg = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } 
        finally {
            if (con != null) {
                // closes the database connection
                try {
                    con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            
            request.setAttribute("Message", msg);
		
		doGet(request, response);
	}
	}
}
