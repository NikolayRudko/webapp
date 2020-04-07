package app.servlet;

import app.bean.Product;
import app.dao.ProductDAO;
import app.dao.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductList")
public class ProductList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String errorString = null;
        List<Product> list;

        try {
            list= ProductDAO.queryProduct();
/*
            HttpSession session = request.getSession(true);
            session.setAttribute("currentSessionList", list);
            request.getRequestDispatcher("/products.jsp").forward(request, response);
*/
            request.setAttribute("productList", list);

            // Forward к /WEB-INF/views/productListView.jsp
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/products.jsp");
            dispatcher.forward(request, response);

        } catch (Throwable theException) {
            theException.printStackTrace();
        }
    }
}
