<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>



<div class="container">
  <h2>Dynamic Tabs</h2>
  

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#category">Home</a></li>
    <li><a data-toggle="tab" href="#supplier">Menu 2</a></li>
    <li><a data-toggle="tab" href="#product">Menu 3</a></li>
  </ul>

  <div class="tab-content">
    <div id="category" class="tab-pane fade in active">
      <h3>Category</h3>
    <form:form action="SaveCategory" method="post" modelAttribute="category">
<table>  
   
         <tr>      
          <td><form:label path="categoryname"> ProName:</form:label></td> 
          <td><form:input path="categoryname" /></td>  
         </tr>  
          <tr>    
          <td><input type="submit" value="Submit" /></td>    
         </tr> 
         </table>    
       </form:form> 
       </div>
         
          
   

    <div id="supplier" class="tab-pane fade">
      <h3>Supplier</h3>
      
      <form:form action="SaveSupplier" method="post" modelAttribute="supplier">
<table>  
   
         <tr>      
          <td><form:label path="sname"> ProName:</form:label></td> 
          <td><form:input path="sname" /></td>  
         </tr> 
          <tr>    
          <td><input type="submit" value="Submit" /></td>    
         </tr>   
   </table>    
       </form:form> 
       </div>
    
    
    
    
    <div id="product" class="tab-pane fade">
      <h3>Product</h3>
<form:form action="SaveProduct" method="post" modelAttribute="product">
<table>  
   
         <tr>      
          <td><form:label path="proname"> ProName:</form:label></td> 
          <td><form:input path="proname" /></td>  
         </tr>   
          <tr>    
         <td><form:label path="category"> Category:</form:label></td>   
          <td><form:input path="category" /></td>  
         </tr>  
          <tr>    
          <td><form:label path="supplier"> SupplierName:</form:label></td> 
          <td><form:input path="supplier" /></td>  
         </tr>  
           
          
          <tr>    
         <td><form:label path="description"> Description:</form:label></td>    
          <td><form:input path="description" /></td>  
         </tr>  
          <tr>    
      <td><form:label path="price"> Price:</form:label></td>   
          <td><form:input path="price" /></td>  
         </tr>  
  
         <tr>    
         
          <td><input type="submit" value="Submit" /></td>    
         </tr>    
        </table>    
       </form:form> 
       </div>
       </div>
       </div>
       


</body>
</html>