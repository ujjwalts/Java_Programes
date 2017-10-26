<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@ page isELIgnored="false"%>
<head>
<style>
.caty{

padding-top:50px;
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>

<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default panel-table">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-3">
								<h3 class="text-center pull-left" style="padding-left: 20px;">
									<span class="glyphicon glyphicon-list-alt"> </span>Category
									
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
													<button type="button" class="btn btn-md btn-warning">
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
						<table class="table table-striped table-bordered table-list">
							<thead>
								<tr>
									
									<th>Category Id</th>
									<th>Category Name</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="category" items="${catlist}">
									<tr>
									
										<td>${category.categoryid}</td>
										<td>${category.categoryname}</td>
									
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