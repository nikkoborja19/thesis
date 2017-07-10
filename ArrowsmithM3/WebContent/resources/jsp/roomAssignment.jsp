<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link href="resources/css/bootstrap.min.css" rel="stylesheet">
		<style>
		  #dividerOnRight{
		  	border-right: 1px solid #bbb;
		  }		
		</style>
		<title>Room Assignment</title>
	</head>
	<body>
	<br>
		<div class="container">	
			<div class="row">
				<div class="col-sm-7">		
					<div class="row">
						<div class="col-sm-3"></div>
						<div class="col-sm-6"></div>
						<div class="col-sm-3"><input type="text" class="form-control" id="search" placeholder="Search" klmname = "searchForm"></div>
					</div>
					<hr>
					<div class="table-responsive">          
					  <table class="table" name = "table1">
					    <thead>
					      <tr>
					        <th>Course Code</th>
					        <th>Section</th>
					        <th>Day</th>
					        <th>Time Start</th>
					        <th>Time End</th>
					        <th>Room</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr class="success">
					        <td><a href="#">COMPRO2</a></td>
					        <td>S17A</td>
					        <td>MW</td>
					        <td>1100</td>
					        <td>1230</td>
					        <td>G301</td>
					      </tr>
					     <tr class="success">
					        <td><a href="#">COMPRO2</a></td>
					        <td>S17B</td>
					        <td>MW</td>
					        <td>1100</td>
					        <td>1230</td>
					        <td>G302</td>
					      </tr>
					      <tr class="success">
					        <td><a href="#">DISCTRU</a></td>
					        <td>S17</td>
					        <td>TH</td>
					        <td>1245</td>
					        <td>1415</td>
					        <td>G205</td>
					      </tr>
					      <tr class="success">
					        <td><a href="#">CCSTRIG</a></td>
					        <td>S11</td>
					        <td>TH</td>
					        <td>0915</td>
					        <td>1045</td>
					        <td>G203</td>
					      </tr>
					    </tbody>
					  </table>
					  </div>
				</div>
				
				<div class="col-sm-5">
					<div style="min-height: 500px;background-color: #2a9c2f;color: white;padding:10px;border-radius: 10px;">
						<div class="row">
							<div class="col-sm-3"> Time Start:<input type="text" class="form-control" id="search" placeholder="Search" klmname = "searchForm"></div>
							<div class="col-sm-3"> Time End:<input type="text" class="form-control" id="search" placeholder="Search" klmname = "searchForm"></div>
						</div>
						<br>
						<div style="height: 500px;background-color:#67ed6d;padding: 10px;border: 3px solid #195c1c">
							<div style="background-color: #c2ffc5;height: 100%;"></div>
						</div> 
					</div>
				</div>
			</div>
		</div>
	</body>
</html>