package com.smith.parser;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;

import com.smith.dao.CourseDAO;
import com.smith.dao.DegreeprogramDAO;
import com.smith.model.Course;
import com.smith.model.CourseTimeframe;
import com.smith.model.Flowchart;
import com.smith.model.Timeframe;

public class TSVParser {
	public static void readFlowchartFile(String path) {
		Flowchart flowchart = new Flowchart();
		Timeframe timeframe = new Timeframe();
		CourseTimeframe courseTimeframe = new CourseTimeframe();
		
		BufferedReader br = null;
		FileReader fr = null;

		try {
			br = new BufferedReader(new FileReader(path));
			String currLine;

			while ((currLine = br.readLine()) != null) {
				String[] temp = currLine.split("\\t");
				
				if(temp[0].toUpperCase().equals("DEGREE PROGRAM")) {
					flowchart.setDegreeprogramId(DegreeprogramDAO.getIDByCode(temp[1]));
				} else if(temp[0].toUpperCase().equals("BATCH")) {
					flowchart.setBatch(temp[1]);
				} else if(temp[0].toUpperCase().equals("YEAR LEVEL")) {
					flowchart.setYearLevel(temp[1]);
				} else if(temp[0].toUpperCase().equals("AY")) {
					timeframe.setStartYear(temp[1]);
					timeframe.setEndYear(temp[2]);
				} else if(temp[0].toUpperCase().equals("TERM")) {
					timeframe.setTerm(temp[1]);
					courseTimeframe.setTimeframe(timeframe);
					
					String currTerm = temp[1];
					
					while((currLine = br.readLine()) != null) {
						temp = currLine.split("\\t");
						
						if(temp[0].toUpperCase().equals("TERM")) {
							if(!temp[1].toUpperCase().equals(currTerm.toUpperCase())) {
								flowchart.addCourseTimeframe(courseTimeframe);
								
								currTerm = temp[1];
								timeframe.setTerm(temp[1]);
								
								courseTimeframe = new CourseTimeframe();
								courseTimeframe.setTimeframe(timeframe);
								
							}
						} else if(!temp[0].toUpperCase().equals("COURSE CODE")) {
							Course newCourse = new Course();
							
							newCourse.setCourseId(CourseDAO.getIDByCode(temp[0]));
							
							courseTimeframe.addCourse(newCourse);
						}
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
					br.close();
				}
					
				if (fr != null) {
					fr.close();
				}
					
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}

	}
}
