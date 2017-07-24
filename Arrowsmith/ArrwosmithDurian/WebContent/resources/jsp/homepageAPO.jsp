<html>
    <head>
    	<META HTTP-EQUIV="refresh" CONTENT="<%= session.getMaxInactiveInterval() %>; URL=/logout">
        <title>APO Homepage</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link type="text/css" href="resources/css/homepageAPOStyle.css" rel="stylesheet" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
		<script>
			$(document).ready(function(){
				$(".bottomAligned").css("margin-top", ($(".wrapperCenter").height()-$(".bottomAligned").height())+"px");
			});
			
		</script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class = "container">            
            <div id="apo-functionalities-div" class="row">
				<div id="view-offerings-div" class="col-sm-3 well wrapperCenter">
				    <a href="manageCourse"><button id="viewOfferingButton" type="button" class="btn btn-default bottomAligned">View Offerings</button></a>
				</div>
				<div id="add-course-div" class="col-sm-3 well wrapperCenter">
				    <a href="addCourse"><button id="addCourseButton" type="button" class="btn btn-default bottomAligned">Add Course</button></a>
				</div>
				<div id="room-assignment-div" class = "col-sm-3 well wrapperCenter">
				    <a href="roomAssign"><button id="roomAssignButton" type="button" class="btn btn-default bottomAligned">Room Assignment</button></a>
				</div>
				<div id="publish-div" class = "col-sm-3 well wrapperCenter">
				    <button id="publishButton" type="button" class="btn btn-default bottomAligned">Publish</button>
				</div>
            </div>

        </div>

        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script> <!-- should be first because angularjs properties would not be loaded if this is below -->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.7/angular-resource.min.js"></script>-->

        <!-- AngularJS Controller scripts -->
        <script type="text/javascript" src="resources/javascript/loginController.js"></script>

        <jsp:include page="footer.jsp"/>
    </body>
</html>