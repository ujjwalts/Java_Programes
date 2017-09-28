<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page isELIgnored="false"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-primary panel-table">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-3">
								<h3 class="text-center pull-left" style="padding-left: 20px;">
									<span class="glyphicon glyphicon-list-alt"> </span>Product
									
								</h3>
							</div>
							<div class="col-sm-12 col-md-9">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<div class="col-xs-12 col-md-4">
										<label> Search </label>
										<div class="form-group">
											<div class="input-group">
												<input type="text" class="form-control input-md"
													name="search">
												<div class="input-group-btn">
													<button type="button" class="btn btn-md btn-success">
														<span class=" glyphicon glyphicon-search"></span>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-striped table-bordered table-list" >
							<thead>
								<tr>
                <th>ProductId</th>
                <th>ProductName</th>
               
                 <th>Description</th>
                  <th>Stock</th>            
                 <th>Price</th>
                  <th>Image</th>
                  <th>Config</th>
                   
                </tr>
							</thead>
							<tbody>
								    <c:forEach var="product" items="${list}">
                    <tr style="background: #ffffff;">
                    <td>${product.proid}</td>
                    <td>${product.proname}</td>
                  
                    <td>${product.description}</td>
                    <td>${product.stock}</td>
                    <td>${product.price}</td>
                    <td>
                     <img src="${pageContext.request.contextPath}/Images/${product.proid}.jpg" height="70px" width="70px"/>
                    </td>
                    
                    <td>
                   <a href="delete/${product.proid}">Delete</a>
                     <a href="editpro/${product.proid}"> /Edit</a> 
                    </td>
                    </tr>
                    </c:forEach>  
							</tbody>


						</table>

					</div>

				</div>
			</div>
		</div>
	</div>


</body>
</html>