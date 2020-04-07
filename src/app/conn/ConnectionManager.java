package app.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

    static Connection con;
    static String url;

    public static Connection getConnection() {
        String hostName = "localhost";
        String dbName = "webapp";
        String userName = "webappuser";
        String password = "Test@12345678";

        try {
            String url = "jdbc:mysql://" + hostName + ":3306/" + dbName;
            Class.forName("com.mysql.jdbc.Driver");
            try {
                con = DriverManager.getConnection(url, userName, password);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        }
        return con;
    }
}