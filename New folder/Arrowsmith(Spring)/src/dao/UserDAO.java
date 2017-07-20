package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Connector;
import object.*;

/**
 *
 * @author asus
 */
public class UserDAO {
    public void insertUser(User u){
        try{
            Connection con = new Connector().getConnector();
            PreparedStatement ps;
            String query = "INSERT INTO " + Constants.USERS_TABLE + " (" + Constants.USERS_ID + ", " +
                    Constants.USERS_COLLEGEID + ", " + Constants.USERS_DEPTID + ", " + Constants.USERS_FIRSTNAME + ", " + Constants.USERS_MIDDLENAME + ", " + Constants.USERS_LASTNAME + ", " + Constants.USERS_TYPE + ", " + Constants.USERS_PASSWORD + ") VALUES(?,?,?,?,?,?,?,?);";

            ps = con.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(u.getId()));
            ps.setInt(2, new CollegeDAO().getCollegeIDWithCode(u.getCollegeID()));
            ps.setInt(3, new DepartmentDAO().getDepartmentIDWithCode(u.getDeptID()));
            ps.setString(4, u.getFirstName());
            ps.setString(5, u.getMiddleName());
            ps.setString(6, u.getLastName());
            ps.setString(7, u.getUserType());
            ps.setString(8, u.getUserPassword());

            ps.executeUpdate();

            ps.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public ArrayList<User> getAllUsers() throws SQLException{
        Connection con = new Connector().getConnector();
        Statement st = null;
        String query = "SELECT * FROM " + Constants.USERS_TABLE;
        st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        ArrayList<User> users = new ArrayList<User>();
        
        while(rs.next()){
            User u = new User();
            u.setId(rs.getString(Constants.USERS_ID));
            u.setCollegeID(rs.getString(Constants.USERS_COLLEGEID)); 
            u.setDeptID(rs.getString(Constants.USERS_DEPTID)); 
            u.setFirstName(rs.getString(Constants.USERS_FIRSTNAME)); 
            u.setMiddleName(rs.getString(Constants.USERS_MIDDLENAME)); 
            u.setLastName(rs.getString(Constants.USERS_LASTNAME)); 
            u.setUserType(rs.getString(Constants.USERS_TYPE)); 
            u.setUserPassword(rs.getString(Constants.USERS_PASSWORD)); 

            users.add(u);
        }
        
        con.close();
        st.close();
        
        return users;
    }
    
    public User getUserWithIDNumber(String ID) throws SQLException{
        
        Connection con = new Connector().getConnector();
        Statement st = null;
        String query = "SELECT * FROM " + Constants.USERS_TABLE + " WHERE " + Constants.USERS_ID + " LIKE '" + ID + "'";
        st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        User u = new User("","","","","","","","");
        
        while(rs.next()){
            
            u.setId(rs.getString(Constants.USERS_ID));
            u.setCollegeID(rs.getString(Constants.USERS_COLLEGEID)); 
            u.setDeptID(rs.getString(Constants.USERS_DEPTID)); 
            u.setFirstName(rs.getString(Constants.USERS_FIRSTNAME)); 
            u.setMiddleName(rs.getString(Constants.USERS_MIDDLENAME)); 
            u.setLastName(rs.getString(Constants.USERS_LASTNAME)); 
            u.setUserType(rs.getString(Constants.USERS_TYPE)); 
            u.setUserPassword(rs.getString(Constants.USERS_PASSWORD)); 

        }
        
        con.close();
        st.close();
        
        return u;
    }
}
