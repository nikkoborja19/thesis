package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.Days;

public class DaysDAO {
	
	public static ArrayList<Days> getListDays(String offeringId) throws SQLException {
		ArrayList<Days> days = new ArrayList<Days>();
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + Constants.DAYS_TABLE + " WHERE " + Constants.DAYS_OFFERINGID + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setInt(1, Integer.parseInt(offeringId));
        
        ResultSet rs = st.executeQuery();
        
//        System.out.println("PStatement: " + st);
        
        while(rs.next()){
        	Days d = new Days();
            d.setDaysId(rs.getString(Constants.DAYS_ID));
        	d.setOfferingId(rs.getString(Constants.DAYS_OFFERINGID));
        	d.setClassDay(rs.getString(Constants.DAYS_CLASSDAY));
        	d.setBeginTime(rs.getString(Constants.DAYS_BEGINTIME));
        	d.setEndTime(rs.getString(Constants.DAYS_ENDTIME));
        	d.setRoomId(rs.getString(Constants.DAYS_ROOMID));
        	d.setRoom(RoomDAO.getRoomByID(d.getRoomId()));
        	
            days.add(d);
        }
        
        con.close();
        st.close();
        
        return days;
	}
}
