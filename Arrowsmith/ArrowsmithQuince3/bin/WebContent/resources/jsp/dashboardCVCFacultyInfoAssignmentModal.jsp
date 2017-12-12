<form id="">
    <input type="hidden" class="assignFacultyOfferingIDDump" name="assignFacultyOfferingIDDump" id="assignFacultyOfferingIDDumpViaFacultyInfo" value="">
   
</form>

	<label style="display:none" id="assignFacultyViaInfoFacultyId" value="">  </label>
    <label style="display:none" id="assignFacultyViaInfoStartYear" value=""> </label>
    <label style="display:none" id="assignFacultyViaInfoEndYear" value=""> </label>
    <label style="display:none" id="assignFacultyViaInfoTerm" value=""> </label>

<!-- Screen may move to the right or left after modal open up. Explanation: This is because your scrollbar disappears to prevent user scrolling on the main window -->
<div class="modal fade" id="facultyInfoAssignmentModal" role="dialog">
	<div class="modal-dialog-lg">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" onclick="exitFacultyInfoAssignmentModal()">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="facultyAssignmentModalTitle">Faculty
					Assignment</h4>
			</div>

			<div class="row" id="FAModalBody">
				<!--  <div class="col-md-8">  -->
					<div class="modal-body" id="facultyAssignmentModalBody">

						<div class="col-md-12 form-group">
							<label for="searchOffering">Search Course</label> <input
								type="text" class="form-control"
								id="searchOfferingFAViaFacultyInfo"
								placeholder="Search Course...">
								<br>
								

							<button id="btnFacultyInfoAssign" style="display: none"
								onclick="assignThisFacultyToCourseViaFacultyInfo()" class = "btn btn-green">
								Assign to Course</button>
								<br>

						</div>

					<!--  <div class="row" id="divModalFAOfferings">  -->
					<div class="col-md-12 form-group" id="divModalFAOfferings">
						<table id="tableModalFAOfferingListViaFacultyInfo"
							class="table table-striped table-hover header-fixed  header-fixed-offerringlistFAmodalviafacultyinfo">
							<thead id="tableModalFAOfferingListHeadersViaFacultyInfo">
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

					
				<!-- </div>  -->


			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					onclick="exitFacultyInfoAssignmentModal()">Close</button>
			</div>

		</div>



	</div>
</div>
</div>