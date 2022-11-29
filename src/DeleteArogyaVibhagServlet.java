

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.DbConnection;

/**
 * Servlet implementation class DeleteArogyaVibhagServlet
 */
public class DeleteArogyaVibhagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteArogyaVibhagServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		Connection con = DbConnection.connect();
		try
		{
			System.out.println("Hello");
			PreparedStatement pstmt = con.prepareStatement("delete from arogyavibhag where av_id=?");
			pstmt.setInt(1, id);
			int i = pstmt.executeUpdate();
			if(i > 0)
			{
				response.sendRedirect("delete_arogyavibhag.jsp");
			}
		}
		catch(Exception e)
		{
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
