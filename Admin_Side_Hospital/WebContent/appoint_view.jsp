<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql_rt" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie8 no-js" lang="en"><![endif]-->
<!--[if IE 9]><html class="ie9 no-js" lang="en"><![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- start: HEAD -->
<head>
<title>Welcome Admin :: Vision Medicare</title>
<!-- start: META -->
<meta charset="utf-8" />
<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="" name="description" />
<meta content="" name="author" />
<!-- end: META -->
<!-- start: MAIN CSS -->
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/fonts/style.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/main-responsive.css">
<link rel="stylesheet" href="assets/plugins/iCheck/skins/all.css">
<link rel="stylesheet"
	href="assets/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css">
<link rel="stylesheet"
	href="assets/plugins/perfect-scrollbar/src/perfect-scrollbar.css">
<link rel="stylesheet" href="assets/css/theme_light.css" type="text/css"
	id="skin_color">
<link rel="stylesheet" href="assets/css/print.css" type="text/css"
	media="print" />
<!--[if IE 7]>
		<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome-ie7.min.css">
		<![endif]-->
<!-- end: MAIN CSS -->
<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
<link rel="stylesheet"
	href="assets/plugins/summernote/build/summernote.css">
<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
<link rel="shortcut icon" href="favicon.ico" />
<style type="text/css">
.matrix {
	font-family: Lucida Console, Courier, Monotype;
	font-size: 10pt;
	text-align: center;
	width: 10px;
	padding: 0px;
	margin: 0px;
}
</style>
<script type="text/javascript" src="assets/js/TypingText.js"></script>
</head>
<% 
HttpSession ses=request.getSession(false);
String use=(String)ses.getAttribute("login");
if(use==null)
{
	request.getRequestDispatcher("/AdminLogin.jsp").forward(request,response);
}

%>
<sql:setDataSource var="ad_log" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/admin_hospital"
     user="root"  password="haresh" />

<sql:query dataSource="${ad_log}" var="result">
		select * from doctor where user='<%=use %>';
</sql:query>


<!-- end: HEAD -->
<!-- start: BODY -->
<body>
	<!-- start: HEADER -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<!-- start: TOP NAVIGATION CONTAINER -->
		<div class="container">
			<div class="navbar-header">
				<!-- start: RESPONSIVE MENU TOGGLER -->
				<button data-target=".navbar-collapse" data-toggle="collapse"
					class="navbar-toggle" type="button">
					<span class="clip-list-2"></span>
				</button>
				<!-- end: RESPONSIVE MENU TOGGLER -->
				<!-- start: LOGO -->
				<a class="navbar-brand" href="index.jsp"> <img
					style="height: 100px; width: 200px; margin-top: -25px"
					src="assets/images/Visionlogo.png" /> </a>
				<!-- end: LOGO -->
			</div>
			<div class="navbar-tools">
				<!-- start: TOP NAVIGATION MENU -->
				<ul class="nav navbar-right">
					<!-- start: USER DROPDOWN -->
					<li class="dropdown current-user"><a data-toggle="dropdown"
						data-hover="dropdown" class="dropdown-toggle"
						data-close-others="true" href="#"> <img
							src="assets/images/new_null_1.jpg" height="50px" width="50px"  class="circle-img"
							alt=""> <span class="username">
							
											<c:forEach var="row" items="${result.rows}">
												
												<c:out value="${row.First_name} ${row.Last_name}"></c:out>
											</c:forEach>

									</span>
									 <i
							class="clip-chevron-down"></i> </a>
						<ul class="dropdown-menu">
							
							<li><a href="AdminLoginConf.jsp"> <i class="clip-exit"></i>
									&nbsp;Log Out </a></li>
						</ul></li>
					<!-- end: USER DROPDOWN -->
					<!-- start: PAGE SIDEBAR TOGGLE -->

					<!-- end: PAGE SIDEBAR TOGGLE -->
				</ul>
				<!-- end: TOP NAVIGATION MENU -->
			</div>
		</div>
		<!-- end: TOP NAVIGATION CONTAINER -->
	</div>
	<!-- end: HEADER -->
	<!-- start: MAIN CONTAINER -->
	<div class="main-container">
		<div class="navbar-content">
			<!-- start: SIDEBAR -->
			<div class="main-navigation navbar-collapse collapse">
				<!-- start: MAIN MENU TOGGLER BUTTON -->

				<!-- end: MAIN MENU TOGGLER BUTTON -->
				<!-- start: MAIN NAVIGATION MENU -->
				<ul class="main-navigation-menu" style="margin-top: 20px;">
					<li><a href="docindex.jsp"><i class="clip-home-3"></i> <span
							class="title"> Home  </span><span class="selected"></span> </a></li>
					<li><a href="avail_change.jsp"><i class="clip-home-3"></i> <span
							class="title"> Change Schedule </span><span class="selected"></span>
					</a></li>

					<li><a href="appoint_view.jsp" target=""><i class="clip-cursor"></i> <span
							class="title"> View Appointments </span><span class="selected"></span>
					</a></li>
					<li><a href="reports.jsp" target=""><i class="clip-cursor"></i> <span
							class="title"> Upload Reports </span><span class="selected"></span>
					</a></li>
					<li><a href="doc_profile.jsp"><i class="clip-location"></i> <span
							class="title"> Profile </span> <span class="selected"></span>
					</a></li>
					
				</ul>
				<!-- end: MAIN NAVIGATION MENU -->
			</div>
			<!-- end: SIDEBAR -->
		</div>
		<!-- start: PAGE -->
		<div class="main-content">
			<div class="container">
				<!-- start: PAGE CONTENT -->
				
				<div class="row">
						<div class="col-md-12">
							<!-- start: BASIC TABLE PANEL -->
							<div class="panel panel-default" style="padding-top: 20px;">
								<div class="panel-heading" >
									<i class="fa fa-external-link-square"></i>
									
									Staff Records
									<div class="panel-tools">
										<a class="btn btn-xs btn-link panel-collapse collapses" href="#">
										</a>
										<a class="btn btn-xs btn-link panel-config" href="#panel-config" data-toggle="modal">
											<i class="fa fa-wrench"></i>
										</a>
										<a class="btn btn-xs btn-link panel-refresh" href="#">
											<i class="fa fa-refresh"></i>
										</a>
										<a class="btn btn-xs btn-link panel-expand" href="#">
											<i class="fa fa-resize-full"></i>
										</a>
										<a class="btn btn-xs btn-link panel-close" href="#">
											<i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="panel-body">
										     <sql:setDataSource var="cl_reg" driver="com.mysql.jdbc.Driver"
    																 url="jdbc:mysql://localhost:3306/admin_hospital"
     																								user="root"  password="haresh"/>
									
													<sql:query dataSource="${cl_reg}" var="result">
														select * from appointment where doctor='<%=use %>';
													</sql:query>
													<%
													Connection con;
													Statement st,st1;
													ResultSet rs,rs1;
													String ss,ss1;
													Date dd=new Date();
													Calendar now=Calendar.getInstance();
													
													SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
													String ddd=sdf.format(dd);
													dd=sdf.parse(ddd);
													
													now.setTime(dd);
													try
														{
															Class.forName("com.mysql.jdbc.Driver");
															con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin_hospital","root","haresh");
															st=con.createStatement();
															st1=con.createStatement();
															rs=st.executeQuery("select * from appointment where doctor='"+use+"'");
															%>
															<table class="table table-hover" id="sample-table-1">
															<thead>
																<tr>
																	<th class="center">Sr No.</th>
																	<th class="center">Patient Name</th>
																	<th class="center">Date</th>
																	<th class="center">From</th>
																	<th class="center">To</th>

																	
																</tr>
															</thead>
																<tr>
															<td colspan="5" align="center"><h2><b>Upcoming</b></h2></td>
															<tr>

															<%
															while(rs.next())
															{
																String pat=rs.getString("patient");
																rs1=st1.executeQuery("select * from patient where user='"+pat+"'");
																
																ss=rs.getString("date");
																Calendar newcal=Calendar.getInstance();
																newcal.setTime(sdf.parse(ss));
																if(now.after(newcal))
																{
																	
																}
																else if(now.before(newcal))
																{
																	
																	
																	%>
																		<tr>
																			<td class="center"><%out.print(rs.getString("sr")); %></td>
																			<% 
																			while(rs1.next())
																			{
																			%>
																				<td class="center"><%out.print(rs1.getString("First_name")+" "+rs1.getString("Last_name")); %></td>
																			<%} %>
																			<td class="center"><%out.print(rs.getString("date")); %></td>
																			<td class="center"><%out.print(rs.getString("from1")); %></td>
																			<td class="center"><%out.print(rs.getString("to1")); %></td>
																			
																		</tr>

																	<%
																}
															}
															rs.beforeFirst();
															%>
															<tr>
															<td colspan="5" align="center"><h2><b>Past</b></h2></td>
															<tr>
															
															<%															
															
															
															while(rs.next())
															{

																String pat=rs.getString("patient");
																rs1=st1.executeQuery("select * from patient where user='"+pat+"'");
																
																ss=rs.getString("date");
																Calendar newcal=Calendar.getInstance();
																newcal.setTime(sdf.parse(ss));
																if(now.after(newcal))
																{
																	
																	%>
																	<tr>
																		<td class="center"><%out.print(rs.getString("sr")); %></td>
																		<% 
																		while(rs1.next())
																		{
																		%>
																			<td class="center"><%out.print(rs1.getString("First_name")+" "+rs1.getString("Last_name")); %></td>
																		<%} %>
																		<td class="center"><%out.print(rs.getString("date")); %></td>
																		<td class="center"><%out.print(rs.getString("from1")); %></td>
																		<td class="center"><%out.print(rs.getString("to1")); %></td>
																		
																	</tr>

																<%
																}
																else if(now.before(newcal))
																{
																	
																	
																	
																}
															}
														}
														catch(Exception e)
														{
															out.print(e.getMessage());
														}
															
															
															
											%>
											
											
											<%

															
															
															
											%>
													</table>

									
									
									
									
								</div>
							</div>
						</div>
				</div>
									
				
			</div>
		</div>
		<!-- end: PAGE -->
	</div>
	<!-- end: MAIN CONTAINER -->
	<!-- start: FOOTER -->
	<div class="footer clearfix">
		<div class="footer-inner">2014 &copy; Vision Medicare by Advait
			Patel.</div>
		<div class="footer-items">
			<span class="go-top"><i class="clip-chevron-up"></i>
			</span>
		</div>
	</div>
	<!-- end: FOOTER -->
	<!-- start: RIGHT SIDEBAR -->

	<!-- end: RIGHT SIDEBAR -->
	<!-- start: MAIN JAVASCRIPTS -->
	<!--[if lt IE 9]>
		<script src="assets/plugins/respond.min.js"></script>
		<script src="assets/plugins/excanvas.min.js"></script>
		<script type="text/javascript" src="assets/plugins/jQuery-lib/1.10.2/jquery.min.js"></script>
		<![endif]-->
	<!--[if gte IE 9]><!-->
	<script src="assets/plugins/jQuery-lib/2.0.3/jquery.min.js"></script>
	<!--<![endif]-->
	<script src="assets/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
	<script src="assets/plugins/blockUI/jquery.blockUI.js"></script>
	<script src="assets/plugins/iCheck/jquery.icheck.min.js"></script>
	<script src="assets/plugins/perfect-scrollbar/src/jquery.mousewheel.js"></script>
	<script src="assets/plugins/perfect-scrollbar/src/perfect-scrollbar.js"></script>
	<script src="assets/plugins/less/less-1.5.0.min.js"></script>
	<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
	<script
		src="assets/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
	<script src="assets/js/main.js"></script>
	<!-- end: MAIN JAVASCRIPTS -->
	<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
	<script
		src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="assets/plugins/summernote/build/summernote.min.js"></script>
	<script src="assets/plugins/ckeditor/ckeditor.js"></script>
	<script src="assets/plugins/ckeditor/adapters/jquery.js"></script>
	<script src="assets/js/form-validation.js"></script>
	<script type="assets/js/effect.js"></script>
	<script type="text/javascript" src="assets/js/effect.js"></script>
	<!-- For Special Effect-->
	<script type="text/javascript">
					//Define first typing example:
			new TypingText(document.getElementById("example1"));
			//Type out examples:
			TypingText.runAll();
		</script>

	<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
	<script>
			jQuery(document).ready(function() {
				Main.init();
				FormValidator.init();
			});
		</script>

</body>
<!-- end: BODY -->
</html>