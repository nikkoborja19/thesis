package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.Days;
import com.smith.model.Faculty;
import com.smith.model.Load;
import com.smith.model.Offering;
import com.smith.model.Timeframe;

public class LoadDAO {
	public static Load getLoadByID(String ID, String startYear, String endYear, String term) throws SQLException{      
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + Constants.LOADS_TABLE + " WHERE " + Constants.LOADS_FACULTYID + " = ? AND " + Constants.LOADS_STARTYEAR + " = ? AND "
                        + Constants.LOADS_ENDYEAR + " = ? AND " + Constants.LOADS_TERM + " = ? ";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, ID);
        st.setString(2, startYear);
        st.setString(3, endYear);
        st.setString(4, term);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        //System.out.println(st.toString());
        Load l = new Load();
        
        while(rs.next()){
            l.setLoadId(rs.getString(Constants.LOADS_ID));
            l.setFacultyId(rs.getString(Constants.LOADS_FACULTYID));
            l.setCollegeId(rs.getString(Constants.LOADS_COLLEGEID));
            l.setDeptId(rs.getString(Constants.LOADS_DEPTID));
            l.setAdminLoad(rs.getString(Constants.LOADS_ADMINLOAD));
            l.setResearchLoad(rs.getString(Constants.LOADS_RESEARCHLOAD));
            l.setTeachingLoad(rs.getString(Constants.LOADS_TEACHINGLOAD));
            l.setNonAcadLoad(rs.getString(Constants.LOADS_NONACADLOAD));
            l.setDeloading(rs.getString(Constants.LOADS_DELOADING));
            l.setTotalLoad(rs.getString(Constants.LOADS_TOTALLOAD));
            l.setPreparations(rs.getString(Constants.LOADS_PREPARATIONS));
            l.setIsOnLeave(rs.getString(Constants.LOADS_ISONLEAVE));
            l.setLeaveType(rs.getString(Constants.LOADS_LEAVETYPE));
            l.setTimestamp(rs.getString(Constants.LOADS_TIMESTAMP));
            
            String loadstartYear = rs.getString(Constants.LOADS_STARTYEAR);
            String loadendYear = rs.getString(Constants.LOADS_ENDYEAR);
            String loadterm = rs.getString(Constants.LOADS_TERM);
            
            //System.out.println("isOnLeave: " + l.getIsOnLeave());
            
            l.setTimeframe(new Timeframe(loadstartYear, loadendYear, loadterm)); //what is this for bro haha   
        }

        con.close();
        st.close();
        
        
        
        return l;
    }
    
	public static void insertNewLoadRow(String facultyID, String collegeID, String deptID, String startYear, String endYear, String term) throws SQLException{
		
        try{
            Connection con = new Connector().getConnector();
            PreparedStatement ps;
            
            String query = "INSERT INTO " + Constants.LOADS_TABLE + " (" +
                    Constants.LOADS_FACULTYID + ", " + Constants.LOADS_COLLEGEID + ", " + Constants.LOADS_DEPTID + ", " + Constants.LOADS_STARTYEAR+ ", " + Constants.LOADS_ENDYEAR + ", " +
                    Constants.LOADS_TERM + ", " + Constants.LOADS_ADMINLOAD + ", " + Constants.LOADS_RESEARCHLOAD + ", " + Constants.LOADS_TEACHINGLOAD+ ", " + Constants.LOADS_NONACADLOAD + ", " +
                    Constants.LOADS_DELOADING + ", " + Constants.LOADS_TOTALLOAD + ", " + Constants.LOADS_PREPARATIONS + ", " + Constants.LOADS_HASRESEARCHLOAD+ ", " + Constants.LOADS_ISADMIN +") VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            
            System.out.println(query);
            ps = con.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(facultyID));
            ps.setInt(2, Integer.parseInt(collegeID));
            ps.setInt(3, Integer.parseInt(deptID));
            ps.setInt(4, Integer.parseInt(startYear));
            ps.setInt(5, Integer.parseInt(endYear));
            ps.setInt(6, Integer.parseInt(term));
            ps.setInt(7, 0);
            ps.setInt(8, 0);
            ps.setInt(9, 0);
            ps.setInt(10, 0);
            ps.setInt(11, 0);
            ps.setInt(12, 0);
            ps.setInt(13, 0);
            ps.setInt(14, 0);
            ps.setInt(15, 0);

            //ps.executeUpdate();

            ps.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
	
    public static ArrayList<Timeframe> getLoadAY() throws SQLException{    
        ArrayList<Timeframe> listTimeframe = new ArrayList();
        Connection con = Connector.getConnector();
        String query = 
                "SELECT DISTINCT " + Constants.LOADS_STARTYEAR + ", " + Constants.LOADS_ENDYEAR + ", " + Constants.LOADS_TERM + " " +
                "FROM " + Constants.LOADS_TABLE + " ";
        
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        
        while(rs.next()){            
            String startYear = rs.getString(Constants.LOADS_STARTYEAR);
            String endYear = rs.getString(Constants.LOADS_ENDYEAR);
            String term = rs.getString(Constants.LOADS_TERM);
            
            Timeframe t = new Timeframe(startYear, endYear, term);
            
            listTimeframe.add(t);
        }
        
        con.close();
        st.close();
        
        return listTimeframe;
    }
    
    public static void addNewLoadsId (String facultyId, String startYear, String endYear, String term) throws SQLException {
        Connection con = Connector.getConnector();
        Faculty f = FacultyDAO.getFacultyByID(facultyId, startYear, endYear, term);
        
        String query = "INSERT INTO " + Constants.LOADS_TABLE + "(" + Constants.LOADS_FACULTYID + " , " + Constants.LOADS_STARTYEAR + " , " + Constants.LOADS_ENDYEAR
                + " , " + Constants.LOADS_TERM + " , " + Constants.LOADS_COLLEGEID +" , " + Constants.LOADS_DEPTID + " , " 
        		+ Constants.LOADS_ADMINLOAD + " , " + Constants.LOADS_RESEARCHLOAD + " , " + Constants.LOADS_TEACHINGLOAD + " , " 
                + Constants.LOADS_TOTALLOAD + " , " + Constants.LOADS_HASRESEARCHLOAD + " , " + Constants.LOADS_NONACADLOAD + 
                " , " + Constants.LOADS_DELOADING + " , " + Constants.LOADS_PREPARATIONS + " , " + Constants.LOADS_ISADMIN+") " +
                "VALUES (" + facultyId +  "," + startYear + "," + endYear + "," + term + "," + f.getCollegeID() 
                	+ "," + f.getDeptID() + "," + 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0 +")";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.executeUpdate();
        
    }
    
    public static String getLoadsId(String facultyId, String startYear, String endYear, String term) throws SQLException {
        Connection con = Connector.getConnector();
        String query = "SELECT " + Constants.LOADS_ID + " FROM " + Constants.LOADS_TABLE + " WHERE " + Constants.LOADS_FACULTYID + " = ? AND " + Constants.LOADS_STARTYEAR + " = ? AND "
                        + Constants.LOADS_ENDYEAR + " = ? AND " + Constants.LOADS_TERM + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        st.setString(1, facultyId);
        st.setString(2, startYear);
        st.setString(3, endYear);
        st.setString(4, term);
        
        int loadsId = 0;
        
        ResultSet rs = st.executeQuery();
        if(rs.next())
            loadsId = rs.getInt(Constants.LOADS_ID);
        
        
        
        return String.valueOf(loadsId);
        
    }
    
    public static int getLastRecordIndex() throws SQLException{
        Connection con = Connector.getConnector();
        Statement st = null;
        //String query = "SELECT * FROM " + Constants.OFFERING_TABLE + " ORDER BY " + Constants.OFFERING_ID + " DESC LIMIT 1";
        String query = "SELECT MAX("+Constants.LOADS_ID+") AS maxID FROM "+Constants.LOADS_TABLE+";";
        st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        Load l = new Load();
        
        while(rs.next()){
            l.setLoadId(rs.getString("maxID"));
        }
        
        con.close();
        st.close();
        
        return Integer.parseInt(l.getLoadId());
    }
    
    public static int getFacultyPreparationCount(String facultyId, String startYear, String endYear, String term) throws SQLException{
    	Connection con = Connector.getConnector();
        Statement st = null;

        String query = "SELECT * FROM "+Constants.LOADS_TABLE+" l, " + Constants.FACULTY_TABLE + " f WHERE "+
        			"l." + Constants.LOADS_FACULTYID + " = f." + Constants.FACULTY_ID + " AND l." + Constants.LOADS_STARTYEAR +
        			" = " + startYear + " AND l." + Constants.LOADS_ENDYEAR + " = " + endYear + " AND l." + Constants.LOADS_TERM + " = " + term;
        st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        Integer count = 0;
        
        while(rs.next()){
            count = Integer.parseInt(rs.getString(Constants.LOADS_PREPARATIONS));
        }
        
        con.close();
        st.close();
        
        return count;
    }
    
    public static int updateFacultyPreparationCount(String facultyId, String startYear, String endYear, String term) throws SQLException{
    	Connection con = Connector.getConnector();

        String query = "UPDATE " + Constants.LOADS_TABLE + " SET "+ Constants.LOADS_PREPARATIONS +" = " + Constants.LOADS_PREPARATIONS + " + 1 WHERE " + Constants.LOADS_FACULTYID+ " = ?";
        
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setInt(1, Integer.parseInt(facultyId));
        
        st.executeUpdate(); //use execute update instead of execute query
           
        con.close();
        st.close();
        
        return 1;
    }
    
    public static int decreaseFacultyPreparationCount(String facultyId, String startYear, String endYear, String term) throws SQLException{
    	Connection con = Connector.getConnector();

        String query = "UPDATE " + Constants.LOADS_TABLE + " SET "+ Constants.LOADS_PREPARATIONS +" = " + Constants.LOADS_PREPARATIONS + " - 1 WHERE " + Constants.LOADS_FACULTYID+ " = ?";
        
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setInt(1, Integer.parseInt(facultyId));
        
        st.executeUpdate(); //use execute update instead of execute query
           
        con.close();
        st.close();
        
        return 1;
    }
    
}
