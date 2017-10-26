<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
           <%@taglib uri = "http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html >
<html>
	<jsp:include page="header.jsp"></jsp:include>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.cart{
padding-top:120px}
</style>

</head>
<body>
<div class="cart">

    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Shopping cart</li>
                    </ul>
                </div>

                <div class="col-md-9" id="basket">

                    <div class="box">

                     

                            <h1>Shopping cart</h1>
                      
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th colspan="2">Product</th>
                                            <th>Quantity</th>
                                            <th>Unit price</th>
                                       
                                            <th colspan="2">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      
				<c:forEach var="c" items="${cartinfo}">
					<div class="row">
</div>
				
						<tr>
							<td data-th="Product">


								<div class="col-sm-2 ">
									<img
										src="${pageContext.request.contextPath}/Images/${c.proid}.jpg" height="100px" width="100px"  />
								</div>
								<div class="col-sm-8 col-md-offset-2">
									<h3> ${c.cartProductName}</h3>
									<p>${c.cartProductDescription}</p>
								</div>

							</td>
							<td data-th="Price">${c.price}</td>
							<td data-th="Quantity">${c.totalItems}</td>
							<td data-th="Subtotal" class="text-center">${c.finalAmount}</td>
							<td class="text-center"><a class='btn btn-info btn-xs'
								href="${pageContext.request.contextPath}/deleteCart/${c.cartid}">
									<span class="glyphicon glyphicon-remove"></span></a></td>
									</tr>
</c:forEach>
						
</tbody>

		
		
		<tfoot>
								<tr>
								<td><a href="${pageContext.request.contextPath}/"
									class="btn btn-warning"><i class=""></i> Continue Shopping</a></td>
								<td colspan="2" class="hidden-xs"></td>
								<td class="hidden-xs text-center"><strong>${cart.id}</strong></td>
								<td><a
									href="${pageContext.request.contextPath}/CheckOut" 
									class="btn btn-success btn-block">Checkout <i
										class="fa fa-angle-right"></i></a></td>
							</tr>
						</tfoot>

 </table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>


</body>
</html>