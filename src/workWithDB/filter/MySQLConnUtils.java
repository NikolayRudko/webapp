package workWithDB.filter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnUtils {

    public static Connection getMySQLConnection(String  DB_Url)
            throws SQLException {
        /* JDBC_CONNECTION_STRING - is parameter of VM options.
        -DJDBC_CONNECTION_STRING='jdbc:mysql:/aafsi6lsa4cz72.cjrib4x2hzoc.us-east-2.rds.amazonaws.com:3306/webapp'
        -DJDBC_USER='root'
        -DJDBC_PASSWORD='Test12345678'*/
       /* String DB_Url = System.getProperty("JDBC_CONNECTION_STRING");*/
        Connection conn = DriverManager.getConnection(DB_Url);
        return conn;
    }
    public static Connection getMySQLConnection()
            throws ClassNotFoundException, SQLException {
        // Примечание: Изменить параметры соединения соответствующе.
        String hostName = "localhost";
        String dbName = "webapp";
        String userName = "webappuser";
        String password = "Test@12345678";
        return getMySQLConnection(hostName, dbName, userName, password);
    }

    public static Connection getMySQLConnection(String hostName, String dbName,
                                                String userName, String password) throws SQLException,
            ClassNotFoundException {

        Class.forName("com.mysql.jdbc.Driver");

        // Структура URL Connection для MySQL:
        // Например:
        // jdbc:mysql://localhost:3306/simplehr
        String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;

        Connection conn = DriverManager.getConnection(connectionURL, userName,
                password);
        return conn;
    }

}