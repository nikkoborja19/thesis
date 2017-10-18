package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.constants.FlowcoursesEnum;
import com.smith.database.Connector;
import com.smith.model.Course;
import com.smith.model.CourseTimeframe;

public class FlowcoursesDAO {
	public static ArrayList<String> getFlowcourseById(String id, String term) throws SQLException{        
        Connection con = Connector.getConnector();
        String query = "SELECT " + FlowcoursesEnum.course_id + " FROM " + FlowcoursesEnum.flowcourses + " WHERE " + FlowcoursesEnum.flowchart_id + " = ? AND " + FlowcoursesEnum.term + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, id);
        st.setString(2, term);

        System.out.println("PStatement: " + st);
        
        ResultSet rs = st.executeQuery();
        ArrayList<String> res = new ArrayList();
        
        while(rs.next()){            
        	res.add(rs.getString(FlowcoursesEnum.course_id.toString()));
        }
        
        con.close();
        st.close();
        
        return res;
    }
	
	public static void insertFlowcourses(CourseTimeframe courseTF, int flowchartId) throws SQLException {
		Connection con = Connector.getConnector();
		String query = "INSERT INTO " + FlowcoursesEnum.flowcourses + 
				" (" + FlowcoursesEnum.flowchart_id + ", " + FlowcoursesEnum.course_id + ", " + FlowcoursesEnum.term + ") " +
				"VALUES (?,?,?)";
		
		for (Course course : courseTF.getCourseList()) {
			PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
	        st.setString(1, flowchartId + "");
	        st.setString(2, course.getCourseId());
	        st.setString(3, courseTF.getTimeframe().getTerm());
	        
	        System.out.println("flowcourseQuery: " + st.toString());
	        
	        st.executeUpdate();
		}
		
		
	}
}
