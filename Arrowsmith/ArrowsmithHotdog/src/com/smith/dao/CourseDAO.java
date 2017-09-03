package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.Course;
import com.smith.model.Offering;
import com.smith.model.Timeframe;

public class CourseDAO {
	public static Course getCourseByID(String ID) throws SQLException{        
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + Constants.COURSE_TABLE + " WHERE " + Constants.COURSE_ID + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, ID);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        Course c = new Course();
        
        while(rs.next()){            
            c.setCourseId(rs.getString(Constants.COURSE_ID));
            //c.setCollegeId(rs.getString(Constants.COURSE_COLLEGEID));
            //c.setDeptId(rs.getString(Constants.COURSE_DEPTID));
            c.setAreaId(rs.getString(Constants.COURSE_AREAID));
            c.setCourseCode(rs.getString(Constants.COURSE_CODE));
            c.setCourseName(rs.getString(Constants.COURSE_NAME));
            c.setCourseType(rs.getString(Constants.COURSE_TYPE));
            c.setUnits(rs.getString(Constants.COURSE_UNITS));
            c.setDescription(rs.getString(Constants.COURSE_DESCRIPTION));
            c.setCollege(CollegeDAO.getCollegeByID(rs.getString(Constants.COURSE_COLLEGEID)));
            c.setDepartment(DepartmentDAO.getDepartmentByID(rs.getString(Constants.COURSE_DEPTID)));
        }
        
        con.close();
        st.close();
        
        return c;
    }
    
    public static ArrayList<Course> getAllCoursesWithKey(String key) throws SQLException{
        ArrayList<Course> courses = new ArrayList<Course>();
        Connection con = Connector.getConnector();
       
        //SELECT * FROM course WHERE course_type LIKE 'TL' AND (course_code LIKE '%Discrete%' OR course_name LIKE '%Discrete%')
        String query = "SELECT * FROM " + Constants.COURSE_TABLE + " WHERE "+ Constants.COURSE_TYPE +" LIKE 'TL' AND (" 
        			+ Constants.COURSE_CODE + " LIKE '%"+ key + "%' OR "+ Constants.COURSE_NAME + " LIKE '%"+ key + "%') ORDER BY "+Constants.COURSE_CODE;

        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        ResultSet rs = st.executeQuery();
        
        while(rs.next()){
        	Course c = new Course();
        	c.setCourseId(rs.getString(Constants.COURSE_ID));
            //c.setCollegeId(rs.getString(Constants.COURSE_COLLEGEID));
            //c.setDeptId(rs.getString(Constants.COURSE_DEPTID));
            c.setAreaId(rs.getString(Constants.COURSE_AREAID));
            c.setCourseCode(rs.getString(Constants.COURSE_CODE));
            c.setCourseName(rs.getString(Constants.COURSE_NAME));
            c.setCourseType(rs.getString(Constants.COURSE_TYPE));
            c.setUnits(rs.getString(Constants.COURSE_UNITS));
            c.setDescription(rs.getString(Constants.COURSE_DESCRIPTION));
            c.setCollege(CollegeDAO.getCollegeByID(rs.getString(Constants.COURSE_COLLEGEID)));
            c.setDepartment(DepartmentDAO.getDepartmentByID(rs.getString(Constants.COURSE_DEPTID)));
            
            courses.add(c);
        }
        
        con.close();
        st.close();
        
        return courses;
    }
    
    public static ArrayList<Course> getAllFlowchartCourses(String degreeProgram, String batch, String term, String startYear, String endYear) throws SQLException{
    	ArrayList<Course> courses = new ArrayList<Course>();
        Connection con = Connector.getConnector();
       
        /*
         * SELECT * FROM course c, degreeprogram d, batchinfo b, flowcharts f, flowcourses fc 
			WHERE d.degreeprogram_id = b.degreeprogram_id AND f.degreeprogram_id = d.degreeprogram_id AND 
			f.flowchart_id = fc.flowchart_id AND fc.course_id = c.course_id AND b.batch = 113 AND d.degreeprogram_code LIKE 'CS-ST' AND  
			f.start_year = 2016 AND f.end_year = 2017 AND fc.term = 3 AND c.course_type LIKE'TL' ORDER BY course_code
         * 
         */
        String query = "SELECT * FROM " + Constants.COURSE_TABLE + " c, " + Constants.DEGREEPROGRAM_TABLE + " d, " + Constants.BATCHINFO_TABLE + " b, " + Constants.FLOWCHART_TABLE + " f, " + Constants.FLOWCOURSES_TABLE + " fc WHERE " +
        				"d." + Constants.DEGREEPROGRAM_ID + " = b." +Constants.BATCHINFO_DEGREEPROGRAMID + " AND f." + Constants.DEGREEPROGRAM_ID + " = d." +Constants.DEGREEPROGRAM_ID +
        				" AND f." + Constants.FLOWCHART_ID + " = fc." + Constants.FLOWCOURSES_FLOWCHARTID + " AND fc." + Constants.FLOWCOURSES_COURSEID + " = c." + Constants.COURSE_ID +
        				" AND b." +Constants.BATCHINFO_BATCH +" = ? AND d."+ Constants.DEGREEPROGRAM_CODE + " LIKE '" + degreeProgram + "' AND f." + Constants.FLOWCHART_STARTYEAR + " = ?"+
        				" AND f." +Constants.FLOWCHART_ENDYEAR + " = ? AND fc." + Constants.FLOWCOURSES_TERM + " = ? AND c." + Constants.COURSE_TYPE + " LIKE 'TL' ORDER BY c." + Constants.COURSE_CODE + " ASC;"; 
         
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setInt(1, Integer.parseInt(batch));
        st.setInt(2, Integer.parseInt(startYear));
        st.setInt(3, Integer.parseInt(endYear));
        st.setInt(4, Integer.parseInt(term));
        
        ResultSet rs = st.executeQuery();
        
        while(rs.next()){
        	Course c = new Course();
        	c.setCourseId(rs.getString(Constants.COURSE_ID));
            //c.setCollegeId(rs.getString(Constants.COURSE_COLLEGEID));
            //c.setDeptId(rs.getString(Constants.COURSE_DEPTID));
            c.setAreaId(rs.getString(Constants.COURSE_AREAID));
            c.setCourseCode(rs.getString(Constants.COURSE_CODE));
            c.setCourseName(rs.getString(Constants.COURSE_NAME));
            c.setCourseType(rs.getString(Constants.COURSE_TYPE));
            c.setUnits(rs.getString(Constants.COURSE_UNITS));
            c.setDescription(rs.getString(Constants.COURSE_DESCRIPTION));
            c.setCollege(CollegeDAO.getCollegeByID(rs.getString(Constants.COURSE_COLLEGEID)));
            c.setDepartment(DepartmentDAO.getDepartmentByID(rs.getString(Constants.COURSE_DEPTID)));
            courses.add(c);
        }
        
        con.close();
        st.close();
        
        return courses;
    }
}
