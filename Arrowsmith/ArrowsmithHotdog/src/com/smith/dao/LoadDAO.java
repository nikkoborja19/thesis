package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.Load;
import com.smith.model.Timeframe;

public class LoadDAO {
	public static Load getLoadByID(String ID) throws SQLException{        
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + Constants.LOADS_TABLE + " WHERE " + Constants.LOADS_FACULTYID + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, ID);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
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
            
        	String startYear = rs.getString(Constants.LOADS_STARTYEAR);
        	String endYear = rs.getString(Constants.LOADS_ENDYEAR);
        	String term = rs.getString(Constants.LOADS_TERM);
        	
        	System.out.println("isOnLeave: " + l.getIsOnLeave());
        	
        	l.setTimeframe(new Timeframe(startYear, endYear, term));
        }
        
        con.close();
        st.close();
        
        return l;
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
}
