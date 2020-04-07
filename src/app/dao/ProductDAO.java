package app.dao;

import app.bean.Product;
import app.conn.ConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    static Connection currentCon = null;
    static ResultSet rs = null;

    public static List<Product> queryProduct() throws SQLException {
        PreparedStatement pstm = null;
        String searchQuery = "Select a.id, a.product_name, a.product_description, a.product_price from product a ";

        System.out.println("Query: " + searchQuery);
        List<Product> list = new ArrayList<Product>();
        try {
            currentCon = ConnectionManager.getConnection();
            pstm = currentCon.prepareStatement(searchQuery);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("product_name");
                String description = rs.getString("product_description");
                float price = rs.getFloat("product_price");
                Product product = new Product();
                product.setId(id);
                product.setName(name);
                product.setDescription(description);
                product.setPrice(price);
                list.add(product);
            }


        } catch (Exception ex) {
            System.out.println("Statement failed: An Exception has occurred! " + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                rs = null;
            }

            if (pstm != null) {
                try {
                    pstm.close();
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

        return list;
    }
}
