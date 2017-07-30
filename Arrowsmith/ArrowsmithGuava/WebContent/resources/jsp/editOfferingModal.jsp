<form id="">
    <input type="hidden" class="inputTempOfferingIDDump" id="inputTempOfferingIDDump" name="inputTempOfferingIDDump" value="">
</form>

<div class="modal fade" id="editOfferingModal" role="dialog" >
  <div class="modal-dialog">
    <div class="modal-content">
      
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="exitEditOfferingModal()"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="editOfferingModalTitle">Edit</h4>
      </div>
      
      <!--  THERE SHOULD ONLY BE ONE MODAL BODY OTHERWISE DI GAGANA LAHAT(YOU CANT TYPE); -->
      <div class="modal-body" id="editOfferingModalBody1">
      	<div class="row">
	        <div class="col-md-4 form-group">
			       <label for="degreeProgramEO">Degree Program</label>
			       <input type="text" required class="form-control" id="degreeProgramEO" placeholder="-">
			</div>
	        
	        <div class="col-md-2 form-group">
	          <label for="termEO">Term</label>
			  <input type="number" disabled class="form-control" id="termEO" placeholder="-">
	        </div>
	        
	        <div class="col-md-2 form-group">
	          <label for="batchEO">Batch</label>
			  <input type="number" class="form-control" id="batchEO" placeholder="-">
	        </div>
	        
	        <div class="col-md-4 form-group">
	          <label for="sectionEO">Section</label>
			  <input type="text" class="form-control" id="sectionEO" placeholder="-">
	        </div>
        </div>
        
        <div class="row">
	        <div class="col-md-4 form-group">
	          <label for="statusEO">Status</label>
			  <input type="text" class="form-control" id="statusEO" placeholder="-">
	        </div>
        
	        <div class="col-md-8 form-group">
	          <label for="remarksEO">Remarks</label>
			  <input type="text" class="form-control" id="remarksEO" placeholder="-">
	        </div>
        </div>
        
        <div class="row">
	        <div class="col-md-8 form-group">
	          <label for="facultyEO">Faculty</label>
			  <input type="text" disabled class="form-control" id="facultyEO" placeholder="No faculty">
	        </div>
        </div>
        
        <div class="row">
	        <div class="col-md-8 form-group">
	   			<label for="classDayVO">Day 1</label>
	   			<br>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="M" data-off="M" id="toggle1MEO" value=""></label>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="T" data-off="T" id="toggle1TEO" value=""></label>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="W" data-off="W" id="toggle1WEO" value=""></label>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="H" data-off="H" id="toggle1HEO" value=""></label>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="F" data-off="F" id="toggle1FEO" value=""></label>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="S" data-off="S" id="toggle1SEO" value=""></label>
		    </div>
		    <div class="col-md-4 form-group">
		    	<label for="timeBlock1EODropdown">Day 1 Time Block</label>
	            <select class="form-control" id="timeBlock1EODropdown">
				    <option selected>All</option>
				</select>
		    </div>
        </div>
        
        <div class="row">
	        <div class="col-md-8 form-group">
	   			<label for="classDayVO">Day 2</label>
	   			<br>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="M" data-off="M" id="toggle2MEO" value=""></label>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="T" data-off="T" id="toggle2TEO" value=""></label>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="W" data-off="W" id="toggle2WEO" value=""></label>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="H" data-off="H" id="toggle2HEO" value=""></label>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="F" data-off="F" id="toggle2FEO" value=""></label>
				<label class="checkbox-inline"><input type="checkbox" data-toggle="toggle" data-size="mini" data-onstyle="success" data-style="ios" data-on="S" data-off="S" id="toggle2SEO" value=""></label>
		    </div>
		    <div class="col-md-4 form-group">
		    	<label for="timeBlock2EODropdown">Day 2 Time Block</label>
	            <select class="form-control" id="timeBlock2EODropdown">
				    <option selected>All</option>
				</select>
		    </div>
        </div>
      </div>
      
      <div class="row">
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="exitEditOfferingModal()">Close</button>
        <button type="button" class="btn btn-default save-button" id="saveTemporaryButton" data-dismiss="modal" onclick="saveTemporaryOffering()"><span><i class="fa fa-save"></i></span> Save</button>
        <button type="button" class="btn btn-default save-button" id="saveToDatabaseButton" data-dismiss="modal" onclick="saveOfferingToDatabase()"><span><i class="fa fa-database"></i></span> Save To Database</button>
      </div>
      
    </div>
  </div>
</div>