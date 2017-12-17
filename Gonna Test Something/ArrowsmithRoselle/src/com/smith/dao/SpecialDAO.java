package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.constants.DegreeprogramEnum;
import com.smith.constants.FlowchartEnum;
import com.smith.constants.FlowcoursesEnum;
import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.Course;

public class SpecialDAO {
	public static ArrayList<String> getCourseByID(String degree, String batch, String startYear, String endYear, String term) throws SQLException{        
        Connection con = Connector.getConnector();
        String query = "SELECT " + FlowcoursesEnum.course_id + " FROM " + FlowchartEnum.flowcharts + " ft, " + DegreeprogramEnum.degreeprogram + " dp, " + FlowcoursesEnum.flowcourses + " fs " + 
        		"WHERE ft." + FlowchartEnum.flowchart_id + " = fs." + FlowcoursesEnum.flowchart_id + " " + 
        		"AND ft." + FlowchartEnum.degreeprogram_id + " = dp." + DegreeprogramEnum.degreeprogram_id + " " + 
        		"AND ft." + FlowchartEnum.batch + " = ? " + 
        		"AND ft." + FlowchartEnum.start_year + " = ? " + 
        		"AND ft." + FlowchartEnum.end_year + " = ? " + 
        		"AND fs." + FlowcoursesEnum.term + " = ? " +
        		"AND dp." + DegreeprogramEnum.degreeprogram_code + " = ? ";
        
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, batch);
        st.setString(2, startYear);
        st.setString(3, endYear);
        st.setString(4, term);
        st.setString(5, degree);
        
        //System.out.println("PStatement: " + st);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        ArrayList<String> res = new ArrayList();
        
        while(rs.next()){            
        	res.add(rs.getString(FlowcoursesEnum.course_id.toString()));
        }
        
        con.close();
        st.close();
        
        return res;
    }

}