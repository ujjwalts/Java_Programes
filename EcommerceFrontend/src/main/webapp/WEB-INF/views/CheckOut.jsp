<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
             <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page isELIgnored="false" %>
<jsp:include page="header.jsp"></jsp:include>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class='container'>
    <div class='row' style='padding-top:25px; padding-bottom:25px;'>
        <div class='col-md-12'>
            <div id='mainContentWrapper'>
                <div class="col-md-8 col-md-offset-2">
                    <h2 style="text-align: center;">
                        Review Your Order & Complete Checkout
                    </h2>
                    <hr/>
                    <a href="${pageContext.request.contextPath}/" class="btn btn-info" style="width: 100%;">Add More Products & Services</a>
                    <hr/>
                    <div class="shopping_cart">
                    
                    <!-- user view starts here -->
                          <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div style="text-align: center;"><a data-toggle="collapse"
                                                                            data-parent="#accordion"
                                                                            href="#collapseuser"
                                                                            class=" btn   btn-success" id="payInfo"
                                                                            style="width:100%;display: none;" onclick="$(this).fadeOut();  
                   document.getElementById('collapseThree').scrollIntoView()">Enter Payment Information �</a>
                                        </div>
                                    </h4>
                                </div>
                            </div>
                             <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                            <b>User Information</b>
                                        </a>
                                    </h4>
                                </div>
                              
                                <div id="collapseOne" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <span class='payment-errors'></span>
                                         <div class="form-group">
                                         <label class="col-md-4 control-label" for="textinput">User Name:</label> ${us.first_name} 
                                         </div>
                                          <div class="form-group">
                                         <label class="col-md-4 control-label" for="textinput">Phone no. :</label> ${us.phone} 
                                         </div>
                                         <div class="form-group">
                                         <label class="col-md-4 control-label" for="textinput">Address :</label> ${us.address} 
                                         </div>
                                        <button type="submit" class="btn btn-success btn-lg" style="width:100%;">change                                          
                                        </button>
                                        <br/>
                                       
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                            <!-- order summary starts here -->
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Review
                                                Your Order</a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <div class="items">
                                                <div class="col-md-9">
                                                    <table class="table table-striped">
                          
                          
                                                     <tr>
                         
      <c:set var="calc" value="0"></c:set> 
     <c:forEach var="c" items="${cartdetails}">    
     <c:set var="calc" value="${calc+c.totalItems*c.price}"></c:set>
     </c:forEach>  
      <c:forEach var="c" items="${cartdetails}">
	<div class="row">

						<tr>
							<td data-th="Product">


								<div class="col-sm-2 ">
									<img
										src="${pageContext.request.contextPath}/images/${c.proid}.png" height="100px" width="100px"  />
								</div>
								<div class="col-sm-8">
									<h3>${c.cartProductName}</h3>
									<p>${c.cartProductDescription}</p>
								</div>

							</td>
							<td data-th="Price">${c.price}</td>
							<td data-th="Quantity">${c.totalItems}</td>
							<td data-th="Subtotal" class="text-center">${c.totalItems*c.price}</td>
							

						</tr>

					</div>
				</c:forEach>
                                                        </tr>
                                                        
                                                    </table>
                                                </div>
                                                <div class="col-md-3">
                                                    <div style="text-align: center;">
                                                        <h3>Order Total</h3>
                                                        <h3><span style="color:green;"> Rs. ${calc}</span></h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                            <!--  payment infoo starts here -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div style="text-align: center;"><a data-toggle="collapse"
                                                                            data-parent="#accordion"
                                                                            href="#collapseThree"
                                                                            class=" btn   btn-success" id="payInfo"
                                                                            style="width:100%;display: none;" onclick="$(this).fadeOut();  
                   document.getElementById('collapseThree').scrollIntoView()">Enter Payment Information �</a>
                                        </div>
                                    </h4>
                                </div>
                            </div>
                           <form   action="${pageContext.request.contextPath}/invoice" method="post">                            
                           <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                            <b>Payment Information</b>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <span class='payment-errors'></span>
                                        <fieldset>
                                            <legend>What method would you like to pay with today?</legend>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label" for="card-holder-name">Payment Type</label>
                                                <div class="col-sm-9">
                                                <select name="paymentType" id="paymentType">
                                                <option label="--Select--" /> 
                                                  
                                                <option value="CreditCard">Credit Card</option>
                                                <option value="DeditCard">Debit Card</option>
                                                
                                                  </select>
                                                 
                                                </div>
                                            </div>
                                           <input type="hidden" name="total" value="${calc}">
                                               
                                                <div class="form-group">
                                                    <div class="col-sm-offset-3 col-sm-9">
                                                    </div>
                                                </div>
                                        </fieldset>
                                        <button type="submit" class="btn btn-success btn-lg" style="width:100%;">Pay
                                            Now
                                        </button>
                                        <br/>
                                       
                                    </div>
                                </div>
                            </div>
                            </form>
                           
                    </div>
                </div>
                
            </div>
        </div>
    </div>

</div>

</body>
</html>