package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.constants.RoomEnum;
import com.smith.database.Connector;
import com.smith.model.Building;
import com.smith.model.Constants;
import com.smith.model.Course;
import com.smith.model.Days;
import com.smith.model.Faculty;
import com.smith.model.Offering;
import com.smith.model.Room;

public class FacultyDAO {
	public static Faculty getFacultyByID(String ID) throws SQLException{        
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + Constants.FACULTY_TABLE + " WHERE " + Constants.FACULTY_ID + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, ID);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        Faculty f = new Faculty();
        
        while(rs.next()){            
        	f.setFacultyId(rs.getString(Constants.FACULTY_ID));
        	f.setFacultyType(rs.getString(Constants.FACULTY_TYPE));
        	f.setYearsOfService(rs.getString(Constants.FACULTY_YEARSOFSERVICE));
        	f.setUser(UserDAO.getUserByID(rs.getString(Constants.FACULTY_USERID)));
        }
        
        con.close();
        st.close();
        
        return f;
    }
	public static ArrayList<Faculty> getAllFacultyWithRecommendations(Offering o, String facultyType, String deptId, String collegeId, String key) throws SQLException{   
		ArrayList<Faculty> facultyList = new ArrayList<Faculty>();
        Connection con = Connector.getConnector();
        
        /*
         * 
         SELECT DISTINCT(f.faculty_id) AS faculty_id, COUNT(f.faculty_id) AS faculty_count, f.user_id, 
         f.faculty_type, f.years_of_service  FROM faculty f, offering o, users u 
         where o.faculty_id = f.faculty_id AND f.user_id = u.user_id AND o.course_id = 1345 
         AND u.college_id LIKE '%%' AND u.dept_id LIKE '%%' GROUP BY f.faculty_id ORDER BY faculty_count DESC, 
         f.faculty_id ASC LIMIT 10
         * 
         */
        
        String query = "SELECT DISTINCT(f."+ Constants.FACULTY_ID + ") AS faculty_id, COUNT(f."+ Constants.FACULTY_ID +") AS faculty_count, "+
        			" f."+ Constants.FACULTY_USERID + ", f." + Constants.FACULTY_TYPE + ", f."+ Constants.FACULTY_YEARSOFSERVICE + 
        			" FROM "+ Constants.FACULTY_TABLE +" f, "+ Constants.OFFERING_TABLE +" o, "+ Constants.USERS_TABLE +" u"+
        			" WHERE o."+ Constants.FACULTY_ID +" = f." + Constants.FACULTY_ID + " AND f." + Constants.FACULTY_USERID + " AND u." + Constants.USERS_ID + " AND" +
        			" o. " + Constants.COURSE_ID + " =? "+
        			" GROUP BY f." + Constants.FACULTY_ID + " ORDER BY faculty_count DESC, " + Constants.FACULTY_ID + " ASC;";
        
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setInt(1, Integer.parseInt(o.getCourseId()));  
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        
        while(rs.next()){   
        	Faculty f = new Faculty();
        	f.setFacultyId(rs.getString(Constants.FACULTY_ID));
        	f.setUserId(rs.getString(Constants.FACULTY_USERID));
        	f.setFacultyType(rs.getString(Constants.FACULTY_TYPE));
        	f.setYearsOfService(rs.getString(Constants.FACULTY_YEARSOFSERVICE));
        	f.setUser(UserDAO.getUserByID(rs.getString(Constants.FACULTY_USERID)));
        	f.setTeachCount(rs.getString("faculty_count"));
        	f.setStatus("Recommended");
        	
        	facultyList.add(f);
        }
        
        con.close();
        st.close();
        
        return facultyList;
    }
	
	public static ArrayList<Faculty> getAllFacultyWithSearchKey(Offering o, String facultyType, String deptId, String collegeId, String key) throws SQLException{   
		ArrayList<Faculty> facultyList = new ArrayList<Faculty>();
        Connection con = Connector.getConnector();
        String newDeptID, newCollegeID;
        
        if(deptId.equalsIgnoreCase("-999")) newDeptID = "";
        else newDeptID = deptId + "";
        
        if(collegeId.equalsIgnoreCase("-999")) newCollegeID = "";
        else newCollegeID = collegeId + "";
        /*
         * 
         SELECT * FROM faculty f, users u where f.user_id = u.user_id AND u.college_id LIKE '%%' 
         AND u.dept_id LIKE '%%' AND u.first_name LIKE '%%' AND u.last_name LIKE '%%' AND f.faculty_type LIKE '%%' GROUP BY f.faculty_id 
         ORDER BY u.last_name ASC, u.first_name ASC;
         * 
         */
        
        String query = "SELECT *"+
        			" FROM "+ Constants.FACULTY_TABLE +" f, "+ Constants.USERS_TABLE +" u"+
        			" WHERE u."+ Constants.USERS_ID +" = f." + Constants.FACULTY_USERID + " AND u."+ Constants.USERS_COLLEGEID + 
        			" LIKE '%"+newCollegeID+"%' AND u." + Constants.USERS_DEPTID + " LIKE '%"+ newDeptID + "%' AND (u." +Constants.USERS_FIRSTNAME + 
        			" LIKE '%" +key + "%' OR u."+ Constants.USERS_LASTNAME + " LIKE '%"+ key +"%') AND f." + Constants.FACULTY_TYPE + " LIKE '%" + facultyType + "%'"+
        			" GROUP BY f." + Constants.FACULTY_ID + " ORDER BY u." + Constants.USERS_LASTNAME+" ASC, u." + Constants.USERS_FIRSTNAME + " ASC;";
        
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        //System.out.println(query);
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        
        while(rs.next()){   
        	Faculty f = new Faculty();
        	f.setFacultyId(rs.getString(Constants.FACULTY_ID));
        	f.setFacultyType(rs.getString(Constants.FACULTY_TYPE));
        	f.setYearsOfService(rs.getString(Constants.FACULTY_YEARSOFSERVICE));
        	f.setUser(UserDAO.getUserByID(rs.getString(Constants.FACULTY_USERID)));
        	f.setStatus("Searched");
        	
        	facultyList.add(f);
        }
        
        con.close();
        st.close();
        
        return facultyList;
    }
	
	public static ArrayList<String> getAllUniqueFacultyType() throws SQLException{   
		ArrayList<String> typeList = new ArrayList<>();
        Connection con = Connector.getConnector();
        /*
        SELECT b.building_id, b.building_name, COUNT(r.building_id) AS roomsAvailable
		FROM building b
		LEFT JOIN room r ON b.building_id = r.building_id
		GROUP BY building_id;
         * 
        /* 
        String query = "SELECT * FROM " + Constants.DEPARTMENT_TABLE + " ORDER BY " + Constants.DEPT_CODE + " ASC";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        //System.out.println(query);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        
        while(rs.next()){   
        	String d;
        	d = rs.getString(Constants.DEPT_NAME);
        	
        	typeList.add(d);
        }*/
        
        typeList.add("Full Time");
        typeList.add("Part Time");
        typeList.add("Half Time");
        typeList.add("Leave");
        //con.close();
        //st.close();
        
        return typeList;
    }
	
	public static void assignFacultyToOffering(String offeringId, String facultyId) throws SQLException {        
        
    	Connection con = Connector.getConnector();
        String query = "UPDATE " + Constants.OFFERING_TABLE + " SET "+ Constants.OFFERING_FACULTYID +" = ? WHERE " + Constants.OFFERING_ID + " = ?;";
        
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setInt(1, Integer.parseInt(facultyId));
        st.setInt(2, Integer.parseInt(offeringId));
        
        st.executeUpdate(); //use execute update instead of execute query
           
        con.close();
        st.close();
       
	}
	
	public static String removeSpaces(String s){
		s = s.replaceAll("\\s",""); 
		return s;
	}
}
