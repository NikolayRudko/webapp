package app.dao;

import app.bean.UserBean;
import app.conn.ConnectionManager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDAO {
    static Connection currentCon = null;
    static ResultSet rs = null;

    public static UserBean login(UserBean bean) {

        //preparing some objects for connection
        Statement stmt = null;

        String username = bean.getUserName();
        String password = bean.getUserPassword();

        String searchQuery = "SELECT * FROM users WHERE user_name = \""
                + username + "\" AND user_password = \"" + password + "\"";

        // "System.out.println" prints in the console; Normally used to trace the process
        System.out.println("Your user name is " + username);
        System.out.println("Your password is " + password);
        System.out.println("Query: " + searchQuery);

        try {
            //connect to DB
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            //boolean more = rs.next();

            // if user does not exist set the isValid variable to false
            if (!rs.next()) {
                System.out.println("Sorry, you are not a registered user! Please sign up first");
                bean.setValid(false);
            }

            //if user exists set the isValid variable to true
            else {
                String name = rs.getString("user_name");
                String userPassword = rs.getString("user_password");

                System.out.println("Welcome " + name);

                bean.setUserName(name);
                bean.setUserPassword(password);
                bean.setValid(true);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }
        //some exception handling
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
            }

            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }
                currentCon = null;
            }
        }
        return bean;
    }
}