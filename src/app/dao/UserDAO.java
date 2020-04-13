package app.dao;

import app.bean.UserBean;
import app.conn.ConnectionManager;

import java.sql.*;

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
                int id = rs.getInt("id");
                String name = rs.getString("user_name");
                String userPassword = rs.getString("user_password");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");

                System.out.printf("Welcome: %s %s", firstName, lastName);
                System.out.println("Your e-mail: " + name);

                bean.setId(id);
                bean.setUserName(name);
                bean.setUserPassword(userPassword);
                bean.setFirstName(firstName);
                bean.setLastName(lastName);
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
                    e.printStackTrace();
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                currentCon = null;
            }
        }
        return bean;
    }

    public static String registerUser(UserBean newUserBean)
    {

        String userName = newUserBean.getUserName();
        String password = newUserBean.getUserPassword();
        String firstName = newUserBean.getFirstName();
        String lastName = newUserBean.getLastName();

        PreparedStatement pstm = null;

        //Insert user details into the table 'USERS'
     /*   String searchQuery = "insert into users(id,user_name,user_password,first_name,last_name)" +
                " values (NULL,?,?,?,?)"; */
        String searchQuery = "insert into users(user_name,user_password,first_name,last_name)" +
                " values (?,?,?,?)";
        System.out.println(searchQuery);
        try
        {
            currentCon = ConnectionManager.getConnection();
            //Making use of prepared statements here to insert bunch of data
            pstm = currentCon.prepareStatement(searchQuery);

            pstm.setString(1,userName);
            pstm.setString(2,password);
            pstm.setString(3,firstName);
            pstm.setString(4,lastName);
            pstm.executeUpdate();
            return "SUCCESS";
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        finally {
            //close
            if (pstm != null) {
                try {
                    pstm.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            //close
            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                currentCon = null;
            }
        }
        return "Oops.. Something went wrong there..!";
    }
}