<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html >
    
<html>
<%@ page isELIgnored="false"%>
<head>
    <style>
.ca{
    padding-top: 150px;
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div class="ca">
<form:form modelAttribute="cmdd" method="post" action="/EcommerceFrontend/admin/Save" enctype="multipart/form-data" >    
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
          <td>Stock :</td>    
          <td><form:input path="stock" /></td>  
         </tr>   
          
          <tr>    
          <td>Price :</td>    
          <td><form:input path="price" /></td>  
         </tr>   
        
        <tr><td> <select name="categoryId" id="procat" class="form-control">
         <option value="0" >--- Select Category ---</option>
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
       </div>
</body>
</html>