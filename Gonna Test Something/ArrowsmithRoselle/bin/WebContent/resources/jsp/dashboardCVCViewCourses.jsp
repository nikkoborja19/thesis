<div class="col-md-9 inactivePanel" id="panelCVCViewCourses">
	<div id="subcontainer">
		<div class="panel panel-default">
			<div class="panel-heading clickedPanel-color">
				<h3 class="panel-title">
					<span><i class="fa fa-user"></i></span> View Offerings
				</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-3 form-group">
						<label for="loadAYDropDown">Academic Year</label> 
						<select	class="form-control" id="loadAYDropDownCVCOfferings" onchange="getValue2(this)">
							<option selected>-</option>
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
				
			
				<!-- < div class="row" id="divModalFAOfferings">  -->
				<div class="row" id="divCVCOfferingsList">
					<table id="tableCVCOfferingList"
						class="table table-striped table-hover header-fixed  header-fixed-cvcofferingslist">
						<thead id="tableCVCOfferingsListHeaders">
							<tr>
								<th><br>Batch</th>
								<th><br>Course</th>
								<th><br>Section</th>
								<th><br>Day</th>
								<th>Begin<br>Time
								</th>
								<th>End<br>Time
								</th>
								<th><br>Room</th>
								<th><br>Faculty</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
	</div>
</div>