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
    
    //hide buttons from view faculty
    $('#btnFacultyInfoRemoveLoad').hide();
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
    $("#tableFacultyLoad tbody tr").remove(); //removes all tr but not thead; for refresh or sudden click at sidebar
    populateLoadAY();
    
    //hide buttons from view faculty
    $('#btnFacultyInfoRemoveLoad').hide();
}

function clickViewOfferings(id){
    clickSideBar(id);
    populateLoadAY2();
    makeActivePanel("#panelCVCViewCourses");
    $("#tableCVCOfferingList tbody tr").remove(); //removes all tr but not thead; for refresh or sudden click at sidebar
    
    //hide buttons from view faculty
    $('#btnFacultyInfoRemoveLoad').hide();
}

function getValue(select){
    getListFacultyLoad(select.value);
}

/* This is for the view course offerings */
function getValue2(select){
    $("#tableCVCOfferingList tbody tr").remove(); //removes all tr but not thead; for change of selected term
    getCVCOfferings(select.value);
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

/* For view offerings */
function populateLoadAY2(){
    $("#loadAYDropDownCVCOfferings").empty();
    $("#loadAYDropDownCVCOfferings").append("<option selected> Select Term </option>");
    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: 'getLoadTimeframeList',
        success: function (data) {
            $.each(data, function(index, currObject){
                var input = '<option value="' + currObject.startYear + '-' + currObject.endYear + '-' + currObject.term + '" onclick="getCVCOfferings(this.id);">' + 
                    currObject.startYear + '-' + currObject.endYear + ' T' + currObject.term + '</option>';
                $("#loadAYDropDownCVCOfferings").append(input);
            })
        },
        error: function (data){
            console.log(data);
        }
    });
}

function getListFacultyLoad(id){
    //console.log("get list faculty");
    
    $("#searchKeyViaFacultyListView").val(id); // for search faculty
    
    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: 'getFacultyList',
        data: {
            "term": id // id contains start year, end year, and term
        },
        success: function (data) {
            $("#tableFacultyLoad tbody tr").remove(); //removes all tr but not thead
            $.each(data, function(index, currObject){
                var row = '';
                var leaveType = '';

                
                if(currObject.load.isOnLeave === '1'){  
                    row = '<tr class="alert-danger" onclick="viewFacultyInformationPanel(this)" data-toggle=\"modal\" data-target=\"#facultyViewModal\" data-backdrop=\"static\" data-keyboard=\"false"\>';
                    leaveType = currObject.load.leaveType;
                } else {
                    row = '<tr onclick="viewFacultyInformationPanel(this)" data-toggle=\"modal\" data-target=\"#facultyViewModal\" data-backdrop=\"static\" data-keyboard=\"false"\>';
                    leaveType = "-";
                }
                
                row += '<td style="display:none">' + currObject.facultyId + '</td>' // added this
                row += '<td>' + currObject.firstName + " " + currObject.lastName + '</td>';
                //row += '<td>' + currObject.firstName + " " + '<br>' + currObject.lastName + '</td>';
                row += '<td>' + currObject.load.totalLoad + '</td>';
                row += '<td>' + currObject.load.deloading + '</td>';
                row += '<td>' + currObject.facultyType + '</td>';
                row += '<td>' + leaveType + '</td>';
                row += '</tr>';
                
                $("#tableFacultyLoad tbody").append(row);
            })
        },
        error: function (data){
            console.log(data);
        }
    });     
}

function getCVCOfferings(id){
    $.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getCVCOfferings',
        data: {
            "term": id
        },
        success: function (data) {
            var headers = "";
            //console.log(data);
            $("#tableCVCOfferingList tbody tr").remove(); //removes all tr but not thead
            console.log(data.size);

            $.each(data, function(i, currObject){
                
                var id = currObject.offeringId;
                var batch = currObject.batch;
                var course = currObject.course.courseCode;
                var section = currObject.section;
                console.log("id: " + id + "section: " + section);
                var facultyName = currObject.faculty.firstName + " " + currObject.faculty.lastName;
                
                $.each(currObject.days, function(j, currDay){
                    var rows = "";
                    rows += "<tr id=\"" + id + "-id\" class=\"clicked-faculty-inactive facultyRow "+id+"-id\" onclick=\"clickOfferingViaViewOffering(this.id)\">"+
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
                    $(rows).appendTo("#tableCVCOfferingList tbody");
                });
                
            });
        },
        error: function (data){
            console.log(data);
        }
    });
    
    fixForParallax();
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
                        //console.log(unPublishedCount);
                        if(isPublished === "0"){ //because unPublished count is the count of all unpublished // i made this to 0 for now
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
    
    // to easily access start year, end year and term (eyo)
    console.log(startYear + " " + endYear + " " + term);
    $('#assignFacultyStartYearValue').val(startYear);
    $('#assignFacultyEndYearValue').val(endYear);
    $('#assignFacultyTermValue').val(term);
    
    console.log($('#assignFacultyStartYearValue').val() + $('#assignFacultyEndYearValue').val() + $('#assignFacultyTermValue').val());
    
    $('#assignFacultyCurrentAYDump').val(concatId); //for search Listeners cause di nila alam ung ID
    var selectedFacultyType = $('#facultyTypeFADropdown :selected').text();
    var selectedDepartment = $('#departmentFADropdown :selected').text();
    var selectedCollege = $('#collegeFADropdown :selected').text();
    var searchFaculty = $('#searchFacultyFA').val();
    var searchOffering = $('#searchOfferingFA').val();
    
    if(searchOffering.length === 0) searchOffering = "";
    if(searchFaculty.length === 0) searchFaculty = "";
    
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
    //console.log(facultyId);
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
    
    //console.log("facultyType: " + facultyType);
    
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

function clickOfferingViaFacultyInfo(id) {
    // Note: This is a copy of the function "clickOffering"; just that the dropdowns-related code were removed.
    
    $('.clicked-offering-active').addClass('clicked-offering-inactive');
    $('.clicked-offering-active').removeClass('clicked-offering-active');
    
    $('.'+id).addClass('clicked-offering-active');
    $('.'+id).removeClass('clicked-offering-inactive');
    
    //set hidden input form for later use/for assigning
    $('#assignFacultyOfferingIDDumpViaFacultyInfo').val(id); // offering id
    
    $('#btnFacultyInfoAssign').show();
    
    
}

function clickLoadViaFacultyInfo(id) {  // id is the table row clicked
    
    $('#tableCurrentFacultyLoad tr').addClass('clicked-offering-inactive');
    $('#tableCurrentFacultyLoad tr').removeClass('clicked-offering-active');
    
    $(id).addClass('clicked-offering-active');
    $(id).removeClass('clicked-offering-inactive');
    
    $('#btnFacultyInfoRemoveLoad').show(); 
    
    // get offering id from the row
    // get data from row clicked/selected, and put it in an array
    var tableData = $('td',id).map(function(index,value) {
        return $(value).text();
    });
    
    var offeringId = $.trim(tableData[0]);
    $('#offeringIdViaFacultyView').val(offeringId);
    
}

function clickOfferingViaViewOffering(id){
    //$('.clicked-offering-active').removeClass('success');
    $('.clicked-offering-active').addClass('clicked-offering-inactive');
    $('.clicked-offering-active').removeClass('clicked-offering-active');
    //$('.sideBar-cell-color').removeClass('sideBar-cell-color');

    $('.'+id).addClass('clicked-offering-active');
    $('.'+id).removeClass('clicked-offering-inactive');
    //$('.'+id).addClass('success');
    //$('#'+id).addClass('sideBar-cell-color');
    
    
    //set hidden input form for later use/for assigning
    //$('#assignFacultyOfferingIDDump').val(id);
    
    //updateFacultyList(id);
}


function removeLoadFromThisFaculty() {
    //get currently selected offering id
    var offeringId = $('#offeringIdViaFacultyView').val();
    var facultyId = $('#facultyIdViaFacultyView').val();
    var startYear = $('#startYearViaFacultyView').val();
    var endYear = $('#endYearViaFacultyView').val();
    var term = $('#termViaFacultyView').val();

    
    
    $.ajax({
        type: 'POST',
        dataType: 'json',
        cache: false,
        url: 'removeLoadFromFaculty',
        data: {
            "offeringId": offeringId,
            "facultyId": facultyId,
            "startYear": startYear,
            "endYear": endYear,
            "term": term
        },
        success: function (data) {
            updateCurrentFacultyLoad();
        },
        error: function (data){
            console.log(data);
        }
    });
    
    $('#btnFacultyInfoRemoveLoad').hide();
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
    
    //updateCurrentFacultyLoad();
    
    closeModal("facultyAssignmentModal");
}

function exitFacultyInfoAssignmentModal(){
    //this function empties the dropdown list again and sets "All" as the default selected option
    // Note: This function is a copy of the "exitFacultyAssignmentModal" function for the assignment in the faculty information assignment modal.
    
    
    $("#tableModalFAFacultyList tbody tr").remove();
    $("#tableModalFAOfferingList tbody tr").remove();
    
    //$("#searchFacultyFA").val("");
    $("#searchOfferingFA").val("");
    
    updateCurrentFacultyLoad();
    
    closeModal("facultyInfoAssignmentModal");
}

function assignThisFacultyToCourse(id){
    console.log("FA offering: " + id);
    var arr = [], arr2 = [];
    
    arr = id.split('-');
    var facultyId = arr[0]; //roomID
    
    offeringId = $('#assignFacultyOfferingIDDump').val();
    arr2 = offeringId.split('-');
    var offeringId = arr2[0]; //clicked OfferingID
    
    
    console.log($('#assignFacultyStartYearValue').val() + $('#assignFacultyEndYearValue').val() + $('#assignFacultyTermValue').val());
    
    var startYear = $('#assignFacultyStartYearValue').val();
    var endYear = $('#assignFacultyEndYearValue').val();
    var term  = $('#assignFacultyTermValue').val();
    
    
    console.log("offeringId = " + offeringId + " facultyId = " +  facultyId + " startYear = " + startYear + " endYear = " + endYear + " term = " + term);
    
    $.ajax({
        type: 'POST',
        dataType: 'json',
        cache: false,
        url: 'initiateFacultyAssignment',
        data: {
            "offeringId": offeringId, 
            "facultyId": facultyId,
            "startYear": startYear,
            "endYear" : endYear,
            "term" : term
        },
        success: function (data) {
            console.log($('#assignFacultyCurrentAYDump').val());
            updateFacultyAssignmentModal($('#assignFacultyCurrentAYDump').val());
            clickOffering($('#assignFacultyOfferingIDDump').val());
            console.log("Faculty Assignment Success!");
        },
        error: function (data){
            console.log(data);
        }
    });
}


function assignThisFacultyToCourseViaFacultyInfo(){
    //console.log("FA offering: " + id);
    //var arr = [], arr2 = [];
    
    
    var arr = [];
    
    //arr = id.split('-');
    var facultyId = $('#assignFacultyViaInfoFacultyId').val(); //facultyId
    
    offeringId = $('#assignFacultyOfferingIDDumpViaFacultyInfo').val();
    arr = offeringId.split('-');
    var offeringId = arr[0]; //clicked OfferingID
    
    var startYear = $('#assignFacultyViaInfoStartYear').val();
    var endYear = $('#assignFacultyViaInfoEndYear').val();
    var term = $('#assignFacultyViaInfoTerm').val();
    
    console.log("offeringId = " + offeringId + " facultyId = " +  facultyId + " startYear = " + startYear + " endYear = " + endYear + " term = " + term);
    
    $.ajax({
        type: 'POST',
        dataType: 'json',
        cache: false,
        url: 'initiateFacultyAssignment',
        data: {
            "offeringId": offeringId,
            "facultyId": facultyId,
            "startYear": startYear,
            "endYear" : endYear,
            "term" : term
        },
        success: function (data) {
            //console.log($('#assignFacultyCurrentAYDump').val());
            updateFacultyAssignmentModalViaFacultyInfo();
            clickOfferingViaFacultyInfo($('#assignFacultyOfferingIDDumpViaFacultyInfo').val());
        },
        error: function (data){
            console.log(data);
        }
    });
}

function updateFacultyAssignmentModalViaFacultyInfo() {
    // Update the offerings after a successful faculty assignment (via faculty info).
    
    console.log("updateFacultyInfoModalViaFacultyInfo...");
    
    var searchOffering = $('#searchOfferingFAViaFacultyInfo').val();
    if(searchOffering.length === 0) searchOffering = " ";
    
    
    var start_year = $('#assignFacultyViaInfoStartYear').val();
    var end_year = $('#assignFacultyViaInfoEndYear').val();
    var term = $('#assignFacultyViaInfoTerm').val();
    
    console.log("meep");
    console.log(start_year);
    console.log(end_year);
    console.log(term);
    console.log(searchOffering);
    
    //populate offerings table
    $.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getOfferingListWithKey',
        data: {
            "startYear": start_year,
            "endYear": end_year,
            "term": term,
            "searchKeyword": searchOffering
        },
        success: function (data) {
            console.log("success!");
            var headers = "";
            //console.log(data);
            $("#tableModalFAOfferingListViaFacultyInfo tbody tr").remove(); //removes all tr but not thead

            $.each(data, function(i, currObject){
                
                var id = currObject.offeringId;
                var batch = currObject.batch;
                var course = currObject.course.courseCode;
                var section = currObject.section;
                var facultyName = currObject.faculty.firstName + " " + currObject.faculty.lastName;
                
                $.each(currObject.days, function(j, currDay){
                    var rows = "";
                    rows += "<tr id=\"" + id + "-id\" class=\"clicked-faculty-inactive facultyRow "+id+"-id\" onclick=\"clickOfferingViaFacultyInfo(this.id)\">"+
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
                    $(rows).appendTo("#tableModalFAOfferingListViaFacultyInfo tbody"); 
                    console.log("appended in update!");
                });
                
            });
        },
        error: function (data){
            console.log(data);
        }
    });
    
    
    
    fixForParallax();
    
    
}

/**************************FACULTY ASSIGNMENT**********************************/

/**************************FACULTY VIEW**********************************/



function viewFacultyInformationPanel(row) {
    
    //Make this panel active
    
    //hide old Panel by adding the inactivePanel class
    $('.activePanel').addClass('inactivePanel');
    $('.activePanel').removeClass('activePanel');
    
    //set new Panel to activePanel by removing the inactivePanel class
    $('#panelViewFacultyInfo').removeClass('inactivePanel');
    $('#panelViewFacultyInfo').addClass('activePanel');
    
     fixForParallax(); // lol idk why
    
    // get data from row clicked/selected, and put it in an array
    var tableData = $('td',row).map(function(index,value) {
        return $(value).text();
    });
    
    var facultyId = $.trim(tableData[0]);
    var facultyName = $.trim(tableData[1]); 
    var currentLoad = $.trim(tableData[2]);
    
    //set label values in the panel
     $('#faculty_name').html(facultyName);
     $('#current_load').html(currentLoad);
    
    //get academic year and term
    var selectedSYandTerm = $('#loadAYDropDown').val();
    var arr = [];
    arr = selectedSYandTerm.split('-'); //arr[0] would be startyear, [1], endyear, [2] term, [3] extraneous text
    var start_year = arr[0];
    var end_year = arr[1];
    var term = arr[2];
    
//  //setting onclick event for the "AssignFaculty" button
//  $('btnAssignFaculty').removeAttr('onclick');
//  $('btnAssignFaculty').click(viewFacultyInfoAssignment(facultyId,term,start_year,end_year));
    $('#btnAssignFaculty').removeAttr('onclick');
    $('#btnAssignFaculty').attr('onClick', 'viewFacultyInfoAssignmentModal()'); // this does not send the actual values brb
    
    
    // For updating after a faculty assignment is done.
    
    // in info panel
    $('#facultyIdViaFacultyView').val(facultyId);
    $('#startYearViaFacultyView').val(start_year);
    $('#endYearViaFacultyView').val(end_year);
    $('#termViaFacultyView').val(term);
    
    
    
    //in the modal
    $('#assignFacultyViaInfoFacultyId').val(facultyId);
    $('#assignFacultyViaInfoStartYear').val(start_year);
    $('#assignFacultyViaInfoEndYear').val(end_year);
    $('#assignFacultyViaInfoTerm').val(term);
    
//  console.log($('#assignFacultyViaInfoFacultyId').val());
//  console.log($('#assignFacultyViaInfoStartYear').val());
//  console.log($('#assignFacultyViaInfoEndYear').val());
//  console.log($('#assignFacultyViaInfoTerm').val());
    
    
    
    //populate facultyInfo panel
    $.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getCurrentFacultyLoad',
        data: {
            "facultyId": facultyId, //getting the term and SY
            "term": term,
            "startYear": start_year,
            "endYear": end_year,
        },
        success: function (data) {
            
            $("#tableCurrentFacultyLoad tbody tr").remove(); //removes all tr but not thead 
            $.each(data, function(i, currObject){
                
                var course_code = currObject.course_code;
                var rows = "";
                
                rows += "<tr onclick=\"clickLoadViaFacultyInfo(this)\" >";
                                
                rows+=  '<td style="display:none">' +  currObject.offeringId + '</td>'+
                        "<td>" + course_code + "</td>"+
                        "<td>" + term + "</td>"+
                        "<td>" + start_year + "-" + end_year + "</td>"+
                        "<tr>";
                //console.log(rows);
                $(rows).appendTo("#tableCurrentFacultyLoad tbody");
                
            });
        },
        error: function (data){
            console.log(data);
        }
    });
}

function updateCurrentFacultyLoad() {
    
    // get IDs
    
    var facultyId = $('#facultyIdViaFacultyView').val();
    var startYear = $('#startYearViaFacultyView').val();
    var endYear = $('#endYearViaFacultyView').val();
    var term = $('#termViaFacultyView').val();
    
    
    // for the current load

        
    $.ajax({
        type : 'GET',
        dataType : 'json',
        cache : false,
        url : 'getCurrentFacultyLoadSpecific',
        data : {
            "facultyId" : facultyId,
            "startYear" : startYear,
            "endYear" : endYear,
            "term" : term
        },
        success : function(data) {
                var totalLoad = data.totalLoad;
                console.log("Total load: " + totalLoad);
                $('#current_load').html(totalLoad);

        },
        error : function(data) {
            console.log(data);
        }
    });
    
    // for the current load table
    $.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getCurrentFacultyLoad',
        data: {
            "facultyId": facultyId, //getting the term and SY
            "term": term,
            "startYear": startYear,
            "endYear": endYear,
        },
        success: function (data) {
            
            $("#tableCurrentFacultyLoad tbody tr").remove(); //removes all tr but not thead 
            $.each(data, function(i, currObject){
                
                var course_code = currObject.course_code;
                var rows = "";
                
                rows += "<tr onclick=\"clickLoadViaFacultyInfo(this)\" >";
                                
                rows+=  '<td style="display:none">' +  currObject.offeringId + '</td>'+
                        "<td>" + course_code + "</td>"+
                        "<td>" + term + "</td>"+
                        "<td>" + start_year + "-" + end_year + "</td>"+
                        "<tr>";
                //console.log(rows);
                $(rows).appendTo("#tableCurrentFacultyLoad tbody");
                
            });
        },
        error: function (data){
            console.log(data);
        }
    });
}

function viewFacultyInfoAssignmentModal() {
    
    $("#tableModalFAOfferingListViaFacultyInfo tbody tr").remove(); // clear
    $('#facultyInfoAssignmentModal').modal('show');
    $('#btnFacultyInfoAssign').hide();
    
    
    // Get the values for the query
    var facultyId =  $('#assignFacultyViaInfoFacultyId').val();
    var start_year =  $('#assignFacultyViaInfoStartYear').val();
    var end_year =  $('#assignFacultyViaInfoEndYear').val();
    var term =  $('#assignFacultyViaInfoTerm').val();
    
    var searchOffering = $('#searchOfferingFAViaFacultyInfo').val();
    if(searchOffering.length === 0) searchOffering = " ";
    
    
    //populate offerings table
    $.ajax({
        type: 'GET',
        dataType: 'json',
        cache: false,
        url: 'getOfferingListWithKey',
        data: {
            "startYear": start_year,
            "endYear": end_year,
            "term": term,
            "searchKeyword": searchOffering
        },
        success: function (data) {
            var headers = "";
            //console.log(data);
            $("#tableModalFAOfferingListViaFacultyInfo tbody tr").remove(); //removes all tr but not thead

            $.each(data, function(i, currObject){
                
                var id = currObject.offeringId;
                var batch = currObject.batch;
                var course = currObject.course.courseCode;
                var section = currObject.section;
                        
//              console.log(currObject.offeringId);
//              console.log(currObject.section);
//              console.log("before name: " + facultyName);
                var facultyName = currObject.faculty.firstName + " " + currObject.faculty.lastName;
//              console.log("name: " + facultyName);


                $.each(currObject.days, function(j, currDay){
                    var rows = "";
                    rows += "<tr id=\"" + id + "-id\" class=\"clicked-faculty-inactive facultyRow "+id+"-id\" onclick=\"clickOfferingViaFacultyInfo(this.id)\">"+
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
                    $(rows).appendTo("#tableModalFAOfferingListViaFacultyInfo tbody"); 
                });
                
            });
        },
        error: function (data){
            console.log(data);
        }
    });
    
    
    fixForParallax();
    
    
    
}

function updateFacultyListView() { 
    
    // update based on search
    var term = $("#searchKeyViaFacultyListView").val();
    var key = $("#searchFacultyFAViaFacultyInfo").val();
    
    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: 'getFacultyListViewWithKey',
        data: {
            "term": id, // id contains start year, end year, and term
            "key" : key
        },
        success: function (data) {
            $("#tableFacultyLoad tbody tr").remove(); //removes all tr but not thead
            $.each(data, function(index, currObject){
                var row = '';
                var leaveType = '';

                
                if(currObject.load.isOnLeave === '1'){  
                    row = '<tr class="alert-danger" onclick="viewFacultyInformationPanel(this)" data-toggle=\"modal\" data-target=\"#facultyViewModal\" data-backdrop=\"static\" data-keyboard=\"false"\>';
                    leaveType = currObject.load.leaveType;
                } else {
                    row = '<tr onclick="viewFacultyInformationPanel(this)" data-toggle=\"modal\" data-target=\"#facultyViewModal\" data-backdrop=\"static\" data-keyboard=\"false"\>';
                    leaveType = "-";
                }
                
                row += '<td style="display:none">' + currObject.facultyId + '</td>' // added this
                row += '<td>' + currObject.firstName + " " + currObject.lastName + '</td>';
                //row += '<td>' + currObject.firstName + " " + '<br>' + currObject.lastName + '</td>';
                row += '<td>' + currObject.load.totalLoad + '</td>';
                row += '<td>' + currObject.load.deloading + '</td>';
                row += '<td>' + currObject.facultyType + '</td>';
                row += '<td>' + leaveType + '</td>';
                row += '</tr>';
                
                $("#tableFacultyLoad tbody").append(row);
            })
        },
        error: function (data){
            console.log(data);
        }
    });     
    
}



function clicked() {
    alert("clicked!");
}

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

$('#searchOfferingFAViaFacultyInfo').keyup(function() {
    updateFacultyAssignmentModalViaFacultyInfo($('#assignFacultyViaInfoFacultyId').val());
});

$('#searchOfferingFAViaFacultyInfo').on('input',function(e){
    updateFacultyAssignmentModalViaFacultyInfo($('#assignFacultyViaInfoFacultyId').val());
});

$('#searchFacultyFAViaFacultyInfo').keyup(function() {
    updateFacultyListView();
});

$('#searchFacultyFAViaFacultyInfo').on('input',function(e){
    updateFacultyListView();
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