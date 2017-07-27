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

function clickBuildingsAndRooms(id){
	clickSideBar(id);
	
	//hide old Panel by adding the inactivePanel class
	$('.activePanel').addClass('inactivePanel');
	$('.activePanel').removeClass('activePanel');

	//set new Panel to activePanel by removing the inactivePanel class
	$('#panelBuildingsAndRooms').removeClass('inactivePanel');
	$('#panelBuildingsAndRooms').addClass('activePanel');
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getBuildingsAndRooms',
        success: function (data) {
        	var headers = "", bodyStartTag="<tbody>", bodyEndTag="</tbody>";
        	console.log(data);
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
        		
        		rows += "<tr id=\"" + id + "\" class=\"buildingRow\">"+
        				"<td>"+buildingName+"</td>"+
        				"<td>"+buildingCode+"</td>"+
        				"<td>"+roomsAvailable+"</td>"+
        				"<td>" + "<a class=\"btn btn-default\" href=\"\" id=\"" + id + "-view\">View</a>" + "</td>"+  
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

/*********THIS FIXES ANY PROBLEMS RELATED TO PARALLAX NOT UPDATING AFTER SCROLL OR DOM UPDATES************/
function fixForParallax(){
	jQuery(window).trigger('resize').trigger('scroll');
}