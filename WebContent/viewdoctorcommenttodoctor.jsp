<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.basic.AccountCredentials"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.basic.DbConnection"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<%@page import="com.basic.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>View Doctor comment</title>
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
                  <p class="profile-name">Doctor</p>
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
              <a class="nav-link" href="specialistdoctor_panel.html">
                <span class="menu-title">Dashboard</span>
                <i class="icon-screen-desktop menu-icon"></i>
              </a>
            </li>
            <li class="nav-item nav-category"><span class="nav-link">Patient Case</span></li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">Patient Details</span>
                <i class="icon-layers menu-icon"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="view_patientdetails.jsp">View Patient Details</a></li>
                  <li class="nav-item"> <a class="nav-link" href="view_doctorpatientcase.jsp">Add Comment and Prescription</a></li>
                 </ul>
              </div>
            </li>
            <li class="nav-item nav-category"><span class="nav-link"><a href="doctor_login.html"><font color="green">Logout</font></a></span></li>
          </ul>
        </nav>
       
<!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Doctor Comments </h3>
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
<th>Patient Id</th>
<th>Doctor Comment</th>
</tr>
</thead>
<tbody>     
<% 
try
{
int patient_id = Integer.parseInt(request.getParameter("id"));
System.out.println(patient_id);
Connection con = DbConnection.connect();
PreparedStatement pstmt = con.prepareStatement("select * from comments where patient_id=?");
pstmt.setInt(1, patient_id);
ResultSet rs = pstmt.executeQuery();

while(rs.next())
{
%>
<tr>
<td><%= rs.getInt(2) %></td>
<td><%= rs.getString(4) %></td>
<%
}
%>
</tr>
</tbody>
<%
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