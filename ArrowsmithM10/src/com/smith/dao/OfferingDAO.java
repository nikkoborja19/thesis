package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.Offering;
import com.smith.model.Timeframe;

public class OfferingDAO {
	
	public static ArrayList<Offering> getListOfferingsByTerm(String startYear, String endYear, String term) throws SQLException{
        ArrayList<Offering> offerings = new ArrayList<Offering>();
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + Constants.OFFERING_TABLE + " ot WHERE ot." + Constants.OFFERING_STARTYEAR + " = ? AND ot." + Constants.OFFERING_ENDYEAR + " = ? AND ot." + Constants.OFFERING_TERM + " = ? LIMIT 10";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, startYear);
        st.setString(2, endYear);
        st.setString(3, term);
        
//        System.out.println("PStatement: " + st);
        
        ResultSet rs = st.executeQuery();
        
        while(rs.next()){
        	Offering o = new Offering();
            o.setOfferingId(rs.getString(Constants.OFFERING_ID));
            o.setCourseId(rs.getString(Constants.OFFERING_COURSEID)); 
            o.setFacultyId(rs.getString(Constants.OFFERING_FACULTYID)); 
            o.setDegreeProgram(rs.getString(Constants.OFFERING_DEGREEPROGRAM)); 
            o.setSection(rs.getString(Constants.OFFERING_SECTION)); 
            o.setBatch(rs.getString(Constants.OFFERING_BATCH)); 
            o.setMaxStudentsEnrolled(rs.getString(Constants.OFFERING_MAXSTUDENTSENROLLED));
            o.setCurrStudentsEnrolled(rs.getString(Constants.OFFERING_CURRSTUDENTSENROLLED));
            o.setIsNonAcad(rs.getString(Constants.OFFERING_ISNONACAD));
            o.setIsShs(rs.getString(Constants.OFFERING_ISSHS));
            o.setIsServiceCourse(rs.getString(Constants.OFFERING_ISSERVICECOURSE));
            o.setServicedeptId(rs.getString(Constants.OFFERING_SERVICEDEPTID));
            o.setIsMasters(rs.getString(Constants.OFFERING_ISMASTERS));
            o.setIsElective(rs.getString(Constants.OFFERING_ISELECTIVE));
            o.setElectiveType(rs.getString(Constants.OFFERING_ELECTIVETYPE));
            o.setDescription(rs.getString(Constants.OFFERING_DESCRIPTION));
            o.setStatus(rs.getString(Constants.OFFERING_STATUS));
            o.setLocation(rs.getString(Constants.OFFERING_LOCATION));
            o.setIteoEval(rs.getString(Constants.OFFERING_ITEOEVAL));
            o.setDays(DaysDAO.getListDays(o.getOfferingId())); 
            o.setCourse(CourseDAO.getCourseByID(o.getCourseId()));
            
            String oTerm = rs.getString(Constants.OFFERING_TERM); 
            String oStartYear = rs.getString(Constants.OFFERING_STARTYEAR); 
            String oEndYear = rs.getString(Constants.OFFERING_ENDYEAR);
            
            o.setTimeframe(new Timeframe(oStartYear, oEndYear, oTerm));
            
            offerings.add(o);
        }
        
        con.close();
        st.close();
        
        return offerings;
    }
	
	
}
