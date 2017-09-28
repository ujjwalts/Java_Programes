<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix="f"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page isELIgnored="false"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

</head>
<body>

<h4 class="text-center"><a href="index" >HOMEPAGE</a> </h4>

<div class="container">
  <h2>Admin's Box</h2>
  
 
  <div class="row">
  <div class="col-md-6">
  <div class="panel with-nav-tabs panel default">

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#category">Category</a> </li>
   <li> <a data-toggle="tab" href="#supplier">Supplier</a></li>
   <li> <a data-toggle="tab" href="#product">Product</a></li>

                                     <li class="dropdown">
                                <a href="#" data-toggle="dropdown">View <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                  <li> <a href="viewPro">ProductList</a></li>
                                  <li>  <a href="categorylist">CategoryList</a> </li>
                                      <li> <a href="supplierlist">SupplierList</a> </li>
                                      </ul></li>
                                      </ul>
                                      
                                      
                           </div>
    
 <div class="panel-body">
 <div class="tab-content">
 
 

							<div class="tab-pane fade in active" id="category">
                                   <form method="post" action="<c:url value="/SaveCategory"/>">
 
 
									<h4 class="input-title">Category Name</h4>
									<input class="form-control" type="text" name="categoryname" required><br>

									<Button type="submit" class="btn btn-primary">Submit</Button>
									<Button type="reset" class="btn btn-danger">Cancel</Button>

								</form>
								

                         </div>
       
       
							<div class="tab-pane fade" id="supplier">

								<form method="post" action="<c:url value="/SaveSupplier"/>">

									<h4 class="input-title">Supplier Name</h4>
									<input class="form-control" type="text" name="sname" required><br>

									<Button type="submit" class="btn btn-primary">Submit</Button>
									<Button type="reset" class="btn btn-danger">Cancel</Button>

								</form>
       </div>
    
    
    							<div class="tab-pane fade" id="product">
								<form method="post" action="<c:url value="/SaveProduct"/>" enctype="multipart/form-data">
									<h4 class="input-title">Product Name</h4>
									<input class="form-control" type="text" name="proname"
										required><br>									
									<h4 class="input-title">Product Description</h4>
									<input class="form-control" type="text" name="description"
										required><br>
										<h4 class="input-title">Stock</h4>
									<input class="form-control" type="text" name="stock"
										required><br>
									<h4 class="input-title">Price</h4>
									<input class="form-control" type="text" name="price"
										required><br> 

         
         <select name="categoryId" id="procat"
        class="form-control">
         <option value="NONE" >--- Select Category ---</option>
        <c:forEach var="cat" items="${catlist}">
        <option value="${cat.categoryid}">${cat.categoryname}</option>
        </c:forEach>
         </select> <br>
         
         <select name="supplierId" id="prosup"
        class="form-control">
         <option value="NONE" >--- Select Supplier ---</option>
        <c:forEach var="sup" items="${suplist}">
        <option value="${sup.sid}">${sup.sname}</option>
        </c:forEach>
         </select> <br>
         

									<div class="fileinput fileinput-new" data-provides="fileinput">
										<input class="form-control" type="file" name="file"
											 placeholder="Select image">

									</div>

									<br>

									<Button type="submit" class="btn btn-primary">Submit</Button>
									<Button type="reset" class="btn btn-danger">Reset</Button>

								</form>
							</div>
    
    
       </div>
       </div>
       </div>
       
       </div>
       </div> 
        
      
       
       


</body>
</html>