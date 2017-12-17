<div class="col-md-9 inactivePanel" id="panelViewFaculty">
	<div id="subcontainer">
		<div class="panel panel-default">
			<div class="panel-heading clickedPanel-color">
				<h3 class="panel-title">
					<span><i class="fa fa-user"></i></span> View Faculty
				</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-3 form-group">
						<label for="loadAYDropDown">Academic Year</label> 
						<select	class="form-control" id="loadAYDropDown" onchange="getValue(this)">
							<option selected>All</option>
						</select>
					</div>
					<div class="col-md-3 form-group">
					</div>
					<div class="col-md-3 form-group">
					</div>
					<div class="col-md-3 form-group">
					</div>
				</div>
				<br>
				<table id="tableFacultyLoad" class="table table-striped table-hover header-fixed header-fixed-facultylistview">  
					<thead id="tableFacultyLoadHeaders">
						<tr>
							<th>Name</th>
							<th>Total Load</th>
							<th>Deloading</th>
							<th>Faculty Type</th>
							<!-- put space para di masira yung header na fixed -->
							<th>Leave Type</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>