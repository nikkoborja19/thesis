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

public class EquivalenceDAO {
	
	public static int checkIfTwoCoursesAreEquivalent(String course1ID, String course2ID) throws SQLException{
		Connection con = Connector.getConnector();

        String query = "SELECT COUNT(*) AS hasEquivalent FROM "+Constants.EQUIVALENCE_TABLE+" WHERE "+ Constants.EQUIVALENCE_ID + " = ? AND " + Constants.EQUIVALENCE_COURSEID + " = ?";
        
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setInt(1, Integer.parseInt(course1ID));
        st.setInt(2, Integer.parseInt(course2ID));
        ResultSet rs = st.executeQuery();
        
        int isEquivalent = 0;
        
        while(rs.next()){
            isEquivalent = Integer.parseInt(rs.getString("hasEquivalent"));
        }
        
        con.close();
        st.close();
        
        return isEquivalent;
	}
}
