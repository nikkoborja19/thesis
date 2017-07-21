<html>
	<head>
		<title>APO Homepage</title>
		
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link type="text/css" href="resources/css/homepageAPOStyle.css" rel="stylesheet" >
		
	</head>
	<body>
<div class = "container">
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Arrowsmith</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href= "#">Home</a></li>
	        <li><a href= "#">Profile</a></li>
	        <li><a href= "#">Logout</a>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<div class="apo-functionalities-div">
		<div class = "view-offerings-add-course-div">
			<div class="view-offerings-div">
			<button type="button" class="btn btn-success">View Offerings</button>
			</div>
			<div class="add-course-div">
			<button type="button" class="btn btn-primary">Add Course</button>
			</div>
		</div>
		<div class = "room-assignment-publish-div">
			<div class = "room-assignment-div">
			<button type="button" class="btn btn-info">Room Assignment</button>
			</div>
			<div class = "publish-div">
			<button type="button" class="btn btn-warning">Publish</button>
			</div>
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
			
	</body>
</html>