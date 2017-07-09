package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Connector;
import object.Constants;
import object.*;

/**
 *
 * @author asus
 */
public class CollegeDAO {
    
public int getCollegeIDWithCode(String code) throws SQLException{
        Connection con = new Connector().getConnector();
        Statement st = null;
        String query = "SELECT * FROM " + Constants.COLLEGE_TABLE + " WHERE " + Constants.COLLEGE_CODE + " LIKE '" + removeSpaces(code) + "';";
        st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        College c = new College();
        
        while(rs.next()){
            c.setId(rs.getString(Constants.COLLEGE_ID));
        }
        
        con.close();
        st.close();
        return Integer.parseInt(c.getId());
    }
    
    public String removeSpaces(String s){
        return s.replaceAll("\\s","");
    }
}
