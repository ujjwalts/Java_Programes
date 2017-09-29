<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
<html>
<%@ page isELIgnored="false"%>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product</title>
</head>
<body>

<form:form modelAttribute="cmdd" method="post" action="/EcommerceFrontend/Save" enctype="multipart/form-data" >    
        <table>
        <tr>  
         
         <td><form:hidden  path="proid" readonly="true" style="border:none"/></td> 
         </tr>   
         <tr>    
          <td>Product Name : </td>   
          <td><form:input path="proname"  /></td>  
         </tr>    
         <tr>    
          <td>Description :</td>    
          <td><form:input path="description" /></td>  
         </tr>   
          
          <tr>    
          <td>Price :</td>    
          <td><form:input path="price" /></td>  
         </tr>   
        
        <tr><td> <select name="categoryId" id="procat" class="form-control">
         <option value="NONE" >--- Select Category ---</option>
        <c:forEach var="cat" items="${catlist}">
        <option value="${cat.categoryid}">${cat.categoryname}</option>
        </c:forEach>
         </select></td></tr> <br> 
         
          
           <tr><td> <select name="supplierId" id="prosup"
        class="form-control">
         <option value="NONE" >--- Select Supplier ---</option>
        <c:forEach var="sup" items="${suplist}">
        <option value="${sup.sid}">${sup.sname}</option>
        </c:forEach>
         </select> </td></tr><br>  
         
         		 <tr><td><div class="fileinput fileinput-new" data-provides="fileinput">
										<input class="form-control" type="file" name="file"
											 placeholder="Select image">

									</div></td></tr>
									
									
							<tr><td><Button type="submit" class="btn btn-primary">Submit</Button>
							<br>
							<br>
							<Button type="reset" class="btn btn-danger">Reset</Button></td></tr>
							
            
         </table>
       </form:form> 
</body>
</html>