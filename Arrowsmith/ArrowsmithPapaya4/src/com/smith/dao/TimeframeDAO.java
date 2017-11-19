package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.Timeframe;

public class TimeframeDAO {
	public static ArrayList<Timeframe> getDistinctTimeframes() throws SQLException{        
        Connection con = Connector.getConnector();
        String query = "SELECT DISTINCT start_year, end_year, term FROM " + Constants.OFFERING_TABLE;
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        ArrayList<Timeframe> timeframes = new ArrayList();
        
        while(rs.next()){            
            Timeframe t = new Timeframe();
            
            t.setStartYear(rs.getString(Constants.OFFERING_STARTYEAR));
            t.setEndYear(rs.getString(Constants.OFFERING_ENDYEAR));
            t.setTerm(rs.getString(Constants.OFFERING_TERM));
            
            timeframes.add(t);
        }
        
        con.close();
        st.close();
        
        return timeframes;
    }
	
}
