<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <style>
            #dividerOnRight{
                border-right: 1px solid #bbb;
            }		
         	.courseName{
         	 	cursor: pointer;
         	 	text-decoration:none;;
         	}
        </style>
        <title>Room Assignment</title>
    </head>
    <body>
        <br>
        <div class="container">	
            <div class="row">
                <div class="col-sm-7">		
                    <div class="row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6"></div>
                        <div class="col-sm-3"><input type="text" class="form-control" id="search" placeholder="Search" klmname = "searchForm"></div>
                        <form id="clickForm" action="displayCourseRoomAssign" method="POST">
	                        <input type="hidden" class="inputDumpID" name="inputDumpID" value="${clickedID}">
	                        <input type="hidden" class="inputDumpStartYear" name="inputDumpStartYear" value="${startYear}">
	                        <input type="hidden" class="inputDumpEndYear" name="inputDumpEndYear" value="${endYear}">
	                        <input type="hidden" class="inputDumpTerm" name="inputDumpTerm" value="${term}">
                        </form>
                    </div>
                    <hr>
                    <div class="table-responsive">          
                        <table class="table" name = "table1">
                            <thead>
                                <tr>
                                    <th>Course Code</th>
                                    <th>Section</th>
                                    <th>Day</th>
                                    <th>Time Start</th>
                                    <th>Time End</th>
                                    <th>Room</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${offeringList }" var="offering">
		                    		<c:forEach items="${offering.days }" var="day">
		                    		<c:choose>
		                    			<c:when test="${offering.offeringId == clickedOffering.offeringId}">
		                    				<tr class="danger">
		                    			</c:when>
		                    			<c:otherwise>
		                    				<tr class="success">
		                    			</c:otherwise>
		                    		</c:choose>
				                        
				                            <td><a onclick="clickOffering(${offering.offeringId})" class="courseName"><c:out value="${offering.course.courseCode }"/></a></td>
				                            <td><c:out value="${offering.section }"/></td>
				                            <td><c:out value="${day.classDay }"/></td>
				                            <td><c:out value="${day.beginTime }"/></td>
				                            <td><c:out value="${day.endTime }"/></td>
				                            <td></td>
				                        </tr>
			                        </c:forEach>
		                        </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-sm-5">
                    <div style="min-height: 500px;background-color: #2a9c2f;color: white;padding:10px;border-radius: 10px;">
                        <div class="row">
                            <div class="col-sm-3"> Time Start:<input type="text" class="form-control" id="search" placeholder="Search" klmname = "searchForm"></div>
                            <div class="col-sm-3"> Time End:<input type="text" class="form-control" id="search" placeholder="Search" klmname = "searchForm"></div>
                            <div class="col-sm-3"> Day:<input type="text" class="form-control" id="search" placeholder="Search" klmname = "searchForm"></div>
                        </div>
                        <br>
                        <div style="height: 500px;background-color:#67ed6d;padding: 10px;border: 3px solid #195c1c">
                            <div style="background-color: #c2ffc5;height: 100%;"></div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        
        <script type="text/javascript">
        function clickOffering(id){
        	$('.inputDumpID').val(id);
        	$('#clickForm').submit();
        }
        </script>
    </body>
</html>