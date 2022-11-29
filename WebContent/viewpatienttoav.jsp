<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.basic.AccountCredentials"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.basic.DbConnection"%>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>View Patient</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="vendors/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="vendors/chartist/chartist.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="images1/favicon.png" />
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="navbar-brand-wrapper d-flex align-items-center">
          
          <a class="navbar-brand brand-logo-mini" href="index.html"><img src="images1/logo-mini.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center flex-grow-1">
          <h5 class="mb-0 font-weight-medium d-none d-lg-flex">Welcome to Rural E-Health</h5>
          <ul class="navbar-nav navbar-nav-right ml-auto">
            <img src="images1/e_health.png" width="180" height="60"> 
                    
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="icon-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="profile-image">
                  <img class="img-xs rounded-circle" src="images1/faces/face8.jpg" alt="profile image">
                  <div class="dot-indicator bg-success"></div>
                </div>
                <div class="text-wrapper">
                  <p class="profile-name">Arogya Vibhag</p>
                </div>
                <div class="icon-container">
                  <i class="icon-bubbles"></i>
                  <div class="dot-indicator bg-danger"></div>
                </div>
              </a>
            </li>
            <li class="nav-item nav-category">
              <span class="nav-link">Dashboard</span>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="arogyavibhag_panel.html">
                <span class="menu-title">Dashboard</span>
                <i class="icon-screen-desktop menu-icon"></i>
              </a>
            </li>
            <li class="nav-item nav-category"><span class="nav-link">Arogya Vibhag</span></li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">Arogya Vibhag Details</span>
                <i class="icon-layers menu-icon"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="add_patientcase.jsp">Add case</a></li>
                  <li class="nav-item"> <a class="nav-link" href="viewpatienttoav.jsp">View case</a></li>
                 </ul>
              </div>
            </li>
            <li class="nav-item nav-category"><span class="nav-link">Arogya Vibhag</span></li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                <span class="menu-title">Comment to Doctor</span>
                <i class="icon-doc menu-icon"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="viewpatientcase.jsp">Add Comment</a></li>
                  </ul>
              </div>
            </li>
            <li class="nav-item nav-category"><span class="nav-link"><a href="arogyavibhag_login.html"><font color="green">Logout</font></a></span></li>
          </ul>
        </nav>
       
       
       
       
<!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Patient Cases </h3>
              <nav aria-label="breadcrumb">
              </nav>
            </div>
            <div class="row">
<div class="col-lg-12 grid-margin stretch-card">
<div class="card">
<div class="card-body">
</p>
<table class="table table-striped">
<thead>
<tr>
<th>Id</th>
<th>Name</th>
<th>Age</th>
<th>Gender</th>
<th>Mobile No</th>
<th>Disease</th>
<th>Doctor Comment</th>
<th>AV Comment</th>
</tr>
</thead>
<tbody>     
<% 
try
{
int av_id = AccountCredentials.getAv_id(); 
System.out.println(av_id);
Connection con = DbConnection.connect();
PreparedStatement pstmt = con.prepareStatement("select * from patient where av_id=?");
pstmt.setInt(1, av_id);
ResultSet rs = pstmt.executeQuery();

while(rs.next())
{
int patient_id = rs.getInt(1);
System.out.println(patient_id);
PreparedStatement pstmt1 = con.prepareStatement("select * from comments where patient_id=?");
pstmt1.setInt(1, patient_id);
ResultSet rs1 = pstmt1.executeQuery();
PreparedStatement pstmt2 = con.prepareStatement("select * from av_comments where patient_id=?");
pstmt2.setInt(1, patient_id);
ResultSet rs2 = pstmt2.executeQuery();
/* PreparedStatement pstmt3 = con.prepareStatement("select image from prescription_image where patient_id=?");
pstmt3.setInt(1, patient_id);
ResultSet rs3 = pstmt3.executeQuery(); */

%>
<tr>
<td><%= rs.getInt(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getInt(3) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getLong(6) %></td>
<td><%= rs.getString(11) %></td>
<%
if(rs1.next())
{
	AccountCredentials.setPatient_name(rs.getString(2));
%>
  <td><a href="viewdoctorcomment.jsp?id=<%=rs.getInt(1)%>"><b><font color="green">View Doctor Comment</font></b></a></td>
<%
}
else
{
%>
  <td><b><font color="red"> pending </font></b></td>
<%
}

if(rs2.next())
{
	AccountCredentials.setPatient_name(rs.getString(2));
%>
  <td><a href="viewarogyavibhagcomment.jsp?id=<%=rs.getInt(1)%>"><b><font color="green">View AV Comment</font></b></a></td>
<%
}
else
{
%>
	<td><b><font color="red"> pending </font></b></td>
<%
}
%>
</tr>
</tbody>
<%
}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</table>
 </div>
 </div>     
 </div>
 </div>
 </div>       
          <!-- content-wrapper ends -->
          
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="vendors/select2/select2.min.js"></script>
    <script src="vendors/typeahead.js/typeahead.bundle.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="js/off-canvas.js"></script>
    <script src="js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="js/typeahead.js"></script>
    <script src="js/select2.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>