<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<%@ page isELIgnored="false"%>
	<jsp:include page="header.jsp"></jsp:include>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.invoice{
padding-top:150px;
}
</style>
</head>
<body>
<div class="invoice">

<div class="container">
<div class="row">
	 <br>
            <div class="col-md-12">
                <div class="col-md-4 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                    <!--REVIEW ORDER-->
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <h4>Review Order</h4>
                        </div>
                        <div class="panel-body">
                        <div  >
                               
                                <div class="col-md-12">
                                  
                                <div class="col-md-12">
                                    <small>Shipping</small>
                                    <div class="pull-right"><span>-</span></div>
                                    <hr>
                                </div>
                                <div class="col-md-12">
                                    <strong>Order Total</strong>
                                    <div class="pull-right"><span>${tbl.totalamt}</span></div>
                                    <hr>
                                </div>
                                
                                 <tbody>
                                      
				<c:forEach var="c" items="${Invoice}">
					<div class="row">
</div>
				
						<tr>
							<td data-th="Product">


								   
      <div class="item">
        <img src="Images/bill.png" alt="bill" class = "thumbnail" width="100px" height="150px" >
      </div>   
    </div>
								<div class="col-sm-10">
									<h3>${c.cartProductName}</h3>
									<p>${c.cartProductDescription}</p>
								</div>

							</td>
							
							<td data-th="Price">${c.price}</td>
							<td data-th="Quantity">${c.totalItems}</td>
							<td data-th="Subtotal" class="text-center"></td>
							
							<td class="text-center"></td>
									</tr>
</c:forEach>
						
</tbody>
                                
                                  <a href="${pageContext.request.contextPath}/Thankyou"
                                    class="btn btn-primary btn-block">Continue</a>
                                
                               
                               
                               
                               
                               
                               
                               
                               
                               
                               
                                
                        </div>
                        
                    </div>
                    </div>
                    </div> </div>
                   </div>


</div>
</div>
</body>
</html>
