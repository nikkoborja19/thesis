package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.smith.database.Connector;
import com.smith.model.*;

/**
 *
 * @author asus
 */
public class CollegeDAO {
    
	public static int getCollegeIDByCode(String code) throws SQLException{
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + Constants.COLLEGE_TABLE + " WHERE " + Constants.COLLEGE_CODE + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, removeSpaces(code));
        
        ResultSet rs = st.executeQuery();
        College c = new College();
        
        while(rs.next()){
            c.setId(rs.getString(Constants.COLLEGE_ID));
        }
        
        con.close();
        st.close();
        return Integer.parseInt(c.getId());
    }
    
    public static String removeSpaces(String s){
        return s.replaceAll("\\s","");
    }
}
