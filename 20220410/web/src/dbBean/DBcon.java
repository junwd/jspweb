package dbBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBcon {

    private String driverStr = "com.mysql.jdbc.Driver";
    private String connStr = "jdbc:mysql://localhost:3306/votedb?useUnicode=true&characterEncoding=utf-8";
    private static final String DATABASE_USRE = "root";
    private static final String DATABASE_PASSWORD ="";
    private Connection conn = null;
    private Statement stmt = null;

    public DBcon() {
        try {
            Class.forName(driverStr);
        } 
        catch (ClassNotFoundException ex) {  System.out.println(ex.getMessage());
        }
    }
    public void setDriverStr(String dstr) {
        driverStr = dstr;
    }

    public void setConnStr(String cstr) {
        connStr = cstr;
    }

    public ResultSet executeQuery(String sql) {
        ResultSet rs = null;
        try {
            conn = DriverManager.getConnection(connStr, DATABASE_USRE, DATABASE_PASSWORD);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        } 
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return rs;
    }
    public int executeUpdate(String sql) {
        int result = 0;
        try{
            conn = DriverManager.getConnection(connStr, DATABASE_USRE, DATABASE_PASSWORD);
            stmt = conn.createStatement();
            result = stmt.executeUpdate(sql);
        } 
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return result;
    }
    public void close() {
        try {	stmt.close();
            conn.close();
        } catch (SQLException ex) {		System.out.println(ex.getMessage());
        }
    }
}
