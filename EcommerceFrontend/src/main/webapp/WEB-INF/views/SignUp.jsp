<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib uri = "http://www.springframework.org/tags/form" prefix="f"%>
    <!DOCTYPE html>

<html>
<head>

<title>Insert title here</title>
    <style>
.sign{
    padding-top: 90px;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="sign">
<div class="container">
<h3>Quick SignUp!</h3>
<h6>we respect your privacy!</h6>


<div class="row">

<f:form action="saveregister" method="post" modelAttribute="user">

<div class="col-lg-12">
<div class="form-group row col-xs-4">

<div>      
<label>First Name:</label> 
<f:input path="first_name" placeholder="Enter First Name" class="form-control"/>
</div>

<div class="form group">
<label>Last Name:</label>
<f:input path="last_name" placeholder="Enter Last Name" class="form-control"/>
</div>

<div class="form group">
<label>Email:</label>
<f:input path="email" placeholder="Enter Email" class="form-control"/>
</div>

<div class="form group">
<label>Password:</label>
<f:input path="password" type="password" placeholder="Enter Password" class="form-control"/>
</div>

<div class="form group">
<label>Phone:</label>
<f:input path="phone" placeholder="Enter Phone" class="form-control"/>
</div>

<div class="form-group">
<label>Address:</label>
<f:input path="address" placeholder="Enter Address" class="form-control"/>
</div>
<br>
<input type="submit" value="Register" class="btn btn-info btn-block btn-md">
<input class="btn btn-danger btn-block btn-md" type="reset" value="Reset">
<!-- <Button type="reset" class="btn btn-danger" style="width:220px">Cancel</Button> -->

</div>
</div>
</f:form>

</div>
</div>
</div>
</body>
</html>