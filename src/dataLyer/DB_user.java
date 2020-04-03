package dataLyer;

import java.sql.*;

public class DB_user {

    //JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";

    /*
    //Data for working with local data base.
    //static final String DB_URL = "jdbc:mysql://localhost/webapp";

    // Database credentials for local DB
    static final String USER = "webappuser";
     static final String PASS = "Test@12345678";*/

    public boolean isValidUserLogin(String sUserName, String sUserPassword) throws SQLException {

        boolean isValidUser = false;

        Connection conn = null;
        Statement stmt = null;
        String sql = "";

        try {
            //STEP 2: Register JDBC Driver
            Class.forName("com.mysql.jdbc.Driver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");

            //workWithDB.conn = DriverManager.getConnection(DB_URL, USER, PASS);
            String DB_Url = System.getProperty("JDBC_CONNECTION_STRING");
            conn = DriverManager.getConnection(DB_Url);

            /*String DB_Url = System.getProperty("JDBC_CONNECTION_STRING");
            String DB_User = System.getProperty("JDBC_USER");
            String DB_Password = System.getProperty("JDBC_PASSWORD");
            String DB_Connection_String = DB_Url + "? User =" + DB_User + "& password =" + DB_Password;
            workWithDB.conn = DriverManager.getConnection(DB_Connection_String);*/

            //STEP 4: Execute a query
            System.out.println("Create a statement...");
            stmt = conn.createStatement();

            sql = "SELECT * FROM users WHERE user_name = \"" +
                    sUserName + "\" AND user_password = \"" + sUserPassword + "\"";

            System.out.println(sql);

            ResultSet rs = stmt.executeQuery(sql);

            //STEP 5: Extract data from result set
            if (rs.next()) {
                isValidUser = true;
            }

            //STEP 6: Clean-up environment
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException se) {
            if (conn != null) {
                //handle error for JDBC
                conn.close();
            }
            se.printStackTrace();

        } finally {
            //finally block used to close resources
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        System.out.println("Closing DB Connection");
        return isValidUser;
    }

}
