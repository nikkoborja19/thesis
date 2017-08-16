package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.constants.FlowchartEnum;
import com.smith.database.Connector;
import com.smith.model.Flowchart;
import com.smith.model.Timeframe;

public class FlowchartDAO {
	public static Flowchart getFlowchartByTerm(String startYear, String endYear, String term) throws SQLException{        
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + FlowchartEnum.flowcharts + " WHERE " + FlowchartEnum.start_year + " = ? AND " + FlowchartEnum.end_year + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, startYear);
        st.setString(2, endYear);

        System.out.println("PStatement: " + st);
        
        ResultSet rs = st.executeQuery();
        Flowchart f = new Flowchart();
        Timeframe t = new Timeframe();
        
        while(rs.next()){            
        	f.setFlowchartId(rs.getString(FlowchartEnum.flowchart_id.toString()));
        	f.setDegreeprogramId(FlowchartEnum.degreeprogram_id.toString());
        	f.setBatch(rs.getString(FlowchartEnum.batch.toString()));
        	f.setYearLevel(rs.getString(FlowchartEnum.year_level.toString()));
        	t.setStartYear(rs.getString(FlowchartEnum.start_year.toString()));
        	t.setEndYear(rs.getString(FlowchartEnum.end_year.toString()));
        }
        
        ArrayList<String> courseIdList = FlowcoursesDAO.getFlowcourseById(f.getFlowchartId(), term);
        
        for (String string : courseIdList) {
        	System.out.println("CourseID: " + string);
			f.addCourse(CourseDAO.getCourseByID(string));
		}
        
        t.setTerm(term);
        
        f.setTimeframe(t);
        
        con.close();
        st.close();
        
        return f;
    }
	
	public static ArrayList<String> getBatchList() throws SQLException{      
        Connection con = Connector.getConnector();
        String query = "SELECT DISTINCT " + FlowchartEnum.batch + " FROM " + FlowchartEnum.flowcharts;
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        System.out.println("PStatement: " + st);
        ResultSet rs = st.executeQuery();
        ArrayList<String> res = new ArrayList();
        
        while(rs.next()){            
        	res.add(rs.getString(FlowchartEnum.batch.toString()));
        }
        
        return res;
	}
	
	public static ArrayList<String> getYearList() throws SQLException{      
        Connection con = Connector.getConnector();
        String query = "SELECT DISTINCT " + FlowchartEnum.start_year + ", " + FlowchartEnum.end_year + " FROM " + FlowchartEnum.flowcharts;
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        System.out.println("PStatement: " + st);
        ResultSet rs = st.executeQuery();
        ArrayList<String> res = new ArrayList();
        
        while(rs.next()){    
        	String temp = rs.getString(FlowchartEnum.start_year.toString()) + "-" + rs.getString(FlowchartEnum.end_year.toString());
        	res.add(temp);
        }
        
        return res;
	}
}
