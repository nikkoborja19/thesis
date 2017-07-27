package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.database.Connector;
import com.smith.model.*;

public class BuildingDAO {
	public static ArrayList<Building> getAllBuildingsWithRoomCount() throws SQLException{   
		ArrayList<Building> buildingList = new ArrayList<>();
        Connection con = Connector.getConnector();
        /*
        SELECT b.building_id, b.building_name, COUNT(r.building_id) AS roomsAvailable
		FROM building b
		LEFT JOIN room r ON b.building_id = r.building_id
		GROUP BY building_id;
         * 
         */
        String query = "SELECT b." + Constants.BUILDING_ID + ", b."+ Constants.BUILDING_CODE +", b." + Constants.BUILDING_NAME +", COUNT(r."+ Constants.ROOM_BUILDINGID +") AS roomsAvailable "+
        			"FROM "+ Constants.BUILDING_TABLE +" b "+
        			"LEFT JOIN "+ Constants.ROOM_TABLE +" r ON b." + Constants.BUILDING_ID + " = r."+ Constants.ROOM_BUILDINGID +" "+
        			"GROUP BY b." + Constants.BUILDING_ID + ";";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        System.out.println(query);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        
        while(rs.next()){   
        	Building b = new Building();
        	b.setId(rs.getString(Constants.BUILDING_ID));
        	b.setBuildingCode(rs.getString(Constants.BUILDING_CODE));
        	b.setBuildingName(rs.getString(Constants.BUILDING_NAME));
        	b.setRoomsAvailable(rs.getString("roomsAvailable"));
        	
        	buildingList.add(b);
        }
        
        con.close();
        st.close();
        
        return buildingList;
    }
}
