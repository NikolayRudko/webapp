package app.dao;

import app.bean.Product;
import app.bean.Service;
import app.conn.ConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO {
    static Connection currentCon = null;
    static ResultSet rs = null;

    public static List<Service> queryService() throws SQLException {
        PreparedStatement pstm = null;
        String searchQuery = "Select a.id, a.service_name, a.service_description, a.service_price from services a";

        System.out.println("Query: " + searchQuery);
        List<Service> list = new ArrayList<Service>();
        try {
            currentCon = ConnectionManager.getConnection();
            pstm = currentCon.prepareStatement(searchQuery);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("service_name");
                String description = rs.getString("service_description");
                float price = rs.getFloat("service_price");
                Service service = new Service();

                service.setId(id);
                service.setName(name);
                service.setDescription(description);
                service.setPrice(price);
                list.add(service);
            }

        } catch (Exception ex) {
            System.out.println("Statement failed: An Exception has occurred! " + ex);
        } finally {
            //close
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                rs = null;
            }
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
        return list;
    }
}