<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@ page isELIgnored="false"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products Details</title>

<style>

  .prod
  {
   padding-top:50px
  }
  
 

.col-item {
  border: 1px solid #E1E1E1;
  background: #FFF;
  margin-bottom:12px;
}

.col-item .info {
  padding: 10px;
  margin-top: 1px;
}
.col-item .price-details {
  width: 100%;
  margin-top: 5px;
}
.col-item .price-details h1 {
  font-size: 14px;
  line-height: 20px;
  margin: 0;
  float:left;
}
.col-item .price-details .details {
  margin-bottom: 0px;
  font-size:12px;
}
.col-item .price-details span {
  float:right;
}
.col-item .price-details .price-new {
  font-size:16px;
}


  </style>



</head>





<body>



<h3>Shirts</h3>
<div class="prod">
<div class="container">
	<div class="row">
      	
    
        <div class="col-sm-3">
      
        <c:forEach var="product" items="${prolist}">
        	<article class="col-item">
        		
        		
        		
        		
        		
      	 <a href="<c:url value="/productDescription/${product.proid}"/>">
      	  <img src="${pageContext.request.contextPath}/Images/${product.proid}.jpg" height="100px" width="100px" 
        	class="img-responsive" alt="Product Image" />
            </a>
        		
        		<div class="info">
        			<div class="row">
        				<div class="price-details col-md-6">
        					<p class="details">
        						${product.description}
        					</p>
        					<h1>${product.proname}</h1>
        					<span class="price-new"> <i class="fa fa-inr"></i>${product.price}</span>
        				</div>
        			</div>
        			
        		</div>
        	</article>
        	</c:forEach>
        	
        </div>
	</div>
</div>
</div>

<%-- <table>
<tbody>
<c:forEach var="product" items="${prolist}">
									
										<tr>
										<td>${product.productName}</td>
										
										
										<td>${product.productPrice}</td>	
																			
										
										<td>
										 <img src="<c:url value="/resources/images/${product.id}.png"/>" height="400px" width="400px"/>
										
									
										
										 <img src="${pageContext.request.contextPath}/resources/images/${product.id}.png" height="400px" width="400px">
										
										 </td>
										 </tr>
									
								</c:forEach>


</tbody>

</table> --%>

</body>
</html>