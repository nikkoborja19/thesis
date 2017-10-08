<form id="">
    <input type="hidden" class="assignFacultyOfferingIDDump" name="assignFacultyOfferingIDDump" id="assignFacultyOfferingIDDump" value="">
    <input type="hidden" class="assignFacultyFacultyIDDump" name="assignFacultyFacultyIDDump" id="assignFacultyFacultyIDDump" value="">
    <input type="hidden" class="assignFacultyCurrentAYDump" name="assignFacultyCurrentAYDump" id="assignFacultyCurrentAYDump" value="">
</form>

<!-- Screen may move to the right or left after modal open up. Explanation: This is because your scrollbar disappears to prevent user scrolling on the main window -->
<div class="modal fade" id="facultyAssignmentModal" role="dialog" >
  <div class="modal-dialog-lg">
    <div class="modal-content">
      
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="exitFacultyAssignmentModal()"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="facultyAssignmentModalTitle">Faculty Assignment</h4>
      </div>
      
      <div class="row" id="FAModalBody">
      	<div class="col-md-8">
	      <div class="modal-body" id="facultyAssignmentModalBody">
	      
	        <div class="col-md-12 form-group">
	        	<label for="searchOffering">Search Course</label>
	          	<input type="text" class="form-control" id="searchOfferingFA" placeholder="Search Course...">
	        </div>
	        
	      </div>
	      
	      <div class="row" id="divModalFAOfferings">
	      	<table id="tableModalFAOfferingList" class="table table-striped table-hover header-fixed  header-fixed-offerringlistFAmodal">
	      	<thead id="tableModalFAOfferingListHeaders">
		         <tr>
		           <th> <br>Batch</th>
		           <th> <br>Course</th>
		           <th> <br>Section</th>
		           <th> <br>Day</th>
		           <th>Begin<br>Time</th>
		           <th>End<br>Time</th>
		           <th> <br>Room</th>
		           <th> <br>Faculty</th>
		         </tr>
	         </thead>
	         <tbody>
	         </tbody>
	      </table>
	      </div>
	    </div>
	    
	    <div class="col-md-4">
	    	<div class="modal-body" id="facultyAssignmentModalBody">
	      
	        <div class="col-md-7 form-group">
	        	<label for="searchFaculty">Search Faculty</label>
	          	<input type="text" class="form-control" id="searchFacultyFA" placeholder="Search Faculty...">
	        </div>
	        <div class="col-md-5 form-group">
	          <label for="roomType">Faculty Type</label>
	            <select class="form-control" id="facultyTypeFADropdown" onChange="">
				    <option selected>All</option>
				</select>
       		</div>
	        <div class="col-md-12 form-group">
	          <label for="collegeType">College</label>
	            <select class="form-control" id="collegeFADropdown" onChange="">
				    <option selected>All</option>
				</select>
       		</div>
       		<div class="col-md-12 form-group">
	          <label for="departmentType">Department</label>
	            <select class="form-control" id="departmentFADropdown" onChange="">
				    <option selected>All</option>
				</select>
       		</div>
	      </div>
	      
	      <div class="row" id="divModalFAFaculty">
	      	<table id="tableModalFAFacultyList" class="table table-striped table-hover header-fixed  header-fixed-facultylistFAmodal">
	      	<thead id="tableModalFAFacultyListHeaders">
		         <tr>
		           <th> <br>Faculty</th>
		           <th>Faculty<br>Type</th>
		           <th> <br>College</th>
		           <th> <br>Dept</th>
		           <th>Current<br>Load</th>
		         </tr>
	         </thead>
	         <tbody>
	         </tbody>
	      </table>
	      </div>
	    </div>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="exitFacultyAssignmentModal()">Close</button>
      </div>
      
    </div>
  </div>
</div>