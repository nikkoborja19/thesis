package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.Course;

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
            c.setCollegeId(rs.getString(Constants.COURSE_COLLEGEID));
            c.setDeptId(rs.getString(Constants.COURSE_DEPTID));
            c.setAreaId(rs.getString(Constants.COURSE_AREAID));
            c.setCourseCode(rs.getString(Constants.COURSE_CODE));
            c.setCourseName(rs.getString(Constants.COURSE_NAME));
            c.setCourseType(rs.getString(Constants.COURSE_TYPE));
            c.setUnits(rs.getString(Constants.COURSE_UNITS));
            c.setDescription(rs.getString(Constants.COURSE_DESCRIPTION));
        }
        
        con.close();
        st.close();
        
        return c;
    }
}
