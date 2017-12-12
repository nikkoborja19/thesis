
<!-- <label style="display:none" id="assignFacultyFacultyIdValue" value="">  </label>  -->



<!-- Screen may move to the right or left after modal open up. Explanation: This is because your scrollbar disappears to prevent user scrolling on the main window -->
<div class="modal fade" id="deloadingModal" role="dialog" >
  <div class="modal-dialog-lg">
    <div class="modal-content">
      
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="updateFacultyLoadListInDeloading()"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="deloadingModalTitle">Faculty Deloading</h4>
      </div>

			<div class="modal-body" id="facultyDeloadingModalBody">

				<div class="col-md-3 form-group">
					<label for="AdminLoadDropDown">Admin Load</label>
					<select class="form-control" id="AdminLoadDropDown">
						<option selected>Select</option>
					</select>
					<br>
					<button type="button" class="btn btn-default" onclick="adminDeloading()">Deload
						Faculty</button>
				</div>
				



				<div class="col-md-3 form-group">
					<label for="ResearchLoadDropDown">Research Load</label> 
					<select class="form-control" id=ResearchLoadDropDown>
						<option selected>All</option>
					</select>
					<br>
					<button type="button" class="btn btn-default" onclick="researchDeloading()">Deload
						Faculty</button>
				</div>
				
				<br>
				
				<table id="tableDeloading" class="table table-striped table-hover header-fixed header-fixed-deloadingview">  
					<thead id="tableDeloadingHeaders">
						<tr>
							<th>Deloading Code</th>
							<th>Deloading Type</th>
							<th>Deloading Units</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				

			</div>
			
				<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="updateFacultyLoadListInDeloading()">Close</button>
     	 </div>



			
      
    </div>
  </div>
</div>