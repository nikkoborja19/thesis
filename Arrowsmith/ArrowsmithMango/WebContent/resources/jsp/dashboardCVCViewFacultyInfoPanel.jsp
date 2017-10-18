<label style="display:none" id="offeringIdViaFacultyView" value="">  </label>

<label style="display:none" id="facultyIdViaFacultyView" value="">  </label>
<label style="display:none" id="startYearViaFacultyView" value="">  </label>
<label style="display:none" id="endYearViaFacultyView" value="">  </label>
<label style="display:none" id="termViaFacultyView" value="">  </label>

<div class="col-md-9 inactivePanel" id="panelViewFacultyInfo">
	<div id="subcontainer">
		<div class="panel panel-default">
			<div class="panel-heading clickedPanel-color">
				<h3 class="panel-title">
					<span><i class="fa fa-user"></i></span> View Faculty Information
				</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-3 form-group">
						<h1 id="faculty_name"> Faculty Name</h1> <br>
						<label> Current Number of Load: </label>
						<label id="current_load"> - </label> 
						<button id="btnAssignFaculty" onclick ="" class ="btn"> Assign Faculty</button>
						
						
						<!--  Hidden Labels for the faculty assignment modal -->
						<label id="facultyId" style="display:none"> a </label>
						<label id="term" style="display:none"> a </label>
						<label id="start_year" style="display:none"> a </label>
						<label id="end_year" style="display:none"> a </label>
					</div>
					<div class="col-md-3 form-group">
					</div>
					<div class="col-md-3 form-group">
					</div>
					<div class="col-md-3 form-group">
					</div>
				</div>
				<br>
				
				<h3> Current load</h3> 
				<button id="btnFacultyInfoRemoveLoad" style ="display:none" onclick ="removeLoadFromThisFaculty()" class ="btn btn-red" > Remove Selected Load</button>
				<table id="tableCurrentFacultyLoad" class="table table-striped table-hover header-fixed header-fixed-facultycurrentload">  
					<thead id="tableFacultyCurrentLoadHeaders"> 
						<tr>
							<th>Course Code</th>
							<th>Term</th>
							<th>School Year</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>