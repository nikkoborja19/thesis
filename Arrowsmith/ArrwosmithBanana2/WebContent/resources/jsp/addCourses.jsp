<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <title>Add Courses</title>
    </head>
    <body>
        <div style="padding: 10px; background-color: #7aca7e; width: 1020px; margin: auto; border: 1px solid black;">
            <div class="" style="margin: auto; overflow: hidden; background-color: #c2ffc5; border: 1px solid black; width: 1000px">
                <div class="row" style="margin-left: 2px;">
                    <div class="col-sm-4">
                        <h2>Select Filters</h2>
                        <form id="filterForm" action="filterCourses" method="POST">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h4>Degree Program</h4>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <select class="form-control" id="degSelect" name="degSelect">
											<c:forEach items="${degreeList }" var="degree">
												<option><c:out value="${degree.degreeprogramCode }"></c:out></option>
											</c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <h4>Batch ID</h4>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <select class="form-control" id="batSelect" name="batSelect">
											<c:forEach items="${batchList }" var="batch">
												<option><c:out value="${batch }"></c:out></option>
											</c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-6">
                                    <h4>School Year</h4>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <select class="form-control" id="yearSelect" name="yearSelect">
											<c:forEach items="${yearList }" var="year">
												<option><c:out value="${year }"></c:out></option>
											</c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-6">
                                    <h4>Term</h4>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <select class="form-control" id="termSelect" name="termSelect">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <input class="btn btn-default" type="submit" name="filterButton" value="Filter">
                        </form>
                    </div>
                    <div class="col-sm-8">
                        <div class="container" style="background-color: #c2ffc5; width: 600px; height: 400px; float: right; border-left: 1px solid black; padding-top: 5px;">
                            <form>
                                <div class="form-group">
                                    <label for="usr">Search courses:</label> <input type="text" class="form-control" id="usr">
                                </div>
                            </form>
                            <div style="overflow-y: scroll; min-height: 300px; border: 1px solid black; background-color: #a7f5ab;">
								<div class="container">
									<div class="row">
										<c:forEach items="${courseList }" var="course" varStatus="innerLoop">
											<div id="${course.courseId }${innerLoop.count}" class="col-sm-8">
												<span><c:out value="${course.courseCode }"></c:out></span>
											</div>
											<div class="col-sm-4">
												<button class="btn btn-default">+</button>
											</div>
										</c:forEach>
									</div>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!---pt2-->

        <div class="container">
            <h2>Courses to be added for Term 3, S.Y. 2013-2014</h2>
            <div style="padding: 10px; background-color: #a7f5ab; width: 1020px; min-height: 300px; margin: auto; border: 1px solid black; overflow-y: scroll;">

                <!---templatePerCourse-->
                <div style="overflow: hidden;">
                    <div style="float: left; margin-left: 10px">
                        <b>COMPRO1</b>
                        <button type="button" class="btn btn-default">S11A</button>
                    </div>
                    <div style="float: left; margin-left: 10px">
                        <b>COMPRO1</b>
                        <button type="button" class="btn btn-default">S11B</button>
                    </div>
                </div>
                <hr style="border-color: black;">
                <div style="overflow: hidden;">
                    <div style="float: left; margin-left: 10px">
                        <b>CCSALGE</b>
                        <button type="button" class="btn btn-default">S11</button>
                    </div>
                </div>
                <!--endtemplate-->


            </div>
    </body>
</html>
