package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.smith.constants.RoomEnum;
import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.Course;
import com.smith.model.Room;

public class RoomDAO {
	public static Room getRoomByID(String ID) throws SQLException{        
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + RoomEnum.room + " WHERE " + RoomEnum.room_id + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, ID);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        Room r = new Room();
        
        while(rs.next()){            
        	r.setRoomId(rs.getString(RoomEnum.room_id.toString()));
        	r.setRoomCode(rs.getString(RoomEnum.room_code.toString()));
        	r.setRoomLocation(rs.getString(RoomEnum.room_location.toString()));
        	r.setRoomCapacity(rs.getString(RoomEnum.room_capacity.toString()));
        }
        
        con.close();
        st.close();
        
        return r;
    }
}
