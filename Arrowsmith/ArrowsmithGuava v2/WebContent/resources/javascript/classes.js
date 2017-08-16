function TempOffering(degreeProgram, courseId, courseCode, section, batch, term, status, remarks){
	this.degreeProgram = degreeProgram;
	this.courseId = courseId; //this is combination of <courseId>-<appender>-<some extra string>
	this.courseCode = courseCode;
	this.section = section;
	this.batch = batch;
	this.term = term;
	this.status = status;
	this.remarks = remarks;
	this.daysList1 = [];
	this.daysList2 = [];
	this.timeSlot1 = "";
	this.timeSlot2 = "";
	
	this.day1 = "";
	this.begin1 = "";
	this.end1 = "";
	this.room1 = "";
	
	this.day2 = "";
	this.begin2 = "";
	this.end2 = "";
	this.room2 = "";
	

}