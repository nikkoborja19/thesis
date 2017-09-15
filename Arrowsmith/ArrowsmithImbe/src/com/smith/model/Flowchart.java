package com.smith.model;

import java.util.ArrayList;

public class Flowchart {
	private String flowchartId;
	private String degreeprogramId;
	private String batch;
	private String yearLevel;
	private ArrayList<CourseTimeframe> courseTimeframes;
	
	public Flowchart() {

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

	public ArrayList<CourseTimeframe> getCourseTimeframes() {
		return courseTimeframes;
	}

	public void setCourseTimeframes(ArrayList<CourseTimeframe> courseTimeframes) {
		this.courseTimeframes = courseTimeframes;
	}

	public void addCourseTimeframe(CourseTimeframe courseTimeframe) {
		this.courseTimeframes.add(courseTimeframe);
	}
}
