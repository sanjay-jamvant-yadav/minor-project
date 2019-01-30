/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Sanjay_Yadav
 */
public class SqlUtil {
    static String DB_URL="jdbc:mysql://localhost:3306/transport_management";
    static final String USERNAME="root";
    static final String PASSWORD="root";
    static Connection con;
//    static Statement stm;
    public static void connect() throws ClassNotFoundException,SQLException
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
//        stm=con.createStatement();
    }
    public static void create(String sql)throws SQLException
    {
        Statement st = con.createStatement();
        st.execute(sql);
    }
    public static void update(String sql) throws Exception
    {
                Statement st = con.createStatement();
        st.executeUpdate(sql);
    }
    public static ResultSet retreive(String sql)throws SQLException
    {
                Statement st = con.createStatement();
        ResultSet rs=st.executeQuery(sql);
        return rs;
    }
    public static void close()throws SQLException
    {
        con.close();
    }
    
//    public static void main(String[] args) {
//        try {
//            SqlUtil.connect();
//            ResultSet rs = SqlUtil.retreive("select * from user_credential;");
//            while(rs.next()){
//                System.out.println(rs.getString("usr_name"));
//            }
//            SqlUtil.close();
//        } catch (ClassNotFoundException ex) {
////            Logger.getLogger(SqlUtil.class.getName()).log(Level.SEVERE, null, ex);
//System.out.println("SqkUtil.java, line: 55:"+ex.getMessage());
//        } catch (SQLException ex) {
////            Logger.getLogger(SqlUtil.class.getName()).log(Level.SEVERE, null, ex);
//System.out.println("SqkUtil.java, line: 55:"+ex.getMessage());
//
//        }
//}
}
