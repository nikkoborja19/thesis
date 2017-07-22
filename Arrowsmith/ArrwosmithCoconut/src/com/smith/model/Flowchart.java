package com.smith.model;

import java.util.ArrayList;

public class Flowchart {
	private String flowchartId;
	private String degreeprogramId;
	private String batch;
	private String yearLevel;
	private Timeframe timeframe;
	private ArrayList<Course> courseList;
	
	public Flowchart() {
		this.courseList = new ArrayList();
	}

	public String getFlowchartId() {
		return flowchartId;
	}

	public void setFlowchartId(String flowchartId) {
		this.flowchartId = flowchartId;
	}

	public String getDegreeprogramId() {
		return degreeprogramId;
	}

	public void setDegreeprogramId(String degreeprogramId) {
		this.degreeprogramId = degreeprogramId;
	}

	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}

	public String getYearLevel() {
		return yearLevel;
	}

	public void setYearLevel(String yearLevel) {
		this.yearLevel = yearLevel;
	}

	public ArrayList<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(ArrayList<Course> courseList) {
		this.courseList = courseList;
	}
	
	public void addCourse(Course course) {
		this.courseList.add(course);
	}

	public Timeframe getTimeframe() {
		return timeframe;
	}

	public void setTimeframe(Timeframe timeframe) {
		this.timeframe = timeframe;
	}

}
