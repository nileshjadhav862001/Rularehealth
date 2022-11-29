<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <title>Add Doctor</title>
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
                  <p class="profile-name">Admin</p>
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
              <a class="nav-link" href="admin_panel.html">
                <span class="menu-title">Dashboard</span>
                <i class="icon-screen-desktop menu-icon"></i>
              </a>
            </li>
            <li class="nav-item nav-category"><span class="nav-link">Arogya Vibhag</span></li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">Arogya Vibhag</span>
                <i class="icon-layers menu-icon"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="add_arogyavibhag.html">Add</a></li>
                  <li class="nav-item"> <a class="nav-link" href="view_arogyavibhag.html">View</a></li>
                  <li class="nav-item"> <a class="nav-link" href="delete_arogyavibhag.html">Delete</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item nav-category"><span class="nav-link">Specialist Doctor</span></li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                <span class="menu-title">Specialist Doctor</span>
                <i class="icon-doc menu-icon"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="add_specialistdoctor.jsp">Add</a></li>
                  <li class="nav-item"> <a class="nav-link" href="view_specialistdoctor.jsp"> View </a></li>
                  <li class="nav-item"> <a class="nav-link" href="delete_specialistdoctor.jsp"> Delete </a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item nav-category"><span class="nav-link"><a href="admin_login.html"><font color="green">Logout</font></a></span></li>
          </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">Specialist Doctor Form </h3>
              <nav aria-label="breadcrumb">
    
              </nav>
            </div>
            <div class="row">
              
              
              <div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <form class="forms-sample" action="AddSpecialistDoctorServlet">
                      <div class="form-group">
                        <label for="exampleInputName1">Name</label>
                        <input type="text" name="name" class="form-control" id="exampleInputName1" placeholder="Name">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail3">Email</label>
                        <input type="email" name="email" class="form-control" id="exampleInputEmail3" placeholder="Email">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputMobile">Mobile</label>
                        <input type="text" name="mobileno" class="form-control" id="exampleInputMobile" placeholder="Mobile number">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword4">Password</label>
                        <input type="password" name="password" class="form-control" id="exampleInputPassword4" placeholder="Password">
                      </div>                     
                      <div class="form-group">
                        <label for="exampleInputCity">City</label>
                        <input type="text" name="city" class="form-control" id="exampleInputCity" placeholder="City">
                      </div>
                      
                      <div class="form-group">
                        <label for="exampleSelectSpecialization">Specialization </label>
                        <select class="form-control" id="exampleSelectSpecialization" name="specialization">
                        <option> Pediatrics </option>
                        <option> Dermatology </option>
                        <option> Anesthesiology </option>
                        <option> Opthalmology </option>
                        <option> Oncology </option>
                        <option> Psychiatry </option>
                        <option> Orthopedics </option>
                        <option> Neurology </option>
                        <option> Radiology </option>
                        <option> ENT </option>
                        <option> Obstetrics and Gynaecology</option>
                        <option> Cardiology </option>
                        <option> General Surgery </option>
                        <option> Plastic Surgery </option>
                        <option> Cardiothoracic Surgery </option>
                        <option> Urology </option>
                        <option> Neorosurgery </option>
                        <option> Gastroenterology </option>
                        <option> Pathology </option>
                        <option> Geriatrics </option>
                        <option> Endocrinology </option>
                        </select>
                       </div>
                      
                      <% 
                      try
                     {
                     Connection con = DbConnection.connect();
                     PreparedStatement pstmt = con.prepareStatement("select distinct disease from disease_dataset");
                     ResultSet rs = pstmt.executeQuery();
                     %>
                      
                      <div class="form-group">
                        <label for="exampleSelectDisease">Diseased Treat</label>
                        <select class="form-control" id="exampleSelectDisease" name="disease">
                        <% while(rs.next()) {%>
                          <option><%= rs.getString(1) %></option>
                        <% }%>
                        </select>
                      </div>
<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
                      <button type="submit" class="btn btn-primary mr-2">Submit</button>
                      <button class="btn btn-light" action="admin_panel.html">Cancel</button>
                    </form>
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