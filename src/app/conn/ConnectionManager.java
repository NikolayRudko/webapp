package app.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

    static Connection con;
    static String url;

    public static Connection getConnection() {
        //for local DB
        String hostName = "localhost";
        String dbName = "webapp";
        String userName = "webappuser";
        String password = "Test@12345678";
        String url = "jdbc:mysql://" + hostName + ":3306/" + dbName;

        //for hosting DB
        String DB_Url = System.getProperty("JDBC_CONNECTION_STRING");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                //for local DB
                con = DriverManager.getConnection(url, userName, password);
                //for hosting DB
                //con = DriverManager.getConnection(DB_Url);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;
    }
}