
<!-- <label style="display:none" id="assignFacultyFacultyIdValue" value="">  </label>  -->



<!-- Screen may move to the right or left after modal open up. Explanation: This is because your scrollbar disappears to prevent user scrolling on the main window -->
<div class="modal fade" id="deloadingAssignModal" role="dialog" >
  <div class="modal-dialog-lg">
    <div class="modal-content">
      
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="updateFacultyLoadListInDeloading()"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="deloadingModalTitle">Faculty Deloading</h4>
      </div>

			<div class="modal-body" id="facultyDeloadingModalBody">
			
			<form class="form-vertical" onsubmit="return false;">
     	
     	<div> 
     	<!-- Deloading type dropdown list -->
     	<label class="control-label col-sm-1" for="lblDeloadingName">Type: </label>	
     	<select class="form-control" id="DeloadingDropDown">
     		<option value="DL"> Admin </option>
     		<option value="RL"> Research </option>
     		<option value="LL"> Deloading </option>
     		<option value="OL"> Other </option>
     	</select>
     	</div>
    	
    	<br>
     	<!-- Deloading Input boxes  -->
     	
			<label class="control-label col-sm-1" for="lblDeloadingName"> Deloading: </label>	
				<div class="col-sm-4">
					<input type="text" class="form-control filledOut" id="deloadingName"  placeholder="Enter Deloading Name..." required/>
				</div>
		
		
		
			<label class="control-label col-sm-1" for="lblDeloadingUnits">Units: </label>	
				<div class="col-sm-1">
					<input type="text" class="form-control filledOut" id="deloadingUnits" placeholder=" " required/>
				</div>
		
		
			<br> <br>  <br> 
			<label class="control-label col-sm-1" for="lblDeloadingStartYear">Start Year: </label>	
				<div class="col-sm-1">
					<input type="text" class="form-control filledOut" id="deloadingStartYear"  placeholder=" " required/>
				</div>
		
		
		
			<label class="control-label col-sm-1" for="lblDeloadingStartYear">End Year: </label>	
				<div class="col-sm-1">
					<input type="text" class="form-control filledOut" id="deloadingEndYear"  placeholder=" " required/>
				</div>
			<br> <br> <br> <br>
     	
     	
     	<!-- Deloading term radio buttons -->
     	<label class="control-label col-sm-4" for="lblDeloadingStartYear">Valid for Term/s: </label> <br> <br>  <br>
     	
		<label class="container">Term 1
  			<input id ="deloadingTerm1" type="checkbox">
		</label>
		
		<label class="container">Term 2
  			<input id ="deloadingTerm2" type="checkbox">
		</label>
		
		<label class="container">Term 3
  			<input id ="deloadingTerm3" type="checkbox">
		</label>

		<div style="text-align:center">  
    			<button id="btnAssignDeloading"   onclick ="" class ="btn btn-success btn-lg"> Assign Deloading</button>
		</div>  
		
		<br>
     	</form>

				
		
				

			</div>
			
		<div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="updateFacultyLoadListInDeloading()">Close</button>
     	</div>



			
      
    </div>
  </div>
</div>