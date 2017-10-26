<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
/* .carou{
max-height: 200px !important;
 position: absolute;


  max-height: 800px;
  width: auto;
}
 */
.carou{

    height: 650px;
    width: 100%;
    object-fit: cover;  }

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>

  
  
  <div class="navbar">
  
<ul class="nav navbar-nav navbar-right">
  <li></li>
    <li></li>
      <li></li>
        <li></li>
  
  </ul>
  </div>
    <!-- inline css -->
    <div class="carou">

  <div id="myCarousel" class="carousel slide" data-ride="carousel" >
  
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="Images/img6.jpg" alt="Lights" class = "thumbnail" >
      </div>

      <div class="item">
        <img src="Images/img7.jpg" alt="City" class = "thumbnail" >
      </div>   
      
      <div class="item">
        <img src="Images/img8.jpg" alt="City" class = "thumbnail" >
      </div>   
    </div>
  
</div>
 <!-- 
   <div>
  <img src="Images/img-3.jpg" class="img-circle" alt="Music" width="304" height="236"> 
     </div>
      -->
     <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
     </div>

</body>
</html>