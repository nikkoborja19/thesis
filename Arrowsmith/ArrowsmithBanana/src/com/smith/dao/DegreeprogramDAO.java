package com.smith.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.smith.constants.DegreeprogramEnum;
import com.smith.constants.FlowchartEnum;
import com.smith.database.Connector;
import com.smith.model.Constants;
import com.smith.model.Course;
import com.smith.model.Degreeprogram;

public class DegreeprogramDAO {
	public static Degreeprogram getCourseByID(String ID) throws SQLException{        
        Connection con = Connector.getConnector();
        String query = "SELECT * FROM " + DegreeprogramEnum.degreeprogram + " WHERE " + DegreeprogramEnum.degreeprogram_id + " = ?";
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        st.setString(1, ID);
        
        ResultSet rs = st.executeQuery();//wla pong variable dapat laman dito ty
        Degreeprogram d = new Degreeprogram();
        
        while(rs.next()){            
        	d.setDegreeprogramId(rs.getString(DegreeprogramEnum.degreeprogram_id.toString()));
        	d.setCollegeId(rs.getString(DegreeprogramEnum.college_id.toString()));
        	d.setDeptId(rs.getString(DegreeprogramEnum.dept_id.toString()));
        	d.setDegreeprogramCode(rs.getString(DegreeprogramEnum.degreeprogram_code.toString()));
        	d.setDegreeprogramName(rs.getString(DegreeprogramEnum.degreeprogram_name.toString()));
        }
        
        con.close();
        st.close();
        
        return d;
    }
	
	public static ArrayList<String> getDegreeList() throws SQLException{      
        Connection con = Connector.getConnector();
        String query = "SELECT DISTINCT " + DegreeprogramEnum.degreeprogram_id + " FROM " + DegreeprogramEnum.degreeprogram;
        PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
        
        System.out.println("PStatement: " + st);
        ResultSet rs = st.executeQuery();
        ArrayList<String> res = new ArrayList();
        
        while(rs.next()){            
        	res.add(rs.getString(FlowchartEnum.degreeprogram_id.toString()));
        }
        
        return res;
	}
}
