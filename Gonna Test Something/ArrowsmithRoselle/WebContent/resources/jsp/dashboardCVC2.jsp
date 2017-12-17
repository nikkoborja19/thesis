<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Arrowsmith</title>
		<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="resources/css/dashboardCVCStyle.css" rel="stylesheet">
	    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/css/ionicons.min.css">
		<link href="resources/css/bootstrap-toggle.min.css" rel="stylesheet">

</head>
<body>
	<form id="">
	    <input type="hidden" class="userIDDump" name="userIDDump" id="userIDDump" value="${user.userId}">
	    <input type="hidden" class="userTypeDump" name="userTypeDump" id="userTypeDump" value="${user.userType}">
	    <input type="hidden" class="collegeIDDump" name="collegeIDDump" id="collegeIDDump" value="${user.collegeID}">
	    <input type="hidden" class="deptIDDump" name="deptIDDump" id="deptIDDump" value="${user.deptID}">
    </form>
    
	<jsp:include page="dashboardNavBar.jsp"/>
	<div id="parallaxText">DE LA SALLE UNIVERSITY</div>
	<div class="parallax-window" data-parallax="scroll" data-image-src="resources/images/dashboard_parallax.jpg"></div>
	<div class="container-fluid">
		<jsp:include page="dashboardCVC2SideBar.jsp"/>
		<jsp:include page="dashboardCVC2ViewOfferingsPanel.jsp"/>
		<jsp:include page="dashboardCVC2ViewFacultyPanel.jsp"/>
		<jsp:include page="dashboardCVC2AddNewCoursePanel.jsp"/>
		<jsp:include page="dashboardCVC2AddNewFacultyPanel.jsp"/>
		<jsp:include page="dashboardDeloadingFacultyList.jsp"/>
		<jsp:include page="dashboardAddNewDeloading.jsp"/>
	</div>
	<jsp:include page="footer.jsp"/>
	<!-- MODALS -->
		<jsp:include page="dashboardCVC2ViewOfferingsModal.jsp"/>
		<jsp:include page="dashboardCVC2FacultyAssignmentModal.jsp"/>
		<jsp:include page="dashboardCVC2ViewFacultyLoadModal.jsp"/>
		<jsp:include page="dashboardCVCDeloadingModal.jsp"/>
		<jsp:include page="dashboardDeloadingFacultyListModal.jsp"/>
		<jsp:include page="loadingModal.jsp"/>
		<jsp:include page="dashboardCVCDeloadingModal.jsp"/>
	<!-- MODALS -->
	
	<script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
  	<script src="resources/js/parallax.min.js"></script>
  	<script src="resources/js/togglesListeners.js"></script>
   	<script src="resources/js/bootstrap-toggle.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-ui.min.js"></script>
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
   	<script src="resources/js/dashboardCVC.js"></script>
  	<script src="resources/js/classes.js"></script>
</body>
</html>