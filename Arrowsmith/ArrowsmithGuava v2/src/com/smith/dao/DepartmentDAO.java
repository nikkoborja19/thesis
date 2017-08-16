package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.smith.database.Connector;
import com.smith.model.College;
import com.smith.model.Constants;
import com.smith.model.Department;

/**
 *
 * @author asus
 */
public class DepartmentDAO {
    
    public static int getDepartmentIDByCode(String code) throws SQLException{
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + Constants.DEPARTMENT_TABLE + " WHERE " + Constants.DEPT_CODE + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, removeSpaces(code));
        
        ResultSet rs = st.executeQuery();
        Department d = new Department();
        
        while(rs.next()){
            d.setId(rs.getString(Constants.DEPT_ID));
        }
        
        con.close();
        st.close();

        if(d.getId() == null || d.getId().isEmpty()) return 0;
        else return Integer.parseInt(d.getId());
    }
    
    public static Department getDepartmentByName(String name) throws SQLException{
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + Constants.DEPARTMENT_TABLE + " WHERE " + Constants.DEPT_NAME + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, name);
        
        ResultSet rs = st.executeQuery();
        Department d = new Department();
        
        while(rs.next()){
            d.setId(rs.getString(Constants.DEPT_ID));
            d.setDeptName(rs.getString(Constants.DEPT_NAME));
            d.setDeptCode(rs.getString(Constants.DEPT_CODE));
            d.setCollegeID(rs.getString(Constants.DEPT_COLLEGEID));
            d.setDeptSize(rs.getString(Constants.DEPT_SIZE));
            d.setIsObsolete(rs.getString(Constants.DEPT_ISOBSOLETE));
        }
        
        con.close();
        st.close();

        return d;
    }
    
    public static Department getDepartmentByID(String ID) throws SQLException{
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + Constants.DEPARTMENT_TABLE + " WHERE " + Constants.DEPT_ID + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, removeSpaces(ID));
        
        ResultSet rs = st.executeQuery();
        Department d = new Department();
        
        while(rs.next()){
            d.setId(rs.getString(Constants.DEPT_ID));
            d.setDeptName(rs.getString(Constants.DEPT_NAME));
            d.setDeptCode(rs.getString(Constants.DEPT_CODE));
            d.setCollegeID(rs.getString(Constants.DEPT_COLLEGEID));
            d.setDeptSize(rs.getString(Constants.DEPT_SIZE));
            d.setIsObsolete(rs.getString(Constants.DEPT_ISOBSOLETE));
        }
        
        con.close();
        st.close();

        return d;
    }
    
    public static ArrayList<Department> getAllDepartments() throws SQLException{   
		ArrayList<Department> deptList = new ArrayList<>();
        Connection con = Connector.getConnector();
        /*
        SELECT b.building_id, b.building_name, COUNT(r.building_id) AS roomsAvailable
		FROM building b
		LEFT JOIN room r ON b.building_id = r.building_id
		GROUP BY building_id;
         * 
         */
        String query = "SELECT * FROM " + Constants.DEPARTMENT_TABLE + " ORDER BY " + Constants.DEPT_CODE + " ASC";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        //System.out.println(query);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        
        while(rs.next()){   
        	Department d = new Department();
        	d.setId(rs.getString(Constants.DEPT_ID));
        	d.setCollegeID(rs.getString(Constants.DEPT_COLLEGEID));
        	d.setDeptCode(rs.getString(Constants.DEPT_CODE));
        	d.setDeptName(rs.getString(Constants.DEPT_NAME));
        	d.setIsObsolete(rs.getString(Constants.DEPT_ISOBSOLETE));
        	d.setDeptSize(rs.getString(Constants.DEPT_SIZE));
        	
        	deptList.add(d);
        }
        
        con.close();
        st.close();
        
        return deptList;
    }
    
    public static ArrayList<String> getAllUniqueDepartments() throws SQLException{   
		ArrayList<String> deptList = new ArrayList<>();
        Connection con = Connector.getConnector();
        /*
        SELECT b.building_id, b.building_name, COUNT(r.building_id) AS roomsAvailable
		FROM building b
		LEFT JOIN room r ON b.building_id = r.building_id
		GROUP BY building_id;
         * 
         */
        String query = "SELECT * FROM " + Constants.DEPARTMENT_TABLE + " ORDER BY " + Constants.DEPT_CODE + " ASC";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        //System.out.println(query);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        
        while(rs.next()){   
        	String d;
        	d = rs.getString(Constants.DEPT_NAME);
        	
        	deptList.add(d);
        }
        
        con.close();
        st.close();
        
        return deptList;
    }
    
    public static String removeSpaces(String s){
        return s.replaceAll("\\s","");
    }
}
