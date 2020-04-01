package appLyer;

import dataLyer.DB_user;

import java.sql.SQLException;

public class ValidUser {
    public boolean isValidUserCredentials(String sUserName, String sUserPassword) throws SQLException {
        DB_user DB_user_object = new DB_user();
        return DB_user_object.isValidUserLogin(sUserName,sUserPassword);
    }
}
