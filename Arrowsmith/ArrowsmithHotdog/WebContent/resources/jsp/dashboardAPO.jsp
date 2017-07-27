<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Arrowsmith</title>
		<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="resources/css/dashboardAPOStyle.css" rel="stylesheet">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

</head>
<body>
	
	<jsp:include page="dashboardAPONavBar.jsp"/>
	<div id="parallaxText">DE LA SALLE UNIVERSITY</div>
	<div class="parallax-window" data-parallax="scroll" data-image-src="resources/images/dashboard_parallax.jpg"></div>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="dashboardAPOSideBar.jsp"/>
			<jsp:include page="dashboardAPOBuildingsAndRooms.jsp"/>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="resources/javascript/bootstrap.min.js"></script>
  	<script src="resources/javascript/parallax.min.js"></script>
  	<script src="resources/javascript/dashboardAPO.js"></script>
   	<script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
   	<script>
   		//adds shrinking effect and color effect when scrolled down
	   	$(document).ready(function() {
	   		$(window).scroll(function() {
	   	  	if($(document).scrollTop() > 0) {
	   	    	$('#nav').addClass('shrink');
	   	    	$('#navbar').addClass('shrink');
	   	    }
	   	    else {
	   	    	$('#nav').removeClass('shrink');
	   	    	$('#navbar').removeClass('shrink');
	   	    }
	   	  });
	   	});
   		
   		jQuery(window).trigger('resize').trigger('scroll'); //add in parallax fix
   	</script>
</body>
</html>