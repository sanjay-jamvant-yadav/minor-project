package util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Dell
 */
public class SqlUtil {
    
    static Statement st;
    static Connection con;
    static final String DB_URL="jdbc:mysql://localhost:3306/transport_management";
    static final String USERNAME="root@localhost";
    static final String PASSWORD="root";
    
  public static void connect() throws ClassNotFoundException,SQLException
   {
       Class.forName("com.mysql.jdbc.Driver");
       con=DriverManager.getConnection(DB_URL,USERNAME,PASSWORD);
       st=con.createStatement();
   }
   
  public static void create(String query)throws SQLException
   {
       st.execute(query);
   }
    
  public static void update(String query)throws SQLException
   {
       st.executeUpdate(query);
   }
   
  public static ResultSet retreive(String query)throws SQLException
   {
       ResultSet rs=st.executeQuery(query);
       return rs;
   }
  public  static void close()
    {
        try{
        st.close();
        con.close();
        }catch(SQLException ex)
        {
            System.out.println("Problem in closing db"+ex);
        }
    }
}
