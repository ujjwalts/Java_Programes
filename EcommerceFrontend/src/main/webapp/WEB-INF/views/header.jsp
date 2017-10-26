<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<%@ page isELIgnored="false"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

.nav.navbar-nav li a {
    color: white;
    }
    
    
.dropdown-menu { background-color: #263238;  }

.nav.navbar-nav>li>a:hover, .navbar-default .navbar-nav>li>a:focus {
	background-color: #263238;
	color: #ffbb33;
}

 .navbar  {
	line-height: 100px;
	height: 100px;
	padding-top: 0;
	background-color: #212121;
	
} 
 /*  .nav navbar-nav navbar-right{
            color: #0099CC;*/
} */
.ico{
position:fixed-top;

}
.footer{
	/*  padding-top: 6px;
	 position: relative; 
	  min-height: 30vh;
	 height: 100px;
     margin-top: -50px;
     position: fixed;
     bottom:0;
     width: 100%;
     z-index: 1; */
.html{
position: relative;
    min-height: 100%;
    }
    .body{
 margin: 0 0 100px; /* bottom = footer height */
    padding: 25px;}
    
    .footer{
    
 background-color: orange;
    position: absolute;
    left: 0;
    bottom: 0;
    height: 100px;
    width: 100%;
    overflow:hidden;
}
  .navbar-brand {
    position: absolute;
    left: 50%;
    margin-left: -50px !important;  /* 50% of your logo width */
    display: block;
}
  
</style>

</head>
<body>
		

	 <nav class="navbar  navbar-fixed-top" role="navigation">
	<div class="ico">
	<div class="container">
		<div class="row">



			<div class="container-fluid">

	
				<div class="header-container">
				

					<%-- <a class="navbar-brand" href="${pageContext.request.contextPath}/index">StartExploring</a> --%>
					<a class="navbar-brand" href="${pageContext.request.contextPath}/index"><img src="https://res.cloudinary.com/dqc8e3uad/image/upload/e_brightness:80/v1508352417/fevico_srzyne.ico">
        </a>
		
					

<!-- 
					<div>
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="Explorers Box.">
							</div>
							<button type="submit" class="btn btn-outline">Search</button>
						</form>
					</div>

 -->



       <ul class="nav navbar-nav navbar-left">
       
       
		<li>  <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h4>Welcome : ${pageContext.request.remoteUser}</h4> 
            	<li><a href="<c:url value="/logout" />">Logout</a></li>
            <br>
           </c:if>
			</li>
			</ul>
			
							
			

						<ul class="nav navbar-nav navbar-right">

							<li class="dropdown">
							<a href="#" data-toggle="dropdown">CategoryList <span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li>
									<c:forEach var="cat" items="${catlist}">
											<li value="${cat.categoryid}"></li>
											 <li><a  href="${pageContext.request.contextPath}/custproduct?cid=${cat.categoryid}">${cat.categoryname}</a></li> 
									</c:forEach>
									</li>

								</ul></li>
					
			
							<security:authorize access="hasRole('ROLE_ADMIN')">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="/#/"><span
					class="glyphicon glyphicon-user"></span> ADMIN<span class="caret"></span></a>
				<ul class="dropdown-menu">
				<li><a href="<c:url value='/admin/addPro'/>">Admin</a></li>
					<li><a href="<c:url value="/logout" />">Logout</a></li>			
				</ul></li>
				
				</security:authorize>
			
							
							
							<li><a href="${pageContext.request.contextPath}/cart"><span class="glyphicon glyphicon-shopping-cart"></span>Your Cart</a></li>


							<li><a href="RegisterPage"><span
									class="glyphicon glyphicon-user"></span> SignUp</a></li>
							<li><a href="${pageContext.request.contextPath}/login"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</ul>




						
				
			
			
		</div>
	</div>
		</div>
	</div>
</div>
	</nav> 
	


	

</body>
</html>