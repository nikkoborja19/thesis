<form id="" action="wiewOfferingsForm" method="GET">
    <input type="hidden" class="inputDumpID" name="inputDumpID" value="">
</form>

<div class="col-md-9 inactivePanel" id="panelViewOfferings">
<div id="subcontainer">
  <div class="panel panel-default">
    <div class="panel-heading clickedPanel-color">
      <h3 class="panel-title"><span><i class="fa fa-calendar-o"></i></span> View Offerings</h3>
    </div>
    <div class="panel-body">
     <div class="row">
           <div class="col-md-4">
                <a class="btn btn-default" type="button" onclick="" data-toggle="modal" data-target="#setNewOfferingsModal" data-backdrop="static" data-keyboard="false" id="addNewOfferingsButton"><span><i class="fa fa-calendar-plus-o"></i></span> Add New Offerings</a>
           </div>
      </div>  
      <br>
      <table id="tableViewOfferings" class="table table-striped table-hover header-fixed header-fixed-viewofferings">
      	<thead id="tableViewOfferingsHeaders">
	         <tr>
	           <th>AY</th>
	           <th>Term</th>
	           <th>Publish</th>
	           <th>View/Delete</th><!-- put space para di masira yung header na fixed -->
	         </tr>
         </thead>
         <tbody>
         </tbody>
      </table>
    </div>
    </div>
</div>
</div>