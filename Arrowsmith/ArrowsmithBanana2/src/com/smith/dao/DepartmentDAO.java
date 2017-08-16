package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.smith.database.Connector;
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
    
    public static String removeSpaces(String s){
        return s.replaceAll("\\s","");
    }
}
