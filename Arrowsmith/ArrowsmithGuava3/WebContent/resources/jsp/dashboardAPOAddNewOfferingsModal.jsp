<form id="">
    <input type="hidden" class="addNewOfferingsOfferingIDDump" name="addNewOfferingsOfferingIDDump" id="addNewOfferingsOfferingIDDump" value="">
    <input type="hidden" class="addNewOfferingsCurrentAYDump" name="addNewOfferingsCurrentAYDump" id="addNewOfferingsCurrentAYDump" value="">
</form>

<!-- Screen may move to the right or left after modal open up. Explanation: This is because your scrollbar disappears to prevent user scrolling on the main window -->
<div class="modal fade" id="addNewOfferingsModal" role="dialog" >
  <div class="modal-dialog-lg">
    <div class="modal-content">
      
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="exitAddNewOfferingsModal()"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="addNewOfferingsModalTitle">Add New Offerings</h4>
      </div>
      
      	<div class="col-md-12">
      	<br>
      	<div class="modal-body col-md-12">
	      	<div class="modal-body col-md-7" id="divModalANOInfoandSearch">
		      	<div class ="modal-body col-md-12 " id="divModalANOAYInfo">
		      		<form action="loginSubmit" class="form-box" role="form">
			      	<div class="col-md-3 form-group">
				       <label for="textStartYearANO">New Offering Start Year</label>
				       <input type="number" required class="form-control" id="textStartYearANO" placeholder="Start Year">
				    </div>
				    <div class="col-md-3 form-group">
				       <label for="textEndYearANO">New Offering End Year</label>
				       <input type="number" required class="form-control" id="textEndYearANO" placeholder="End Year">
				    </div>
				    <div class="col-md-3 form-group">
				       <label for="textTermANO">New Offering Term</label>
				       <input type="number" required class="form-control" id="textTermANO" placeholder="Term">
				    </div>
				    </form>
			      </div>
			      				      
			      <div class="modal-body col-md-12" id="searchFlowchartModalBody">
			      	<div class ="col-md-12">
				        <div class="col-md-3 form-group">
				          <label for="degreeProgramANODropdown">Degree Program</label>
				            <select class="form-control" id="degreeProgramANODropdown" onChange="">
							    <option selected>All</option>
							</select>
			       		</div>
			       		<div class="col-md-2 form-group">
				          <label for="batchANODropdown">Batch</label>
				            <select class="form-control" id="batchANODropdown" onChange="">
							    <option selected>All</option>
							</select>
			       		</div>
			       		<div class="col-md-3 form-group">
				          <label for="ayANODropdown">Academic Year</label>
				            <select class="form-control" id="ayANODropdown" onChange="">
							    <option selected>All</option>
							</select>
			       		</div>
			       		<div class="col-md-4 form-group">
				          <label for="termANORadioButtons">Term</label>
				          <form id="termFormANO">
						    <label class="radio-inline"><input type="radio" checked name="optradio" id="radio1ANO" value="1">1</label>
						    <label class="radio-inline"><input type="radio" name="optradio" id="radio2ANO" value="2">2</label>
						    <label class="radio-inline"><input type="radio" name="optradio" id="radio3ANO" value="3">3</label>
						  </form>
			       		</div>
			       		<!-- div class="col-md-4 form-group">
				          <label for="termANODropdown">Batch</label>
				            <select class="form-control" id="batchANODropdown" onChange="">
							    <option selected>All</option>
							</select>
			       		</div -->
		       		</div>
		       		<div class ="col-md-12">
		       			<div class="col-md-4 form-group">
			       		</div>
		       			<div class="col-md-4 form-group">
		       				<a class="btn btn-default" type="button" onclick="updateAddNewOfferingsFlowchartCourseList()" id="searchFlowchartANOButton"><span><i class="fa fa-search"></i></span> Search Flowchart</a>
			       		</div>
		       		</div>
		       		<div class="row col-md-12" id="divModalANOFlowchartCourses">
					      	<table id="tableModalANOFlowchartCoursesList" class="table table-striped table-hover header-fixed  header-fixed-flowchartcourseslistANOmodal">
					      	<thead id="tableModalANOFlowchartCoursesListHeaders">
						         <tr>
						           <th>Course</th>
						           <th>Name</th> 
						           <th>Add</th>
						         </tr>
					         </thead>
					         <tbody>
					         </tbody>
					      </table>
					 </div>
			      </div>
		      </div>
	      
		      <div class="modal-body col-md-5" id="searchCourseModalBody">
		      	<div class ="col-md-12">
			        <div class="col-md-12 form-group">
			          <label for="searchCourseANO">Search Course</label>
			            <input type="text" class="form-control" id="searchCourseANO" placeholder="Type something...">
		       		</div>
		       		<div class="col-md-12 form-group">
			          <div class="row" id="divModalANOCourses">
				      	<table id="tableModalANOCoursesList" class="table table-striped table-hover header-fixed  header-fixed-courseslistANOmodal">
				      	<thead id="tableModalANOCoursesListHeaders">
					         <tr>
					           <th>Course</th>
					           <th>Name</th> <!-- to force headers to have same width -->
					           <th>Add</th>
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
		  
	      <div class="row col-md-12" id="divModalANOOfferings">
	      	<table id="tableModalANOOfferingList" class="table table-striped table-hover header-fixed  header-fixed-offerringlistANOmodal">
	      	<thead id="tableModalANOOfferingListHeaders">
		         <tr>
		           <th> <br>Batch</th>
		           <th> <br>Course</th>
		           <th> <br>Section</th> <!-- to force headers to have same width -->
		           <th> <br>Timeslot</th>
		           <th> <br>Status</th>
		           <th colspan ="2"> <br>Remarks</th>
		           <th>Edit/<br>Delete</th>
		         </tr>
	         </thead>
	         <tbody>
	         </tbody>
	      </table>
	      </div>
	    </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="exitAddNewOfferingsModal()">Close</button>
        <button type="button" class="btn btn-success" data-dismiss="modal" onclick="addNewOfferingsToDB()">Save New Offerings</button>
      </div>
      
    </div>
  </div>
</div>