package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Connector;
import object.Constants;
import object.Department;

/**
 *
 * @author asus
 */
public class DepartmentDAO {
    
    public int getDepartmentIDWithCode(String code) throws SQLException{
        Connection con = new Connector().getConnector();
        Statement st = null;
        String query = "SELECT * FROM " + Constants.DEPARTMENT_TABLE + " WHERE " + Constants.DEPT_CODE + " LIKE '" + removeSpaces(code) + "';";
        st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        Department d = new Department();
        
        while(rs.next()){
            d.setId(rs.getString(Constants.DEPT_ID));
        }
        
        con.close();
        st.close();

        if(d.getId() == null || d.getId().isEmpty()) return 0;
        else return Integer.parseInt(d.getId());
    }
    
    public String removeSpaces(String s){
        return s.replaceAll("\\s","");
    }
}
