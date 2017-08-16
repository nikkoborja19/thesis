package com.smith.model;

public class Faculty {
	
	String facultyId, userId, yearsOfService, facultyType, timeStamp, teachCount, status; //status is if Searched or Recommended
	User user;
	public Faculty(){
		
	}
	
	public Faculty(String facultyId, String userId, String yearsOfService, String facultyType){
		this.facultyId = facultyId;
		this.userId = userId;
		this.yearsOfService = yearsOfService;
		this.facultyType = facultyType;
	}

	public String getFacultyId() {
		return facultyId;
	}

	public void setFacultyId(String facultyId) {
		this.facultyId = facultyId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getYearsOfService() {
		return yearsOfService;
	}

	public void setYearsOfService(String yearsOfService) {
		this.yearsOfService = yearsOfService;
	}

	public String getFacultyType() {
		return facultyType;
	}

	public void setFacultyType(String facultyType) {
		this.facultyType = facultyType;
	}

	public String getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTeachCount() {
		return teachCount;
	}

	public void setTeachCount(String teachCount) {
		this.teachCount = teachCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}