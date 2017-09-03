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

function closeModal(id){
	$('#'+id).modal('hide');
	$('body').removeClass('modal-open');
	$('.modal-backdrop').remove();
}

/*****VIEW FACULTY*****/
function clickViewFaculty(id){
	clickSideBar(id);
	makeActivePanel("#panelViewFaculty");
	
	populateLoadAY();
}

function getValue(select){
	getListFacultyLoad(select.value);
}

function populateLoadAY(){
	$("#loadAYDropDown").empty();
	$("#loadAYDropDown").append("<option selected> Select Term </option>");
	$.ajax({
        type: 'GET',
        dataType: 'json',
        url: 'getLoadTimeframeList',
        success: function (data) {
        	$.each(data, function(index, currObject){
        		var input = '<option value="' + currObject.startYear + '-' + currObject.endYear + '-' + currObject.term + '" onclick="getListFacultyLoad(this.id);">' + 
        			currObject.startYear + '-' + currObject.endYear + ' T' + currObject.term + '</option>';
        		$("#loadAYDropDown").append(input);
        	})
        },
    	error: function (data){
    		console.log(data);
    	}
	});
}

function getListFacultyLoad(id){
	console.log("get list faculty");
	$.ajax({
        type: 'GET',
        dataType: 'json',
        url: 'getFacultyList',
        data: {
        	"term": id
        },
        success: function (data) {
        	$.each(data, function(index, currObject){
        		var row = '';
        		var leaveType = '';

        		if(currObject.load.isOnLeave === '1'){
        			row = '<tr class="alert-danger">';
        			leaveType = currObject.load.leaveType;
        		} else {
        			row = "<tr>";
        			leaveType = "-";
        		}
        		
        		row += '<td>' + currObject.firstName + '<br>' + currObject.lastName + '</td>';
        		row += '<td>' + currObject.load.totalLoad + '</td>';
        		row += '<td>' + currObject.load.deloading + '</td>';
        		row += '<td>' + currObject.facultyType + '</td>';
    			row += '<td>' + leaveType + '</td>';
    			row += "</tr>";
        		
        		$("#tableFacultyLoad tbody").append(row);
        	})
        },
    	error: function (data){
    		console.log(data);
    	}
	});		
}

/*****VIEW FACULTY*****/

/**************************FACULTY ASSIGNMENT**********************************/
function clickViewFacultyAssignment(id){
	clickSideBar(id);
	makeActivePanel("#panelViewFacultyAssignment");
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getAllAcademicYears',
        success: function (data) {
        	var headers = "";
        	//console.log(data);
        	$("#tableViewFacultyAssignment tbody tr").remove(); //removes all tr but not thead
        	
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
        				if(isPublished === "1"){ //because unPublished count is the count of all unpublished
        					rows+="<td><a class=\"btn btn-default\" type=\"button\" onclick=\"updateFacultyAssignmentModal(this.id)\" data-toggle=\"modal\" data-target=\"#facultyAssignmentModal\" data-backdrop=\"static\" data-keyboard=\"false\" id=\"" + id + "-assignfaculty\" disabled><span><i class=\"fa fa-map-pin\"></i></span> Assign Faculty</a></td>";  
        				}else{
        					rows+="<td><a class=\"btn btn-default\" type=\"button\" onclick=\"updateFacultyAssignmentModal(this.id)\" data-toggle=\"modal\" data-target=\"#facultyAssignmentModal\" data-backdrop=\"static\" data-keyboard=\"false\" id=\"" + id + "-assignfaculty\"><span><i class=\"fa fa-map-pin\"></i></span> Assign Faculty</a></td>";  
        				}
        				
        				rows+="<tr>";
        		$(rows).appendTo("#tableViewFacultyAssignment tbody");
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	fixForParallax();
}

function updateFacultyAssignmentModal(id){
	var arr = [];
	arr = id.split('-'); //arr[0] would be startyear, [1], endyear, [2] term, [3] batch, [4] extraneous text
	var startYear = arr[0];
	var endYear = arr[1];
	var term = arr[2];
	var batch = arr[3];
	var concatId = startYear + "-" + endYear + "-" + term + "-" + batch;
	
	$('#assignFacultyCurrentAYDump').val(concatId); //for search Listeners cause di nila alam ung ID
	var selectedFacultyType = $('#facultyTypeFADropdown :selected').text();
	var selectedDepartment = $('#departmentFADropdown :selected').text();
	var selectedCollege = $('#collegeFADropdown :selected').text();
	var searchFaculty = $('#searchFacultyFA').val();
	var searchOffering = $('#searchOfferingFA').val();
	
	if(searchOffering.length === 0) searchOffering = " ";
	if(searchFaculty.length === 0) searchFaculty = " ";
	
	//to initially disable the dropdowns and the input of rooms. Once the user clicks an offering, it will become enabled
	$('#departmentFADropdown').attr('disabled', true);
	$('#collegeFADropdown').attr('disabled', true);
	$('#facultyTypeFADropdown').attr('disabled', true);
	$('#searchFacultyFA').prop('disabled', true);
	
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
        	$("#tableModalFAOfferingList tbody tr").remove(); //removes all tr but not thead

        	$.each(data, function(i, currObject){
        		
        		var id = currObject.offeringId;
        		var batch = currObject.batch;
        		var course = currObject.course.courseCode;
        		var section = currObject.section;
        		var facultyName = currObject.faculty.firstName + " " + currObject.faculty.lastName;
        		
        		$.each(currObject.days, function(j, currDay){
        			var rows = "";
        			rows += "<tr id=\"" + id + "-id\" class=\"clicked-faculty-inactive facultyRow "+id+"-id\" onclick=\"clickOffering(this.id)\">"+
    				"<td>"+batch+"</td>"+
    				"<td>"+course+"</td>"+
    				"<td>"+section+"</td>"+
    				"<td>"+currDay.classDay+"</td>"+
    				"<td>"+currDay.beginTime+"</td>"+
    				"<td>"+currDay.endTime+"</td>";
    				
    				if(currDay.room.roomCode === "No Room") rows+="<td>-</td>";
    				else rows+="<td>"+currDay.room.roomCode+"</td>";
        			
    				rows+= "<td>"+facultyName+"</td>";
    				rows+="<tr>";
		    		//console.log(rows);
		    		$(rows).appendTo("#tableModalFAOfferingList tbody");
        		});
        		
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	
	fixForParallax();
}

function updateFacultyList(facultyId){
	var arr = [];
	console.log(facultyId);
	arr = facultyId.split('-'); //arr[0] is ID
	
	$('#assignFacultyFacultyIDDump').val(facultyId); //for search Listeners cause di nila alam ung ID
	var selectedFacultyType = $('#facultyTypeFADropdown :selected').text();
	var selectedDepartment = $('#departmentFADropdown :selected').text();
	var selectedCollege = $('#collegeFADropdown :selected').text();
	var searchFaculty = $('#searchFacultyFA').val();
	var facultyType = "";
	
	if(selectedFacultyType === "Full Time"){
		facultyType = "FT";
	}else if(selectedFacultyType === "Part Time"){
		facultyType = "PT";
	}else if(selectedFacultyType === "Half Time"){
		facultyType = "HT";
	}else{
		facultyType = "FT";
	}
	
	console.log("facultyType: " + facultyType);
	
	populateFacultyAssignmentModalDropdown(facultyId, selectedFacultyType, selectedDepartment, selectedCollege);
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getFacultyListWithKey',
        data: {
        	"offeringId": arr[0],
			"searchKeyword": searchFaculty,
			"facultyType": facultyType,
			"department": selectedDepartment,
			"college": selectedCollege
        },
        success: function (data) {
        	
        	$("#tableModalFAFacultyList tbody tr").remove(); //removes all tr but not thead

        	$.each(data, function(i, currObject){
        		console.log("deptCode: " + currObject.department);
        		
        		var rows = "";
        		var id = currObject.facultyId;
        		var lastName = currObject.lastName;
        		var firstName = currObject.firstName;
        		var name = firstName + " " + lastName;
        		var department = currObject.department.deptCode;
        		console.log(currObject.userId);
        		var college = currObject.college.collegeCode;
        		var facultyType = currObject.userType;
        		var currentLoad = "0";
        		
    			rows += "<tr id=\"" + id + "-id\" class=\"clicked-faculty-inactive facultyRow "+id+"-id\">";
				    			
				rows+=  "<td>"+name+"</td>"+
						"<td>"+facultyType+"</td>"+
						"<td>"+college+"</td>"+
						"<td>"+department+"</td>"+
						"<td>"+currentLoad+"</td>"+
						"<td><a class=\"btn btn-default\" type=\"button\" onclick=\"assignThisFacultyToCourse(this.id)\" id=\"" + id + "-assign\">Assign</a>" + "</td>"+
						"<tr>";
	    		//console.log(rows);
	    		$(rows).appendTo("#tableModalFAFacultyList tbody");
        		
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
}

function populateFacultyAssignmentModalDropdown(id, selectedFacultyType, selectedDepartment, selectedCollege){
	//populate Faculty Type
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateFacultyTypeDropdown',
        success: function (data) {
        	$("#facultyTypeFADropdown").empty(); //removes all options
        	$("#facultyTypeFADropdown").removeAttr("onChange");
        	$("#facultyTypeFADropdown").attr("onChange", "return updateFacultyList(\""+id+"-type\")");
        	
        	if(selectedFacultyType === "All"){
        		$("#facultyTypeFADropdown").prepend("<option selected onclick=\"updateFacultyList(this.id)\" id=\""+id+"-type"+"\">All</option>");
        	}else{
        		$("#facultyTypeFADropdown").prepend("<option onclick=\"updateFacultyList(this.id)\" id=\""+id+"-type"+"\">All</option>");
        	}
        	
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedFacultyType === currOption){
        			var newoption = "<option selected onclick=\"updateFacultyList(this.id)\" id=\""+id+"-type"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"updateFacultyList(this.id)\" id=\""+id+"-type"+"\">" + currOption + "</option>";
            	}
        		
        		$("#facultyTypeFADropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	
	//populate Department
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateDepartmentsDropdown',
        success: function (data) {
        	$("#departmentFADropdown").empty(); //removes all options
        	$("#departmentFADropdown").removeAttr("onChange");
        	$("#departmentFADropdown").attr("onChange", "return updateFacultyList(\""+id+"-type\")");
        	
        	if(selectedDepartment === "All"){
        		$("#departmentFADropdown").prepend("<option selected onclick=\"updateFacultyList(this.id)\" id=\""+id+"-dept"+"\">All</option>");
        	}else{
        		$("#departmentFADropdown").prepend("<option onclick=\"updateFacultyList(this.id)\" id=\""+id+"-dept"+"\">All</option>");
        	}
        	
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedDepartment === currOption){
        			var newoption = "<option selected onclick=\"updateFacultyList(this.id)\" id=\""+id+"-dept"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"updateFacultyList(this.id)\" id=\""+id+"-dept"+"\">" + currOption + "</option>";
            	}
        		
        		$("#departmentFADropdown").append(newoption);
        	});
        },
    	error: function (data){
    		console.log(data);
    	}
    });
	
	//populate Department
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'populateCollegesDropdown',
        success: function (data) {
        	$("#collegeFADropdown").empty(); //removes all options
        	$("#collegeFADropdown").removeAttr("onChange");
        	$("#collegeFADropdown").attr("onChange", "return updateFacultyList(\""+id+"-type\")");
        	
        	if(selectedCollege === "All"){
        		$("#collegeFADropdown").prepend("<option selected onclick=\"updateFacultyList(this.id)\" id=\""+id+"-dept"+"\">All</option>");
        	}else{
        		$("#collegeFADropdown").prepend("<option onclick=\"updateFacultyList(this.id)\" id=\""+id+"-dept"+"\">All</option>");
        	}
        	
        	$.each(data, function(i, currOption){
        		var rows = "";
        		
        		if(selectedCollege === currOption){
        			var newoption = "<option selected onclick=\"updateFacultyList(this.id)\" id=\""+id+"-dept"+"\">" + currOption + "</option>";
            	}else{
            		var newoption = "<option onclick=\"updateFacultyList(this.id)\" id=\""+id+"-dept"+"\">" + currOption + "</option>";
            	}
        		
        		$("#collegeFADropdown").append(newoption);
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
	$('#collegeFADropdown').attr('disabled', false);
	$('#departmentFADropdown').attr('disabled', false);
	$('#facultyTypeFADropdown').attr('disabled', false);
	$('#searchFacultyFA').prop('disabled', false);
	
	//set hidden input form for later use/for assigning
	$('#assignFacultyOfferingIDDump').val(id);
	
	updateFacultyList(id);
}

function exitFacultyAssignmentModal(){
	//this function empties the dropdown list again and sets "All" as the default selected option
	$("#facultyTypeFADropdown").empty(); //removes all options
	$("#facultyTypeFADropdown").removeAttr("onChange");
	$("#facultyTypeFADropdown").attr("onChange", "return updateFacultyList(\"\")");
	$("#facultyTypeFADropdown").prepend("<option selected>All</option>");
	
	$("#departmentFADropdown").empty(); //removes all options
	$("#departmentFADropdown").removeAttr("onChange");
	$("#departmentFADropdown").attr("onChange", "return updateFacultyList(\"\")");
	$("#departmentFADropdown").prepend("<option selected>All</option>");
	
	$("#collegeFADropdown").empty(); //removes all options
	$("#collegeFADropdown").removeAttr("onChange");
	$("#collegeFADropdown").attr("onChange", "return updateFacultyList(\"\")");
	$("#collegeFADropdown").prepend("<option selected>All</option>");
	
	$("#tableModalFAFacultyList tbody tr").remove();
	$("#tableModalFAOfferingList tbody tr").remove();
	
	$("#searchFacultyFA").val("");
	$("#searchOfferingFA").val("");
	
	closeModal("facultyAssignmentModal");
}

function assignThisFacultyToCourse(id){
	console.log("FA offering: " + id);
	var arr = [], arr2 = [];
	
	arr = id.split('-');
	var facultyId = arr[0]; //roomID
	
	offeringId = $('#assignFacultyOfferingIDDump').val();
	arr2 = offeringId.split('-');
	var offeringId = arr2[0]; //clicked OfferingID
	
	$.ajax({
        type: 'POST',
        dataType: 'json',
        cache: false,
        url: 'initiateFacultyAssignment',
        data: {
        	"offeringId": offeringId,
			"facultyId": facultyId,
        },
        success: function (data) {
        	console.log($('#assignFacultyCurrentAYDump').val());
        	updateFacultyAssignmentModal($('#assignFacultyCurrentAYDump').val());
        	clickOffering($('#assignFacultyOfferingIDDump').val());
        },
    	error: function (data){
    		console.log(data);
    	}
    });
}

/**************************FACULTY ASSIGNMENT**********************************/

/****EVENT LISTENERS FOR SEARCH****/
$('#searchOfferingFA').keyup(function() {
	updateFacultyAssignmentModal($('#assignFacultyCurrentAYDump').val());
});

$('#searchOfferingFA').on('input',function(e){
	updateFacultyAssignmentModal($('#assignFacultyCurrentAYDump').val());
});

$('#searchFacultyFA').keyup(function() {
	updateFacultyList($('#assignFacultyFacultyIDDump').val());
});

$('#searchFacultyFA').on('input',function(e){
	updateFacultyList($('#assignFacultyFacultyIDDump').val());
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