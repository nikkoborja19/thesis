package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.constants.FlowchartEnum;
import com.smith.constants.FlowcoursesEnum;
import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.CourseTimeframe;
import com.smith.model.Flowchart;
import com.smith.model.Timeframe;

public class FlowchartDAO {
	public static Flowchart getFlowchartByTerm(String startYear, String endYear, String term) throws SQLException{        
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + FlowchartEnum.flowcharts + "fl, " + Constants.FLOWCOURSES_TABLE + " fc WHERE fl." + 
        		FlowchartEnum.flowchart_id + " = fc." + FlowcoursesEnum.flowchart_id + 
        		FlowchartEnum.start_year + " = ? AND " + FlowchartEnum.end_year + " = ? AND " + FlowcoursesEnum.term + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, startYear);
        st.setString(2, endYear);
        st.setString(3, term);
        
        ResultSet rs = st.executeQuery();
        Flowchart f = new Flowchart();
        Timeframe t = new Timeframe();
        CourseTimeframe c = new CourseTimeframe();
        
        while(rs.next()){            
        	f.setFlowchartId(rs.getString(FlowchartEnum.flowchart_id.toString()));
        	f.setDegreeprogramId(FlowchartEnum.degreeprogram_id.toString());
        	f.setBatch(rs.getString(FlowchartEnum.batch.toString()));
        	c.setYearLevel(rs.getString(FlowchartEnum.year_level.toString()));
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
        			"ORDER BY f." +Constants.FLOWCHART_STARTYEAR + " DESC, f." + Constants.FLOWCHART_ENDYEAR + " DESC;";

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
	
	public static void insertFlowchart(Flowchart flowchart) throws SQLException {
		Connection con = Connector.getConnector();
		String query = "SELECT MAX(" + Constants.FLOWCHART_ID + ")  as " + Constants.FLOWCHART_ID + " FROM " + Constants.FLOWCHART_TABLE;
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        ResultSet rs = st.executeQuery();
        String currYearLevel = "";
        int lastIndex = 0;
        
        while(rs.next()) {
        	lastIndex = rs.getInt(Constants.FLOWCHART_ID);
        }
        
        lastIndex++;
        
        query = "INSERT INTO " + Constants.FLOWCHART_TABLE + 
        		" (" + Constants.FLOWCHART_ID + ", " + Constants.FLOWCHART_DEGREEPROGRAMID + ", " + 
        		Constants.FLOWCHART_BATCH + ", " + Constants.FLOWCHART_YEARLEVEL + ", " + Constants.FLOWCHART_STARTYEAR + ", " + 
        		Constants.FLOWCHART_ENDYEAR + ") " + 
        		"VALUES(?,?,?,?,?,?)";
        
        System.out.println("courseTimeframes: " + flowchart.getCourseTimeframes().size());
        
        for (CourseTimeframe courseTF : flowchart.getCourseTimeframes()) {
        	if(!currYearLevel.equals(courseTF.getYearLevel())) {
        		currYearLevel = courseTF.getYearLevel();
        		
        		st = (PreparedStatement) con.prepareStatement(query);
                st.setString(1, lastIndex + "");
                st.setString(2, flowchart.getDegreeprogramId());
                st.setString(3, flowchart.getBatch());
                
                st.setString(4, courseTF.getYearLevel());
                st.setString(5, courseTF.getTimeframe().getStartYear());
                st.setString(6, courseTF.getTimeframe().getEndYear());
                
                System.out.println("Year: " + courseTF.getYearLevel() + "|" + courseTF.getTimeframe().getStartYear() + "-" + courseTF.getTimeframe().getEndYear());
                
                st.executeUpdate();
                
                lastIndex++;
        	}
            
            FlowcoursesDAO.insertFlowcourses(courseTF);
		}
        
        con.close();
        st.close();
	}
}
