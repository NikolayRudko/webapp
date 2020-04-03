package workWithDB.utils;

import workWithDB.bean.UserAccount;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtils {
    public static UserAccount findUser(Connection conn, //
                                       String userName, String password) throws SQLException {

        String sql = "Select a.id, a.user_name, a.user_password from users a " //
                + " where a.user_name = ? and a.user_password= ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            int id = rs.getInt("id");
            UserAccount user = new UserAccount();
            user.setUserName(userName);
            user.setUserPassword(password);
            user.setId(id);
            return user;
        }
        return null;
    }

    public static UserAccount findUser(Connection conn, String userName) throws SQLException {

        String sql = "Select a.User_Name, a.Password, a.id from User_Account a "//
                + " where a.User_Name = ? ";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);

        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            String password = rs.getString("Password");
            int id = rs.getInt("id");
            UserAccount user = new UserAccount();
            user.setUserName(userName);
            user.setUserPassword(password);
            user.setId(id);
            return user;
        }
        return null;
    }
}
