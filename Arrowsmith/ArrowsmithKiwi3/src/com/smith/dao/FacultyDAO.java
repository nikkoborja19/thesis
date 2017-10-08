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
import com.smith.model.User;

public class FacultyDAO {
	public static Faculty getFacultyByID(String id) throws SQLException{  
        Connection con = Connector.getConnector();
        String query = 
        		"SELECT * " +
        		"FROM " + Constants.USERS_TABLE + " u, " + Constants.FACULTY_TABLE + " f " +
        		"WHERE u." + Constants.USERS_ID + " = f." + Constants.FACULTY_USERID + " " +
        		"AND f." + Constants.FACULTY_ID + " = ? ";
        
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, id);
        
//        System.out.println("PStatement: " + st);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        Faculty f = null;
        
        while(rs.next()){   
        	User u = UserDAO.getUserByID(rs.getString(Constants.FACULTY_USERID));    	

        	f = new Faculty(u, rs.getString(Constants.FACULTY_ID), rs.getString(Constants.FACULTY_YEARSOFSERVICE), rs.getString(Constants.FACULTY_TYPE));
        	f.setLoad(LoadDAO.getLoadByFacultyID(f.getFacultyId()));
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
        
        ResultSet rs = st.executeQuery();
        
        while(rs.next()){   
        	User u = UserDAO.getUserByID(rs.getString(Constants.FACULTY_USERID));
        	Faculty f;
        	
        	f = new Faculty(u, rs.getString(Constants.FACULTY_ID), rs.getString(Constants.FACULTY_YEARSOFSERVICE), rs.getString(Constants.FACULTY_TYPE), "Recommended", rs.getString("faculty_count"));
        	
        	//System.out.println("department: " + f.getDepartment().getDeptCode());
        	
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
        	User u = UserDAO.getUserByID(rs.getString(Constants.FACULTY_USERID));
        	Faculty f;
        	
        	f = new Faculty(u, rs.getString(Constants.FACULTY_ID), rs.getString(Constants.FACULTY_YEARSOFSERVICE), rs.getString(Constants.FACULTY_TYPE), "Searched", "N/A");
        	
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
	
	public static ArrayList<Faculty> getListFacultyByTerm(String startYear, String endYear, String term) throws SQLException{   
		ArrayList<Faculty> facultyList = new ArrayList();
        Connection con = Connector.getConnector();
        String query = 
        		"SELECT * " +
        		"FROM " + Constants.USERS_TABLE + " u, " + Constants.FACULTY_TABLE + " f, " + Constants.LOADS_TABLE + " l " +
        		"WHERE u." + Constants.USERS_ID + " = f." + Constants.FACULTY_USERID + " " +
        		"AND f." + Constants.FACULTY_ID + " = l." + Constants.LOADS_FACULTYID + " " + 
        		"AND l." + Constants.LOADS_STARTYEAR + " = ? " + 
        		"AND l." + Constants.LOADS_ENDYEAR + " = ? " + 
        		"AND l." + Constants.LOADS_TERM + " = ?";
        
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        st.setString(1, startYear);
        st.setString(2, endYear);
        st.setString(3, term);
        
//        System.out.println("PStatement: " + st);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        
        while(rs.next()){   
        	User u = UserDAO.getUserByID(rs.getString(Constants.FACULTY_USERID));   	

        	Faculty f = new Faculty(u, rs.getString(Constants.FACULTY_ID), rs.getString(Constants.FACULTY_YEARSOFSERVICE), rs.getString(Constants.FACULTY_TYPE));
        	f.setLoad(LoadDAO.getLoadByFacultyID(f.getFacultyId()));
            
            facultyList.add(f);
        }
        
        con.close();
        st.close();
        
        return facultyList;
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
