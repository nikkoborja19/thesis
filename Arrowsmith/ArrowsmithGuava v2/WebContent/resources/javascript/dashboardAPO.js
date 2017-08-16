var tempCourseOfferings = [];
var appenderID = 0;
var hasInitializedEditableOfferingListenner = false;

function clickNavigation(current) {
	if(current != "dropdownNav"){
		$('.active').removeClass('active');
		$('#'+current).addClass('active');
		
		$('.activePanel').addClass('inactivePanel');
		$('.activePanel').removeClass('activePanel');
	}
	fixForParallax();
}

function clickSideBar(current) {
	$('.active').removeClass('active');
	$('.sideBar-cell-color').removeClass('sideBar-cell-color');

	$('#'+current).addClass('active');
	$('#'+current).addClass('sideBar-cell-color');
	
	$('.activePanel').addClass('inactivePanel');
	$('.activePanel').removeClass('activePanel');
	fixForParallax();
}

function makeActivePanel(panel){
	//hide old Panel by adding the inactivePanel class
	$('.activePanel').addClass('inactivePanel');
	$('.activePanel').removeClass('activePanel');
	
	//set new Panel to activePanel by removing the inactivePanel class
	$(panel).removeClass('inactivePanel');
	$(panel).addClass('activePanel');
}

/***************************BUILDINGS AND ROOMS******************************/
function clickBuildingsAndRooms(id){
	clickSideBar(id);
	makeActivePanel("#panelBuildingsAndRooms");
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getBuildingsAndRooms',
        success: function (data) {
        	var headers = "", bodyStartTag="<tbody>", bodyEndTag="</tbody>";
        	//console.log(data);
        	$("#tableBuildingsAndRooms tbody tr").remove(); //removes all tr but not thead
        	
        	//headers += "<theadid=\"tableBuildingsAndRoomsHeaders\"><tr>" +
        			//"<th>Building</th>" +
        			//"<th>Building Code</th>" +
        			//"<th>Rooms Available</th>" +
        			//"<th></th>" +
        			//"</tr></thead>";
        	//$(headers).appendTo("#tableBuildingsAndRooms tbody");

        	$.each(data, function(i, currObject){
        		var rows = "";
        		var id = currObject.id;
        		var buildingName = currObject.buildingName;
        		var buildingCode = currObject.buildingCode;
        		var roomsAvailable = currObject.roomsAvailable;
        		
        		rows += "<tr id=\"" + id + "-id\" class=\"buildingRow\">"+
        				"<td>"+buildingName+"</td>"+
        				"<td>"+buildingCode+"</td>"+
        				"<td>"+roomsAvailable+"</td>"+
        				//data backdrop static prevents exit from background while data-keyboard false prevents exit using keyboard keys
        				"<td>" + "<a class=\"btn btn-default\" type=\"button\" onclick=\"getRoomsOfBuilding(this.id)\" data-toggle=\"modal\" data-target=\"#viewRoomsModal\" data-backdrop=\"static\" data-keyboard=\"false\" id=\"" + id + "-view\"><span><i class=\"fa fa-search\"></i></span> View</a>" + "</td>"+  
        				"<tr>";
        		//console.log(rows);
        		$(rows).appendTo("#tableBuildingsAndRooms tbody");
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	fixForParallax();
}

function getRoomsOfBuilding(id){
	var arr = [];
	arr = id.split('-'); //arr[0] would be the ID
	
	var selectedRoomType = $('#roomTypeDropdown :selected').text();
	var selectedRoomCapacity = $('#roomCapacityDropdown :selected').text();
	
	populateViewRoomsDropdown(arr[0], selectedRoomType, selectedRoomCapacity);
	getBuildingName(arr[0]);
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getRoomsOfBuilding',
        data: {
        	"buildingId": arr[0],
        	"roomType": selectedRoomType,
			"roomCapacity": selectedRoomCapacity
        },
        success: function (data) {
        	var headers = "";
        	//console.log(data);
        	$("#tableModalBuildingRooms tbody tr").remove(); //removes all tr but not thead

        	$.each(data, function(i, currObject){
        		var rows = "";
        		var id = currObject.id;
        		var roomCode = currObject.roomCode;
        		var roomType = currObject.roomType;
        		var roomCapacity = currObject.roomCapacity;
        		
        		rows += "<tr id=\"" + id + "-id\" class=\"buildingRoomRow\">"+
        				"<td>"+roomCode+"</td>"+
        				"<td>"+roomType+"</td>"+
        				"<td>"+roomCapacity+"</td>"+
        				"<tr>";
        		//console.log(rows);
        		$(rows).appendTo("#tableModalBuildingRooms tbody");
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	
	fixForParallax();
}

function getBuildingName(id){
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getBuildingNameModal',
        data: {
        	"buildingId": id
        },
        success: function (data) {
        	$("#viewRoomsModalTitle").text("View " + data.response +"'s Rooms");
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	
	fixForParallax();
}

function populateViewRoomsDropdown(id, selectedRoomType, selectedRoomCapacity){
	//populate Room Type
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateRoomTypeDropdown',
        success: function (data) {
        	$("#roomTypeDropdown").empty(); //removes all options
        	$("#roomTypeDropdown").removeAttr("onChange");
        	$("#roomTypeDropdown").attr("onChange", "return getRoomsOfBuilding(\""+id+"-type\")");
        	
        	if(selectedRoomType === "All"){
        		$("#roomTypeDropdown").prepend("<option selected onclick=\"getRoomsOfBuilding(this.id)\" id=\""+id+"-type"+"\">All</option>");
        	}else{
        		$("#roomTypeDropdown").prepend("<option onclick=\"getRoomsOfBuilding(this.id)\" id=\""+id+"-type"+"\">All</option>");
        	}
        	
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedRoomType === currOption){
        			var newoption = "<option selected onclick=\"getRoomsOfBuilding(this.id)\" id=\""+id+"-type"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"getRoomsOfBuilding(this.id)\" id=\""+id+"-type"+"\">" + currOption + "</option>";
            	}
        		
        		$("#roomTypeDropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	
	//populate Room Capacity
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateRoomCapacityDropdown',
        success: function (data) {
        	$("#roomCapacityDropdown").empty(); //removes all options
        	$("#roomCapacityDropdown").removeAttr("onChange");
        	$("#roomCapacityDropdown").attr("onChange", "return getRoomsOfBuilding(\""+id+"-capacity\")");

        	if(selectedRoomCapacity === "All"){
        		$("#roomCapacityDropdown").prepend("<option selected onclick=\"getRoomsOfBuilding(this.id)\" id=\""+id+"-type"+"\">All</option>");
        	}else{
        		$("#roomCapacityDropdown").prepend("<option onclick=\"getRoomsOfBuilding(this.id)\" id=\""+id+"-type"+"\">All</option>");
        	}
        	
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedRoomCapacity === currOption){
        			var newoption = "<option selected onclick=\"getRoomsOfBuilding(this.id)\" id=\""+id+"-capacity"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"getRoomsOfBuilding(this.id)\" id=\""+id+"-capacity"+"\">" + currOption + "</option>";
            	}
            	
        		//console.log(rows);
        		$("#roomCapacityDropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
}

function exitViewRoomsModal(){
	//this function empties the dropdown list again and sets "All" as the default selected option
	$("#roomTypeDropdown").empty(); //removes all options
	$("#roomTypeDropdown").removeAttr("onChange");
	$("#roomTypeDropdown").attr("onChange", "return getRoomsOfBuilding(\"\")");
	$("#roomTypeDropdown").prepend("<option selected>All</option>");
	
	$("#roomCapacityDropdown").empty(); //removes all options
	$("#roomCapacityDropdown").removeAttr("onChange");
	$("#roomCapacityDropdown").attr("onChange", "return getRoomsOfBuilding(\"\")");
	$("#roomCapacityDropdown").prepend("<option selected>All</option>");
	
	closeModal("viewRoomsModal");
}

function exitAddNewOfferingsModal(){
	//this function empties the dropdown list again and sets "All" as the default selected option
	closeModal("addNewOfferingsModal");
	emptyAddNewOfferingsModal();
}

function exitEditOfferingModal(){
	//this function empties the dropdown list again and sets "All" as the default selected option
	/*$("#" + thisModal).addClass('hide');
	$("#" + reOpenModal).removeClass('hide');
	$("#" + reOpenModal).modal('show');*/
	emptyEditOfferingModal();
}
/***************************BUILDINGS AND ROOMS******************************/

/**************************ROOM ASSIGNMENT**********************************/
function clickViewRoomAssignment(id){
	clickSideBar(id);
	makeActivePanel("#panelViewRoomAssignment");
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getAllAcademicYears',
        success: function (data) {
        	var headers = "";
        	//console.log(data);
        	$("#tableViewRoomAssignment tbody tr").remove(); //removes all tr but not thead
        	
        	$.each(data, function(i, currObject){
        		var rows = "";
        		var id = currObject.id;
        		var AY = currObject.startYear +"-"+ currObject.endYear;
        		var term = currObject.term;
        		var isPublished = currObject.isPublished;
        		var unPublishedCount = currObject.unPublishedCount;
        		
        		rows += "<tr id=\"" + id + "-id\" class=\"AYRow\">"+
        				"<td>"+AY+"</td>"+
        				"<td>"+term+"</td>";
        				//data backdrop static prevents exit from background while data-keyboard false prevents exit using keyboard keys
        				console.log(unPublishedCount);
        				if(isPublished === "1"){ //because unPublished coutn is the count of all unpublished
        					rows+="<td><a class=\"btn btn-default\" type=\"button\" onclick=\"updateRoomAssignmentModal(this.id)\" data-toggle=\"modal\" data-target=\"#roomAssignmentModal\" data-backdrop=\"static\" data-keyboard=\"false\" id=\"" + id + "-assignrooms\" disabled><span><i class=\"fa fa-map-pin\"></i></span> Assign Rooms</a></td>";  
        				}else{
        					rows+="<td><a class=\"btn btn-default\" type=\"button\" onclick=\"updateRoomAssignmentModal(this.id)\" data-toggle=\"modal\" data-target=\"#roomAssignmentModal\" data-backdrop=\"static\" data-keyboard=\"false\" id=\"" + id + "-assignrooms\"><span><i class=\"fa fa-map-pin\"></i></span> Assign Rooms</a></td>";  
        				}
        				
        				rows+="<tr>";
        		$(rows).appendTo("#tableViewRoomAssignment tbody");
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	fixForParallax();
}

function updateRoomAssignmentModal(id){
	var arr = [];
	arr = id.split('-'); //arr[0] would be startyear, [1], endyear, [2] term, [3] batch, [4] extraneous text
	var startYear = arr[0];
	var endYear = arr[1];
	var term = arr[2];
	var batch = arr[3];
	var concatId = startYear + "-" + endYear + "-" + term + "-" + batch;
	
	$('#assignRoomCurrentAYDump').val(concatId); //for search Listeners cause di nila alam ung ID
	var selectedRoomType = $('#roomTypeRADropdown :selected').text();
	var selectedBuilding = $('#buildingRADropdown :selected').text();
	var searchRoom = $('#searchRoomRA').val();
	var searchOffering = $('#searchOfferingRA').val();
	
	//to initially disable the dropdowns and the input of rooms. Once the user clicks an offering, it will become enabled
	$('#buildingRADropdown').attr('disabled', true);
	$('#roomTypeRADropdown').attr('disabled', true);
	$('#searchRoomRA').prop('disabled', true);
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getOfferingListWithKey',
        data: {
        	"startYear": startYear,
        	"endYear": endYear,
			"term": term,
			"searchKeyword": searchOffering
        },
        success: function (data) {
        	var headers = "";
        	//console.log(data);
        	$("#tableModalRAOfferingList tbody tr").remove(); //removes all tr but not thead

        	$.each(data, function(i, currObject){
        		
        		var id = currObject.offeringId;
        		var degreeProgram = currObject.degreeProgram;
        		var course = currObject.course.courseCode;
        		var section = currObject.section;
        		
        		$.each(currObject.days, function(j, currDay){
        			var rows = "";
        			rows += "<tr id=\"" + id + "-id\" class=\"clicked-offering-inactive offeringRow "+id+"-id\" onclick=\"clickOffering(this.id)\">"+
    				"<td>"+degreeProgram+"</td>"+
    				"<td>"+course+"</td>"+
    				"<td>"+section+"</td>"+
    				"<td>"+currDay.classDay+"</td>"+
    				"<td>"+currDay.beginTime+"</td>"+
    				"<td>"+currDay.endTime+"</td>"
    				
    				if(currDay.room.roomCode === "No Room") rows+="<td>-</td>";
    				else rows+="<td>"+currDay.room.roomCode+"</td>";
        			
    				rows+="<tr>";
		    		//console.log(rows);
		    		$(rows).appendTo("#tableModalRAOfferingList tbody");
        		});
        		
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	
	fixForParallax();
}

function updateRoomList(offeringId){
	var arr = [];
	console.log(offeringId);
	arr = offeringId.split('-'); //arr[0] is ID
	
	$('#assignRoomRoomIDDump').val(offeringId); //for search Listeners cause di nila alam ung ID
	var selectedRoomType = $('#roomTypeRADropdown :selected').text();
	var selectedBuilding = $('#buildingRADropdown :selected').text();
	var searchRoom = $('#searchRoomRA').val();
	
	populateRoomAssignmentModalDropdown(offeringId, selectedRoomType, selectedBuilding);
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getRoomListWithKey',
        data: {
        	"offeringId": arr[0],
			"searchKeyword": searchRoom,
			"roomType": selectedRoomType,
			"building": selectedBuilding
        },
        success: function (data) {
        	
        	$("#tableModalRARoomList tbody tr").remove(); //removes all tr but not thead

        	$.each(data, function(i, currObject){
        		var rows = "";
        		var id = currObject.id;
        		var roomCode = currObject.roomCode;
        		var building = currObject.building.buildingName;
        		var roomType = currObject.roomType;
        		var roomCapacity = currObject.roomCapacity;
        		
    			rows += "<tr id=\"" + id + "-id\" class=\"clicked-room-inactive roomRow "+id+"-id\">";
				
				if(roomCode != "No Room") rows+="<td>"+roomCode+"</td>";
    			
				rows+=  "<td>"+roomType+"</td>"+
						"<td>"+building+"</td>"+
						"<td>"+roomCapacity+"</td>"+
						"<td><a class=\"btn btn-default\" type=\"button\" onclick=\"assignThisRoomToCourse(this.id)\" id=\"" + id + "-assign\">Assign</a>" + "</td>"+
						"<tr>";
	    		//console.log(rows);
	    		$(rows).appendTo("#tableModalRARoomList tbody");
        		
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
}

function populateRoomAssignmentModalDropdown(id, selectedRoomType, selectedBuilding){
	//populate Room Type
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateRoomTypeDropdown',
        success: function (data) {
        	$("#roomTypeRADropdown").empty(); //removes all options
        	$("#roomTypeRADropdown").removeAttr("onChange");
        	$("#roomTypeRADropdown").attr("onChange", "return updateRoomList(\""+id+"-type\")");
        	
        	if(selectedRoomType === "All"){
        		$("#roomTypeRADropdown").prepend("<option selected onclick=\"updateRoomList(this.id)\" id=\""+id+"-type"+"\">All</option>");
        	}else{
        		$("#roomTypeRADropdown").prepend("<option onclick=\"updateRoomList(this.id)\" id=\""+id+"-type"+"\">All</option>");
        	}
        	
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedRoomType === currOption){
        			var newoption = "<option selected onclick=\"updateRoomList(this.id)\" id=\""+id+"-type"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"updateRoomList(this.id)\" id=\""+id+"-type"+"\">" + currOption + "</option>";
            	}
        		
        		$("#roomTypeRADropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	
	//populate Building
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateBuildingDropdown',
        success: function (data) {
        	$("#buildingRADropdown").empty(); //removes all options
        	$("#buildingRADropdown").removeAttr("onChange");
        	$("#buildingRADropdown").attr("onChange", "return updateRoomList(\""+id+"-type\")");
        	
        	if(selectedBuilding === "All"){
        		$("#buildingRADropdown").prepend("<option selected onclick=\"updateRoomList(this.id)\" id=\""+id+"-building"+"\">All</option>");
        	}else{
        		$("#buildingRADropdown").prepend("<option onclick=\"updateRoomList(this.id)\" id=\""+id+"-building"+"\">All</option>");
        	}
        	
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedBuilding === currOption){
        			var newoption = "<option selected onclick=\"updateRoomList(this.id)\" id=\""+id+"-building"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"updateRoomList(this.id)\" id=\""+id+"-building"+"\">" + currOption + "</option>";
            	}
        		
        		$("#buildingRADropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
}

function clickOffering(id){
	//$('.clicked-offering-active').removeClass('success');
	$('.clicked-offering-active').addClass('clicked-offering-inactive');
	$('.clicked-offering-active').removeClass('clicked-offering-active');
	//$('.sideBar-cell-color').removeClass('sideBar-cell-color');

	$('.'+id).addClass('clicked-offering-active');
	$('.'+id).removeClass('clicked-offering-inactive');
	//$('.'+id).addClass('success');
	//$('#'+id).addClass('sideBar-cell-color');
	
	//once the user clicked on an offering, filters for rooms will now become enabled
	$('#buildingRADropdown').attr('disabled', false);
	$('#roomTypeRADropdown').attr('disabled', false);
	$('#searchRoomRA').prop('disabled', false);
	
	//set hidden input form for later use/for assigning
	$('#assignRoomOfferingIDDump').val(id);
	
	updateRoomList(id);
}

function exitRoomAssignmentModal(){
	//this function empties the dropdown list again and sets "All" as the default selected option
	$("#roomTypeRADropdown").empty(); //removes all options
	$("#roomTypeRADropdown").removeAttr("onChange");
	$("#roomTypeRADropdown").attr("onChange", "return updateRoomAssignmentModal(\"\")");
	$("#roomTypeRADropdown").prepend("<option selected>All</option>");
	
	$("#buildingRADropdown").empty(); //removes all options
	$("#buildingRADropdown").removeAttr("onChange");
	$("#buildingRADropdown").attr("onChange", "return updateRoomAssignmentModal(\"\")");
	$("#buildingRADropdown").prepend("<option selected>All</option>");
	
	$("#tableModalRARoomList tbody tr").remove();
	$("#tableModalRAOfferingList tbody tr").remove();
	
	$("#searchRoomRA").val("");
	$("#searchOfferingRA").val("");
	
	closeModal("roomAssignmentModal");
}

function assignThisRoomToCourse(id){
	var arr = [], arr2 = [];
	
	arr = id.split('-');
	var roomId = arr[0]; //roomID
	
	offeringId = $('#assignRoomOfferingIDDump').val();
	arr2 = offeringId.split('-');
	var offeringId = arr2[0]; //clicked OfferingID
	
	$.ajax({
        type: 'POST',
        dataType: 'json',
        cache: false,
        url: 'initiateRoomAssignment',
        data: {
        	"offeringId": offeringId,
			"roomId": roomId,
        },
        success: function (data) {
        	console.log($('#assignRoomCurrentAYDump').val());
        	updateRoomAssignmentModal($('#assignRoomCurrentAYDump').val());
        	clickOffering($('#assignRoomOfferingIDDump').val());
        },
    	error: function (data){
    		console.log(data);
    	}
    });
}

/**************************ROOM ASSIGNMENT**********************************/
/**************************VIEW OFFERINGS**********************************/
function clickViewOfferings(id){
	clickSideBar(id);
	makeActivePanel("#panelViewOfferings");
	
	updateViewOfferingsPanel();
}

function updateViewOfferingsPanel(){
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getAllAcademicYears',
        success: function (data) {
        	var headers = "";
        	//console.log(data);
        	$("#tableViewOfferings tbody tr").remove(); //removes all tr but not thead
        	
        	$.each(data, function(i, currObject){
        		var rows = "";
        		var id = currObject.id;
        		var AY = currObject.startYear +"-"+ currObject.endYear;
        		var term = currObject.term;
        		var isPublished = currObject.isPublished;
        		var unPublishedCount = currObject.unPublishedCount;
        		var concatId = currObject.startYear +"-"+ currObject.endYear + "-" + currObject.term;
        		
        		rows += "<tr id=\"" + id + "-id\" class=\"AYRow\">"+
        				"<td>"+AY+"</td>"+
        				"<td>"+term+"</td>";
        				
        				if(isPublished === "0"){
        					rows += "<td><a class=\"btn btn-default publish-active\" type=\"button\" onclick=\"publishAYTermOffering(this.id, 1)\"  id=\"" + concatId + "-publish\"><span><i class=\"fa fa-check\"></i></span></a> <a class=\"btn btn-default publish-inactive pushed-option\" type=\"button\" onclick=\"publishAYTermOffering(this.id, 0)\"  id=\"" + concatId + "-unpublish\" disabled><span><i class=\"fa fa-close\"></i></span></a></td>";
        					rows += "<td><a class=\"btn btn-default\" type=\"button\" onclick=\"viewOfferingsInModal(this.id)\" data-toggle=\"modal\" data-target=\"#viewOfferingsModal\" data-backdrop=\"static\" data-keyboard=\"false\" id=\"" + concatId + "-view\"><span><i class=\"fa fa-search\"></i></span></a> ";
    						rows+="<a class=\"btn btn-default trash-button\" type=\"button\" onclick=\"confirmDeleteOffering(this.id)\" data-toggle=\"modal\" data-target=\"#dashboardAPOConfirmDeleteOfferingsModal\" data-backdrop=\"static\" data-keyboard=\"false\" id=\"" + concatId + "-view\"><span><i class=\"fa fa-trash\"></i></span></a></td>";	
        				}else{
        					rows += "<td><a class=\"btn btn-default publish-active pushed-option\" type=\"button\" onclick=\"publishAYTermOffering(this.id, 1)\"  id=\"" + concatId + "-publish\" disabled><span><i class=\"fa fa-check\"></i></span></a> <a class=\"btn btn-default publish-inactive\" type=\"button\" onclick=\"publishAYTermOffering(this.id, 0)\"  id=\"" + concatId + "-unpublish\"><span><i class=\"fa fa-close\"></i></span></a></td>";
        					rows += "<td><a class=\"btn btn-default\" type=\"button\" onclick=\"viewOfferingsInModal(this.id)\" data-toggle=\"modal\" data-target=\"#viewOfferingsModal\" data-backdrop=\"static\" data-keyboard=\"false\" id=\"" + concatId + "-view\"><span><i class=\"fa fa-search\"></i></span></a> ";
    						rows+="<a class=\"btn btn-default trash-button\" type=\"button\" onclick=\"confirmDeleteOffering(this.id)\" data-toggle=\"modal\" data-target=\"#dashboardAPOConfirmDeleteOfferingsModal\" data-backdrop=\"static\" data-keyboard=\"false\" id=\"" + concatId + "-delete\" disabled><span><i class=\"fa fa-trash\"></i></span></a></td>";	
        				}
        				//data backdrop static prevents exit from background while data-keyboard false prevents exit using keyboard keys
        				
        					rows+="</tr>";
        		$(rows).appendTo("#tableViewOfferings tbody");
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	fixForParallax();
}

function viewOfferingsInModal(id){
	var arr = [], daysList = [];  
	
	arr = id.split('-');
	
	var searchKeyword = $('#searchOfferingVO').val();
	var selectedTimeBlock = $('#timeBlockVODropdown :selected').text();
	var selectedStatus = $('#statusVODropdown :selected').text();
	var selectedBatch = $('#batchVODropdown :selected').text();
	var selectedRoomType = $('#roomTypeVODropdown :selected').text();
	var concatId = arr[0] +"-"+ arr[1] + "-" + arr[2];
	
	$('#viewOfferingsCurrentAYDump').val(concatId); //for search Listeners cause di nila alam ung ID
	$('#viewOfferingsModalTitle').text("View A.Y " +arr[0]+ "-" + arr[1] + " Term " + arr[2] + " Offerings"); //change modal title
	
	if($('#toggleMVO').prop('checked')) daysList.push("M");
	if($('#toggleTVO').prop('checked')) daysList.push("T");
	if($('#toggleWVO').prop('checked')) daysList.push("W");
	if($('#toggleHVO').prop('checked')) daysList.push("H");
	if($('#toggleFVO').prop('checked')) daysList.push("F");
	if($('#toggleSVO').prop('checked')) daysList.push("S");
	
	daysList.push("none"); //para may value kahit naka untoggle lahat or else error na daysList[] not present
	
	populateViewOfferingsModalDropdownAndToggle(concatId, selectedRoomType, selectedTimeBlock, selectedBatch, selectedStatus); //concatId is startyear-endyear-term
	disableClassDayToggles(true);
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getAllOfferingsWithFilters',
        data: {
        	"startYear": arr[0],
        	"endYear": arr[1],
        	"term": arr[2],
			"searchKeyword": searchKeyword,
			"selectedTimeBlock": selectedTimeBlock,
			"daysList": daysList, //you must pass js array as JSON obj request param should have [] in Java
			"selectedBatch": selectedBatch,
			"selectedStatus": selectedStatus,
			"selectedRoomType": selectedRoomType
        },
        success: function (data) {
        	disableClassDayToggles(true);
        	$("#tableModalVOOfferingList tbody tr").remove(); //removes all tr but not thead

        	$.each(data, function(i, currObject){
        		var rows = "";
        		var offeringId = currObject.offeringId;
        		var degreeProgram = currObject.degreeProgram;
        		var course = currObject.course.courseCode;
        		var section = currObject.section;
        		var batch = currObject.batch;
        		var remarks = currObject.remarks;
        		var status = currObject.status;
        		
    			rows += "<tr id=\"" + id + "-id\" class=\"clicked-offering-inactive offeringRow "+id+"-id\">"+
						"<td>"+degreeProgram+"</td>"+
						"<td>"+course+"</td>"+
						"<td>"+section+"</td>"+
						"<td>"+batch+"</td>";
				
    			var classDay="", beginTime="", endTime="", room="";
    			
    			$.each(currObject.days, function(j, currDay){
    				classDay+= currDay.classDay + "<br>";
    				beginTime+= currDay.beginTime + "<br>";
    				endTime+= currDay.endTime + "<br>";
    				
    				if(currDay.room.roomCode === "No Room") room+= "-<br>";
    				else room+= currDay.room.roomCode + "<br>";
    				
        		});
    			rows+=	"<td>"+classDay+"</td>"+
						"<td>"+beginTime+"</td>"+
						"<td>"+endTime+"</td>" +
						"<td>"+room+"</td>"+
						"<td>"+status+"</td>"+
						"<td>"+remarks+"</td>";
						
						if(currObject.isPublished === "1"){
							rows+= "<td>" +
							"<a class=\"btn btn-default edit-button\" type=\"button\" onclick=\"modifyClickedOffering(this.id)\" id=\"" + offeringId + "-modify\" disabled><span><i class=\"fa fa-pencil\"></i></span></a>" +
							"<a class=\"btn btn-default trash-button\" type=\"button\" onclick=\"confirmDeleteClickedOffering(this.id)\" id=\"" + offeringId + "-delete\" disabled><span><i class=\"fa fa-trash\"></i></span></a>" +
							"</td>";
						}else{
							rows+= "<td>" +
							"<a class=\"btn btn-default edit-button\" type=\"button\" onclick=\"modifyClickedOffering(this.id)\" id=\"" + offeringId + "-modify\"><span><i class=\"fa fa-pencil\"></i></span></a>" +
							"<a class=\"btn btn-default trash-button\" type=\"button\" onclick=\"confirmDeleteClickedOffering(this.id)\" id=\"" + offeringId + "-delete\"><span><i class=\"fa fa-trash\"></i></span></a>" +
							"</td>";
						}
						
						"<tr>";
	    		//console.log(rows);
	    		$(rows).appendTo("#tableModalVOOfferingList tbody");
        		
        	});
        	disableClassDayToggles(false);
        },
    	error: function (data){
    		console.log(data);
    	}
    });
}

function populateViewOfferingsModalDropdownAndToggle(AYId, selectedRoomType, selectedTimeBlock, selectedBatch, selectedStatus){
	var arr = [];
	arr = AYId.split('-');
	
	//populate Room Type
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateRoomTypeDropdown',
        success: function (data) {
        	$("#roomTypeVODropdown").empty(); //removes all options
        	$("#roomTypeVODropdown").removeAttr("onChange");
        	$("#roomTypeVODropdown").attr("onChange", "return viewOfferingsInModal(\""+AYId+"-type\")");
        	
        	if(selectedRoomType === "All"){
        		$("#roomTypeVODropdown").prepend("<option selected onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">All</option>");
        	}else{
        		$("#roomTypeVODropdown").prepend("<option onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">All</option>");
        	}
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedRoomType === currOption){
        			var newoption = "<option selected onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">" + currOption + "</option>";
            	}
        		
        		$("#roomTypeVODropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	
	//populate Time Block
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateTimeBlockDropdown',
        data: {
        	"startYear": arr[0],
        	"endYear": arr[1],
        	"term": arr[2]
        },
        success: function (data) {
        	$("#timeBlockVODropdown").empty(); //removes all options
        	$("#timeBlockVODropdown").removeAttr("onChange");
        	$("#timeBlockVODropdown").attr("onChange", "return viewOfferingsInModal(\""+AYId+"-type\")");
        	
        	if(selectedTimeBlock === "All"){
        		$("#timeBlockVODropdown").prepend("<option selected onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">All</option>");
        	}else{
        		$("#timeBlockVODropdown").prepend("<option onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">All</option>");
        	}
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedTimeBlock === currOption){
        			var newoption = "<option selected onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">" + currOption + "</option>";
            	}
        		
        		$("#timeBlockVODropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	
	//populate Batch
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateBatchDropdown',
        data: {
        	"startYear": arr[0],
        	"endYear": arr[1],
        	"term": arr[2]
        },
        success: function (data) {
        	$("#batchVODropdown").empty(); //removes all options
        	$("#batchVODropdown").removeAttr("onChange");
        	$("#batchVODropdown").attr("onChange", "return viewOfferingsInModal(\""+AYId+"-type\")");
        	
        	if(selectedBatch === "All"){
        		$("#batchVODropdown").prepend("<option selected onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">All</option>");
        	}else{
        		$("#batchVODropdown").prepend("<option onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">All</option>");
        	}
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedBatch === currOption){
        			var newoption = "<option selected onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">" + currOption + "</option>";
            	}
        		
        		$("#batchVODropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	
	//populate Status
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateStatusDropdown',
        data: {
        	"startYear": arr[0],
        	"endYear": arr[1],
        	"term": arr[2]
        },
        success: function (data) {
        	$("#statusVODropdown").empty(); //removes all options
        	$("#statusVODropdown").removeAttr("onChange");
        	$("#statusVODropdown").attr("onChange", "return viewOfferingsInModal(\""+AYId+"-type\")");
        	
        	if(selectedStatus === "All"){
        		$("#statusVODropdown").prepend("<option selected onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">All</option>");
        	}else{
        		$("#statusVODropdown").prepend("<option onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">All</option>");
        	}
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedStatus === currOption){
        			var newoption = "<option selected onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"viewOfferingsInModal(this.id)\" id=\""+AYId+"-type"+"\">" + currOption + "</option>";
            	}
        		
        		$("#statusVODropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
}
	
function exitViewOfferingsModal(){
	$("#tableModalVOOfferingList tbody tr").remove();
	
	//this function empties the dropdown list again and sets "All" as the default selected option
	$("#roomTypeVODropdown").empty(); //removes all options
	$("#roomTypeVODropdown").removeAttr("onChange");
	$("#roomTypeVODropdown").attr("onChange", "return updateRoomAssignmentModal(\"\")");
	$("#roomTypeVODropdown").prepend("<option selected>All</option>");
	
	$("#batchVODropdown").empty(); //removes all options
	$("#batchVODropdown").removeAttr("onChange");
	$("#batchVODropdown").attr("onChange", "return updateRoomAssignmentModal(\"\")");
	$("#batchVODropdown").prepend("<option selected>All</option>");
	
	$("#statusVODropdown").empty(); //removes all options
	$("#statusVODropdown").removeAttr("onChange");
	$("#statusVODropdown").attr("onChange", "return updateRoomAssignmentModal(\"\")");
	$("#statusVODropdown").prepend("<option selected>All</option>");
	
	$("#timeBlockVODropdown").empty(); //removes all options
	$("#timeBlockVODropdown").removeAttr("onChange");
	$("#timeBlockVODropdown").attr("onChange", "return updateRoomAssignmentModal(\"\")");
	$("#timeBlockVODropdown").prepend("<option selected>All</option>");
	
	$("#searchOfferingVO").val("");
	closeModal("viewOfferingsModal");
}

function disableClassDayToggles(state){ //true or false
	if(state === true){
		$('#toggleMVO').bootstrapToggle('disable');
		$('#toggleTVO').bootstrapToggle('disable');
		$('#toggleWVO').bootstrapToggle('disable');
		$('#toggleHVO').bootstrapToggle('disable');
		$('#toggleFVO').bootstrapToggle('disable');
		$('#toggleSVO').bootstrapToggle('disable');
	}else{
		$('#toggleMVO').bootstrapToggle('enable');
		$('#toggleTVO').bootstrapToggle('enable');
		$('#toggleWVO').bootstrapToggle('enable');
		$('#toggleHVO').bootstrapToggle('enable');
		$('#toggleFVO').bootstrapToggle('enable');
		$('#toggleSVO').bootstrapToggle('enable');
	}
}

function publishAYTermOffering(id, state){
	var arr = [];
	
	arr = id.split('-'); //arr[0] startyear, arr[1] endyear, arr[2] term, arr[3] extraneous string
	
	$.ajax({
        type: 'POST',
        dataType: 'json',
        cache: false,
        url: 'publishAYTerm',
        data: {
        	"startYear": arr[0],
        	"endYear": arr[1],
        	"term": arr[2],
			"state": state,
        },
        success: function (data) {
        	updateViewOfferingsPanel();
        },
    	error: function (data){
    		console.log(data);
    	}
    });
}
/**************************VIEW OFFERINGS**********************************/

/**************************ADD NEW OFFERINGS*******************************/
function initializeAddNewOfferingsModal(){
	updateAddNewOfferingsDropdowns();
}

function updateAddNewOfferingsDropdowns(){
	//empty pa to sa simula
	/*var selectedDegreeProgram = $('#selectedDegreeProgramDropdown :selected').text();
	var selectedBatch = $('#batchANODropdown :selected').text();
	var selectedAY = $('#ayANODropdown :selected').text();*/
	//populate degree program
	
	var collegeId = $('#collegeIDDump').val();
	var deptId = $('#deptIDDump').val();
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateFlowchartDegreeProgramDropdown',
        data:{
        	"collegeId": collegeId,
        	"deptId": deptId
        },
        success: function (data) {
        	$("#degreeProgramANODropdown").empty(); //removes all options
        	
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(i === 0){
        			var newoption = "<option selected onclick=\"\" id=\"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"\" id=\"\">" + currOption + "</option>";
            	}
        		
        		$("#degreeProgramANODropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	//populate batch
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateFlowchartBatchDropdown',
        data:{
        	"collegeId": collegeId,
        	"deptId": deptId
        },
        success: function (data) {
        	$("#batchANODropdown").empty(); //removes all options
        	
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(i === 0){
        			var newoption = "<option selected onclick=\"\" id=\"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"\" id=\"\">" + currOption + "</option>";
            	}
        		
        		$("#batchANODropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	//populate AY
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateFlowchartAYDropdown',
        data:{
        	"collegeId": collegeId,
        	"deptId": deptId
        },
        success: function (data) {
        	$("#ayANODropdown").empty(); //removes all options
        	
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(i === 0){
        			var newoption = "<option selected onclick=\"\" id=\"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"\" id=\"\">" + currOption + "</option>";
            	}
        		
        		$("#ayANODropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
}

function updateAddNewOfferingsFlowchartCourseList(){
	
	var selectedDegreeProgram = $('#degreeProgramANODropdown :selected').text();
	var selectedBatch = $('#batchANODropdown :selected').text();
	var selectedAY = $('#ayANODropdown :selected').text();
	var year = [];
	year = selectedAY.split('-');
	var selectedTerm;
	
	if($('#radio1ANO').is(':checked')) selectedTerm = "1";
	else if($('#radio2ANO').is(':checked')) selectedTerm = "2";
	else selectedTerm = "3";
	
	/**********SET NEW OFFERING's SCHEDULE********/
	$('#textStartYearANO').val(year[0]);
	$('#textEndYearANO').val(year[1]);
	$('#textTermANO').val(selectedTerm);
	/**********SET NEW OFFERING's SCHEDULE********/
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getAllFlowchartCourses',
        data:{
        	"selectedDegreeProgram": selectedDegreeProgram,
        	"selectedBatch": selectedBatch,
        	"selectedTerm": selectedTerm,
        	"startYear": year[0],
        	"endYear": year[1]
        },
        success: function (data) {
        	var headers = "";
        	//console.log(data);
        	$("#tableModalANOFlowchartCoursesList tbody tr").remove(); //removes all tr but not thead
        	
        	$.each(data, function(i, currObject){
        		var rows = "";
        		var id = currObject.courseId;
        		var courseCode = currObject.courseCode;
        		var courseName = currObject.courseName;
        	
        		var concatId = currObject.startYear +"-"+ currObject.endYear + "-" + currObject.term;
        		
        		rows += "<tr id=\"" + id + "-id\" class=\"AYRow\">"+
        				"<td>"+courseCode+"</td>"+
        				"<td>"+courseName+"</td>";
        				
        				rows += "<td>" + "<a class=\"btn btn-default add-button\" type=\"button\" onclick=\"addCourseToTemporaryOfferingTable(this.id)\" id=\"" + id + "-add\"><span><i class=\"fa fa-plus\"></i></span></a></td></tr>"
        		$(rows).appendTo("#tableModalANOFlowchartCoursesList tbody");
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	fixForParallax();
}

function updateAddNewOfferingsCourseList(){
	
	var searchKeyword = $('#searchCourseANO').val();
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getAllCoursesWithCourseKey',
        data:{
        	"searchKeyword": searchKeyword
        },
        success: function (data) {
        	var headers = "";
        	//console.log(data);
        	$("#tableModalANOCoursesList tbody tr").remove(); //removes all tr but not thead
        	
        	$.each(data, function(i, currObject){
        		var rows = "";
        		var id = currObject.courseId;
        		var courseCode = currObject.courseCode;
        		var courseName = currObject.courseName;
        	
        		var concatId = currObject.startYear +"-"+ currObject.endYear + "-" + currObject.term;
        		
        		rows += "<tr id=\"" + id + "-id\" class=\"AYRow\">"+
        				"<td>"+courseCode+"</td>"+
        				"<td>"+courseName+"</td>";
        				
        				rows += "<td>" + "<a class=\"btn btn-default add-button\" type=\"button\" onclick=\"addCourseToTemporaryOfferingTable(this.id)\" id=\"" + id + "-add\"><span><i class=\"fa fa-plus\"></i></span></a></td></tr>"
        		$(rows).appendTo("#tableModalANOCoursesList tbody");
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	fixForParallax();
}

function addCourseToTemporaryOfferingTable(courseID){
	var arr = [];
	arr = courseID.split("-"); //arr[0] clickedCourseID;
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getCourseWithID',
        data:{
        	"courseId": arr[0]
        },
        success: function (data) {
        	var headers = "";
        	//console.log(data);        	
        	
        	var offering = new TempOffering("", (data.courseId + "-" +appenderID), data.courseCode, "", "", "", "Regular", "");
        	
        	tempCourseOfferings[appenderID] = offering;
        	appenderID++;
        	//sortTempCourseOfferings();
        	updateTemporaryOfferingList();
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	fixForParallax();
}

function updateTemporaryOfferingList(){
	$("#tableModalANOOfferingList tbody tr").remove(); //removes all tr but not thead
	
	$.each(tempCourseOfferings, function(i, currObject){
		var rows = "";
		var id = currObject.courseId;
		var timeslot = getTimeSlot(currObject.daysList1, currObject.daysList2, currObject.timeSlot1, currObject.timeSlot2);
		var courseCode = currObject.courseCode;
		var section = currObject.section;
		var batch = currObject.batch;
		var term = currObject.term;
		var status = currObject.status;
		var remarks = currObject.remarks;
	        		
		rows += "<tr id=\"" + id + "-id\" class=\"AYRow\">"+
				"<td class=\"editable-cell\" id=\""+id+"-batch\" contenteditable>"+batch+"</td>"+
				"<td id=\""+id+"-courseCode\">"+courseCode+"</td>"+
				"<td class=\"editable-cell\" id=\""+id+"-section\" contenteditable>"+section+"</td>"+
				"<td id=\""+id+"-timeslot\">"+timeslot+"</td>"+
        		//"<td style=\"text-align: center\"><a class=\"btn btn-default edit-button\" type=\"button\" onclick=\"editTemporaryOfferingTimeslot(this.id)\" data-toggle=\"modal\" data-target=\"#editOfferingModal\" data-backdrop=\"static\" id=\""+id+"-edit\"><span><i class=\"fa fa-pencil\"></i></span></a></td>"+
				"<td class=\"editable-cell\" id=\""+id+"-status\" contenteditable>"+status+"</td>"+
				"<td class=\"editable-cell\" id=\""+id+"-remarks\" contenteditable>"+remarks+"</td>";
				
				rows += "<td><a class=\"btn btn-default edit-button\" type=\"button\" onclick=\"editTemporaryOfferingTimeslot(this.id)\" data-toggle=\"modal\" data-target=\"#editOfferingModal\" data-backdrop=\"static\" id=\""+id+"-edit\"><span><i class=\"fa fa-pencil\"></i></span></a><a class=\"btn btn-default trash-button\" type=\"button\" onclick=\"deleteCourseFromTemporaryOfferingTable(this.id)\" id=\"" + id + "-delete\"><span><i class=\"fa fa-trash\"></i></span></a></td></tr>"

				$(rows).appendTo("#tableModalANOOfferingList tbody");
				
	});
	if(hasInitializedEditableOfferingListenner === false)
		initEditableOfferingListeners();  //DO NOT PUT THIS INSIDE .EACH KASI MAG LOLOOP NG ILANG BESES UNG TAWAG DITO
}

function getTimeSlot(days1, days2, time1, time2){
	var timeslot="";
	
	if(days1.length != 0){
		$.each(days1, function(i, day){
			timeslot += day + "";
		});
		timeslot += "<br>" + time1 + "<br>";
	}
	if(days2.length != 0){
		$.each(days2, function(j, day){
			timeslot += day + "";
		});
		timeslot += "<br>" + time2;
	}
	
	if(days1.length === 0 && days2.length ===0) timeslot += "-";
	
	return timeslot;
}

function initEditableOfferingListeners(){
	
	$('.editable-cell').keyup(function() {
		//console.log($(this).attr('id'));
		saveRecentlyEditedTemporaryOfferingCell($(this).attr('id'));
	});
}

function editTemporaryOfferingTimeslot(id){
	var arr = [];
	arr = id.split('-');
	
	$('#inputTempOfferingIDDump').val(id); //for saving

	var concatId = arr[0]+"-"+arr[1];
	
	$.each(tempCourseOfferings, function(i, currObject){
		console.log();
		if(currObject.courseId === concatId){
			var tempOffering = new TempOffering(currObject.degreeProgram, arr[0], currObject.courseCode, currObject.section, currObject.batch, currObject.term, currObject.status, currObject.remarks);
			tempOffering.daysList1 = currObject.daysList1;
			tempOffering.daysList2 = currObject.daysList2;
			tempOffering.timeSlot1 = currObject.timeSlot1;
			tempOffering.timeSlot2 = currObject.timeSlot2;
			initEditOfferingModal(tempOffering, concatId, "1"); //meaning local na global variable lang. NOT in DB
		}
	});
}

function initEditOfferingModal(o, id, state){
	initEditOfferingTogglesAndDropdowns(1);
	initEditOfferingTogglesAndDropdowns(2);
	
	if(state === "1"){ //meaning temporary offering lang. not db offering ung eeditin
		$('#editOfferingModalTitle').text("Edit " + o.courseCode + " " + o.section);
		$('#degreeProgramEO').val(o.degreeProgram);
		$('#batchEO').val(o.batch);
		$('#termEO').val(o.term);
		$('#sectionEO').val(o.section);
		$('#statusEO').val(o.status);
		$('#remarksEO').val(o.remarks);
		$('#saveToDatabaseButton').hide();
		
	}
	/***************POPULATE TIME BLOCKS**********************/
	if(o.daysList1.length === 0 && o.daysList2.length === 0){
		populateTimeBlockEditOfferingModal(id, "none", "none");
	}else if(o.daysList1.length != 0 && o.daysList2.length === 0){
		populateTimeBlockEditOfferingModal(id, o.timeSlot1, "none");
	}else if(o.daysList1.length == 0 && o.daysList2.length != 0){
		populateTimeBlockEditOfferingModal(id, "none", o.timeSlot2);
	}else{
		populateTimeBlockEditOfferingModal(id, o.timeSlot1, o.timeSlot2);
	}
    /***************POPULATE TIME BLOCKS**********************/
	/***************TOGGLE DAY BUTTON**********************/
	$.each(o.daysList1, function(i, currDay){
		toggleEditOfferingClassDay(currDay, 1);
	});
	$.each(o.daysList2, function(i, currDay){
		toggleEditOfferingClassDay(currDay, 2);
	});
	
	/***************TOGGLE DAY BUTTON**********************/
}

function toggleEditOfferingClassDay(day, list){ //true or false
	var disable = 1;
	
	if(list === 1){
		disable = 2;
	}
	
	if(day === "M"){
		$('#toggle'+ list +'MEO').bootstrapToggle('on');
		$('#toggle'+ disable +'MEO').bootstrapToggle('disable');
	}else if(day === "T"){
		$('#toggle'+ list +'TEO').bootstrapToggle('on');
		$('#toggle'+ disable +'TEO').bootstrapToggle('disable');
	}else if(day === "W"){
		$('#toggle'+ list +'WEO').bootstrapToggle('on');
		$('#toggle'+ disable +'WEO').bootstrapToggle('disable');
	}else if(day === "H"){
		$('#toggle'+ list +'HEO').bootstrapToggle('on');
		$('#toggle'+ disable +'HEO').bootstrapToggle('disable');
	}else if(day === "F"){
		$('#toggle'+ list +'FEO').bootstrapToggle('on');
		$('#toggle'+ disable +'FEO').bootstrapToggle('disable');
	}else if(day === "S"){
		$('#toggle'+ list +'SEO').bootstrapToggle('on');
		$('#toggle'+ disable +'SEO').bootstrapToggle('disable');
	}
}

function populateTimeBlockEditOfferingModal(id, selectedTimeBlock1, selectedTimeBlock2){
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateTimeBlockEODropdown',
        success: function (data) {
        	$("#timeBlock1EODropdown").empty(); //removes all options
        	$("#timeBlock2EODropdown").empty();

        	if(selectedTimeBlock1 === "none"){
	        	var newoption = "<option selected id=\""+id+"-timeBlock1"+"\">none</option>";
        	}else{
        		var newoption = "<option id=\""+id+"-timeBlock1"+"\">none</option>";
        	}
        	
        	if(selectedTimeBlock2 === "none"){
	        	var newoption2 = "<option selected id=\""+id+"-timeBlock2"+"\">none</option>";
        	}else{
        		var newoption2 = "<option id=\""+id+"-timeBlock2"+"\">none</option>";
        	}
        	
        	$("#timeBlock1EODropdown").append(newoption);
    		$("#timeBlock2EODropdown").append(newoption2);
    		
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedTimeBlock1 === currOption){
        			var newoption = "<option selected id=\""+id+"-timeBlock1"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option id=\""+id+"-timeBlock1"+"\">" + currOption + "</option>";
            	}
        		
        		if(selectedTimeBlock2 === currOption){
        			var newoption2 = "<option selected id=\""+id+"-timeBlock2"+"\">" + currOption + "</option>";
            	}else{
            		var newoption2 = "<option id=\""+id+"-timeBlock2"+"\">" + currOption + "</option>";
            	}
        		
        		$("#timeBlock1EODropdown").append(newoption);
        		$("#timeBlock2EODropdown").append(newoption2);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
}

function saveTemporaryOffering(){

	var arr = [];
	var id = $('#inputTempOfferingIDDump').val(); 
	arr = id.split('-'); // sa format natin, courseid-appenderID-<cell> = both for class and Id
	
	var degreeProgram = $("#degreeProgramEO").val();
	var section = $("#sectionEO").val();
	//var courseCode = $("degreeProgramEO").text();
	var batch = $("#batchEO").val();
	var term = $("#termEO").val();
	var status = $("#statusEO").val();
	var remarks = $("#remarksEO").val();
	var concatId = arr[0] + "-" + arr[1]; //for checking kasi naka concat ung courseId natin
	
	$.each(tempCourseOfferings, function(i, currObject){

		if(currObject.courseId === concatId){
			//console.log("found");
			var arr2 = concatId.split('-'); //second parameter is the appender and the index
			currObject.degreeProgram = degreeProgram;
			//currObject.courseCode is just the same so no need to edit
			currObject.section = section;
			currObject.batch = batch;
			currObject.term = term;
			currObject.status = status;
			currObject.remarks = remarks;
			currObject.daysList1 = []; //if the user cliced save again, babalik lang din un mga nakatoggle
			currObject.daysList2 = [];//magstack ung days if di inempty before lagyan ulit
			currObject = saveTemporaryOfferingTimeSlots(currObject, currObject.daysList1, 1);
			currObject = saveTemporaryOfferingTimeSlots(currObject, currObject.daysList2, 2);
			tempCourseOfferings[arr2[1]] = currObject;
		}
	});
	
	updateTemporaryOfferingList();
	emptyEditOfferingModal();
}

function saveTemporaryOfferingTimeSlots(currObject, days, list){
	var timeSlot = "";
	
	if($('#toggle'+list+'MEO').prop('checked')) days.push("M");
	if($('#toggle'+list+'TEO').prop('checked')) days.push("T");
	if($('#toggle'+list+'WEO').prop('checked')) days.push("W");
	if($('#toggle'+list+'HEO').prop('checked')) days.push("H");
	if($('#toggle'+list+'FEO').prop('checked')) days.push("F");
	if($('#toggle'+list+'SEO').prop('checked')) days.push("S");
	
	if(days.length != 0){
		if(list === 1){
			currObject.daysList1 = days;
			currObject.timeSlot1 = $('#timeBlock1EODropdown :selected').text();
		}else if(list === 2){ 
			currObject.daysList2 = days;
			currObject.timeSlot2 = $('#timeBlock2EODropdown :selected').text();
		}
		else{ 
			currObject.daysList1 = [];
			currObject.daysList2 = [];
			currObject.timeSlot1 = "none";
			currObject.timeSlot2 = "none";
		}
	}
	
	return currObject;
}

function emptyEditOfferingModal(){
	$("#degreeProgramEO").val("");
	$("#sectionEO").val("");
	$("#batchEO").val("");
	$("#termEO").val("");
	$("#statusEO").val("");
	$("#remarksEO").val("");
	$("#facultyEO").val("");
	initEditOfferingTogglesAndDropdowns(1);
	initEditOfferingTogglesAndDropdowns(2);
}

function emptyAddNewOfferingsModal(){
	$("#textStartYearANO").val("");
	$("#textEndYearANO").val("");
	$("#textTermANO").val("");
	$("#searchCourseANO").val("");
	
	$("#tableModalANOCoursesList tbody tr").remove();
	$("#tableModalANOFlowchartCoursesList tbody tr").remove();
	$("#tableModalANOOfferingList tbody tr").remove();
	
	appenderID = 0;
	tempCourseOfferings = [];
}


function initEditOfferingTogglesAndDropdowns(list){
	$('#toggle'+ list +'MEO').bootstrapToggle('off');
	$('#toggle'+ list +'TEO').bootstrapToggle('off');
	$('#toggle'+ list +'WEO').bootstrapToggle('off');
	$('#toggle'+ list +'HEO').bootstrapToggle('off');
	$('#toggle'+ list +'FEO').bootstrapToggle('off');
	$('#toggle'+ list +'SEO').bootstrapToggle('off');
	
	$('#toggle'+ list +'MEO').bootstrapToggle('enable');
	$('#toggle'+ list +'TEO').bootstrapToggle('enable');
	$('#toggle'+ list +'WEO').bootstrapToggle('enable');
	$('#toggle'+ list +'HEO').bootstrapToggle('enable');
	$('#toggle'+ list +'FEO').bootstrapToggle('enable');
	$('#toggle'+ list +'SEO').bootstrapToggle('enable');
	$('#timeBlock'+list+'EODropdown').empty();
}


function saveRecentlyEditedTemporaryOfferingCell(id){

	var arr = [];
	arr = id.split('-'); // sa format natin, courseid-appenderID-<cell> = both for class and Id
	var degreeProgram = $('#'+arr[0]+"-"+arr[1]+"-degreeProgram").text();
	var section = $('#'+arr[0]+"-"+arr[1]+"-section").text();
	var courseCode = $('#'+arr[0]+"-"+arr[1]+"-courseCode").text();
	var batch = $('#'+arr[0]+"-"+arr[1]+"-batch").text();
	var term = $('#textTermANO').text();
	var status = $('#'+arr[0]+"-"+arr[1]+"-status").text();
	var remarks = $('#'+arr[0]+"-"+arr[1]+"-remarks").text();
	var concatId = arr[0] + "-" + arr[1]; //for checking kasi naka concat ung courseId natin
	
	$.each(tempCourseOfferings, function(i, currObject){
		if(currObject.courseId === concatId){
			//console.log("found");
			currObject.degreeProgram = degreeProgram;
			currObject.courseCode = courseCode;
			currObject.section = section;
			currObject.batch = batch;
			currObject.term = term;
			currObject.status = status;
			currObject.remarks = remarks;
		}
	});
}

function addNewOfferingsToDB(){
	
	var startYear = $('#textStartYearANO').val();
	var endYear = $('#textEndYearANO').val();
	var term = $('#textTermANO').val();
	var count = 0;
	/*******************EMPTY LIST FIRST TO AVOID DUPLICATES*********************/
	$.ajax({
        type: 'POST',
        dataType: 'json',
        url: 'emptyNewOfferingList',
        success: function (data) {
        	console.log(data);
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	/*******************EMPTY LIST FIRST TO AVOID DUPLICATES*********************/
	
	if(tempCourseOfferings.length != 0){
		var status = false;
		$.each(tempCourseOfferings, function(i, currOffering){
			if(currOffering.daysList1.length === 0){
				currOffering.daysList1.push("ND"); //servlet wont read this kapag walang laman. filter nalang ung ND sa DAO
			}
			if(currOffering.daysList2.length === 0){
				currOffering.daysList2.push("ND");
			}
		
			var arr = [];
			arr = currOffering.courseId.split('-'); //arr[0] is the course id
			$.ajax({
		        type: 'POST',
		        dataType: 'json',
		        url: 'addNewOfferingList',
		        data: {
		        	"startYear": startYear,
		        	"endYear": endYear,
					"term": term,
					"degreeProgram": currOffering.degreeProgram,
					"courseId": arr[0],
					"courseCode": currOffering.courseCode,
					"section": currOffering.section,
					"batch": currOffering.batch,
					"status": currOffering.status,
					"remarks": currOffering.remarks,
					"daysList1": currOffering.daysList1,
					"daysList2": currOffering.daysList2,
					"timeSlot1": currOffering.timeSlot1,
					"timeSlot2": currOffering.timeSlot2
		        },
		        success: function (data) {
		        	//alert(data.response);
		        	/*if(data.response === "success"){
		        		console.log("hi");
		        		count++;
		        	}*/
		        	console.log(data.response);
		        	status = false;
		        },
		    	error: function (data){
		    		console.log(data);
		    		status = false;
		    	}
		    });	
			status = true;
		});
		/*******************ADD ALL LIST VALUES TO DB*********************/
		$.ajax({
	        type: 'POST',
	        dataType: 'json',
	        url: 'saveNewOfferingList',
	        success: function (data) {
	        	console.log(data);
	        },
	    	error: function (data){
	    		console.log(data);
	    	}
	    });
		
	}
	
	updateViewOfferingsPanel();
	emptyAddNewOfferingsModal();
}

function closeModal(id){
	$('#'+id).modal('hide');
	$('body').removeClass('modal-open');
	$('.modal-backdrop').remove();
}
/**************************ADD NEW OFFERINGS*******************************/
/****EVENT LISTENERS FOR SEARCH****/
$('#searchOfferingRA').keyup(function() {
	updateRoomAssignmentModal($('#assignRoomCurrentAYDump').val());
	$("#tableModalRARoomList tbody tr").remove();
});

$('#searchOfferingRA').on('input',function(e){
	updateRoomAssignmentModal($('#assignRoomCurrentAYDump').val());
	$("#tableModalRARoomList tbody tr").remove();
});

$('#searchRoomRA').keyup(function() {
	updateRoomList($('#assignRoomRoomIDDump').val());
});

$('#searchRoomRA').on('input',function(e){
	updateRoomList($('#assignRoomRoomIDDump').val());
});

$('#searchOfferingVO').keyup(function() {
	viewOfferingsInModal($('#viewOfferingsCurrentAYDump').val());
});

$('#searchOfferingVO').on('input',function(e){
	viewOfferingsInModal($('#viewOfferingsCurrentAYDump').val());
});

$('#searchCourseANO').keyup(function() {
	updateAddNewOfferingsCourseList();
});

$('#searchCourseANO').on('input',function(e){
	updateAddNewOfferingsCourseList();
});
/****EVENT LISTENERS FOR SEARCH****/
/******EVENT LISTENERS FOR TABLE******/

/******EVENT LISTENERS FOR TABLE******/
/*********THIS FIXES ANY PROBLEM RELATED TO PARALLAX NOT UPDATING AFTER SCROLL OR DOM UPDATES************/
function fixForParallax(){
	jQuery(window).trigger('resize').trigger('scroll');
}
/*********THESE FIXES ANY PROBLEM RELATED TO MODAL SCROLLBARS************/
$(document).on('show.bs.modal', '.modal', function () {
    var zIndex = 1040 + (10 * $('.modal:visible').length);
    $(this).css('z-index', zIndex);
    setTimeout(function() {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);
});

$(document).on('hidden.bs.modal', '.modal', function () {
    $('.modal:visible').length && $(document.body).addClass('modal-open');
});
/*********THESE FIXES ANY PROBLEM RELATED TO MODAL SCROLLBARS************/