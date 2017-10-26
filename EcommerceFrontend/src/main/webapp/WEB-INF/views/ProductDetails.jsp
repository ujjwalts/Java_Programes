<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
	<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products Details</title>

<style>
.container
{
padding:top:50px;
}
.dat
{
padding:120px
}
.btn-minus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-right:0;}
.btn-plus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-left:0;}
div.section > div {width:100%;display:inline-flex;}
div.section > div > input {margin:0;padding-left:5px;font-size:10px;padding-right:5px;max-width:18%;text-align:center;}
.title-attr{margin-top:0;margin-bottom:0;color:black;}

</style>


</head>
<body>
<div class="dat">
<div class="container">

<table>
<tr>
	
									<td>${prodlist.proname}</td>
										<td>${prodlist.description}</td>
									
										<td>
	 <img src="${pageContext.request.contextPath}/Images/${prodlist.proid}.jpg" height="400px" width="400px" class="img-responsive" alt="Product Image" />
	 </td>
									
					
								</tr>
</table>
                
  <form method="post" action="${pageContext.request.contextPath}/AddCart/${prodlist.proid}" >
<div class="section" style="padding-bottom:20px;">
                        <h6 class="title-attr"><small>Select Quantity</small></h6>                    
                        <div>
                            <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                            <input value="0" name="stock"/>
                            <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                        </div>
                    </div>      
                    <input type="submit" value="AddToCart" />        
</form>

	<%-- <section class="main-content">
	<div class="row">
		<div class="span9">
			<div class="row">
				<div class="span4">
					<a href="themes/images/ladies/1.jpg" class="thumbnail"
						data-fancybox-group="group1" title="Description 1"><img alt=""
						src="themes/images/ladies/1.jpg"></a>
					<ul class="thumbnails small">
						<li class="span1"><a href="themes/images/ladies/2.jpg"
							class="thumbnail" data-fancybox-group="group1"
							title="Description 2"><img src="themes/images/ladies/2.jpg"
								alt=""></a></li>
						<li class="span1"><a href="themes/images/ladies/3.jpg"
							class="thumbnail" data-fancybox-group="group1"
							title="Description 3"><img src="themes/images/ladies/3.jpg"
								alt=""></a></li>
						<li class="span1"><a href="themes/images/ladies/4.jpg"
							class="thumbnail" data-fancybox-group="group1"
							title="Description 4"><img src="themes/images/ladies/4.jpg"
								alt=""></a></li>
						<li class="span1"><a href="themes/images/ladies/5.jpg"
							class="thumbnail" data-fancybox-group="group1"
							title="Description 5"><img src="themes/images/ladies/5.jpg"
								alt=""></a></li>
					</ul>
				</div>
				<div class="span5">
					<address>
						<strong>Brand:</strong> <span>Apple</span><br> <strong>Product
							Code:</strong> <span>Product 14</span><br> <strong>Reward
							Points:</strong> <span>0</span><br> <strong>Availability:</strong> <span>Out
							Of Stock</span><br>
					</address>
					<h4>
						<strong>Price: $587.50</strong>
					</h4>
				</div>
				<div class="span5">
					<form class="form-inline">
						<label class="checkbox"> <input type="checkbox" value="">
							Option one is this and that
						</label> <br /> <label class="checkbox"> <input type="checkbox"
							value=""> Be sure to include why it's great
						</label>
						<p>&nbsp;</p>
						<label>Qty:</label> <input type="text" class="span1"
							placeholder="1">
						<button class="btn btn-inverse" type="submit">Add to cart</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="span9">
					<ul class="nav nav-tabs" id="myTab">
						<li class="active"><a href="#home">Description</a></li>
						<li class=""><a href="#profile">Additional Information</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="home">Sed ut perspiciatis
							unde omnis iste natus error sit voluptatem accusantium doloremque
							laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore
							veritatis et quasi architecto beatae vitae dicta sunt explicabo.
							Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit
							aut fugit, sed quia consequuntur magni dolores eos qui ratione
							voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem
							ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia
							non numquam eius modi tempora incidunt ut labore et dolore magnam
							aliquam quaerat voluptatem</div>
						<div class="tab-pane" id="profile">
							<table class="table table-striped shop_attributes">
								<tbody>
									<tr class="">
										<th>Size</th>
										<td>Large, Medium, Small, X-Large</td>
									</tr>
									<tr class="alt">
										<th>Colour</th>
										<td>Orange, Yellow</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
 
	</section>
	--%>
	</div>
	</div>
<script type="text/javascript">
$(document).ready(function(){

    $(".btn-minus").on("click",function(){
        var now = $(".section > div > input").val();
        
        if ($.isNumeric(now)){
            if (parseInt(now) -1 > 0){ now--;}
            $(".section > div > input").val(now);
        }else{
            $(".section > div > input").val("1");
        }
    })            
    $(".btn-plus").on("click",function(){
        var now = $(".section > div > input").val();
       var limit=${prodlist.stock}
        if ($.isNumeric(now) && now<limit){
            $(".section > div > input").val(parseInt(now)+1);
        }else{
        	alert("oops!out of stock!! Please take a look at other products")
            $(".section > div > input").val("0");
        }
    })                        
})
</script>



</body>
</html>