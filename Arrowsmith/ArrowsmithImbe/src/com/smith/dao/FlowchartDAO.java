package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.constants.FlowchartEnum;
import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.CourseTimeframe;
import com.smith.model.Flowchart;
import com.smith.model.Timeframe;

public class FlowchartDAO {
	public static Flowchart getFlowchartByTerm(String startYear, String endYear, String term) throws SQLException{        
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + FlowchartEnum.flowcharts + " WHERE " + FlowchartEnum.start_year + " = ? AND " + FlowchartEnum.end_year + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, startYear);
        st.setString(2, endYear);
        
        ResultSet rs = st.executeQuery();
        Flowchart f = new Flowchart();
        Timeframe t = new Timeframe();
        CourseTimeframe c = new CourseTimeframe();
        
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
			c.addCourse(CourseDAO.getCourseByID(string));
		}
        
        t.setTerm(term);
        
        c.setTimeframe(t);
        
        f.addCourseTimeframe(c);
        
        con.close();
        st.close();
        
        return f;
    }
	
	public static ArrayList<String> getBatchList() throws SQLException{      
        Connection con = Connector.getConnector();
        String query = "SELECT DISTINCT " + FlowchartEnum.batch + " FROM " + FlowchartEnum.flowcharts;
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
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
        
        ResultSet rs = st.executeQuery();
        ArrayList<String> res = new ArrayList();
        
        while(rs.next()){    
        	String temp = rs.getString(FlowchartEnum.start_year.toString()) + "-" + rs.getString(FlowchartEnum.end_year.toString());
        	res.add(temp);
        }
        
        return res;
	}
	
	public static ArrayList<String> getAllFlowchartAcademicYear(String collegeId, String deptId) throws SQLException{   
		ArrayList<String> sList = new ArrayList<>();
        Connection con = Connector.getConnector();

        String query = "SELECT DISTINCT(CONCAT(f."+ Constants.FLOWCHART_STARTYEAR + ", \"-\", f." + Constants.FLOWCHART_ENDYEAR+")) AS academic_year, f." + Constants.FLOWCHART_STARTYEAR + ", f."+ Constants.FLOWCHART_ENDYEAR + " "+
        		    "FROM " +Constants.DEGREEPROGRAM_TABLE + " d, "+ Constants.BATCHINFO_TABLE + " b, "+ Constants.FLOWCHART_TABLE + " f "+
        			"WHERE d."+ Constants.DEGREEPROGRAM_ID + " = b." +Constants.BATCHINFO_ID + " AND " +
        			"d."+ Constants.DEGREEPROGRAM_ID + " = f." +Constants.FLOWCHART_DEGREEPROGRAMID + " AND d."+ Constants.DEGREEPROGRAM_COLLEGEID + " = ? "+
        			"ORDER BY f." +Constants.FLOWCHART_STARTYEAR + " ASC, f." + Constants.FLOWCHART_ENDYEAR + " ASC;";

        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setInt(1, Integer.parseInt(collegeId));
        
        ResultSet rs = st.executeQuery();
        
        while(rs.next()){   
        	String s = rs.getString("academic_year");
        	
        	sList.add(s);
        }
        
        con.close();
        st.close();
        
        return sList;
    }
}
