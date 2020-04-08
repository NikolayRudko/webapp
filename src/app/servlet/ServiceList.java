package app.servlet;

import app.bean.Service;
import app.dao.ServiceDAO;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceList")
public class ServiceList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Service> list;

        try {
            list= ServiceDAO.queryService();
            request.setAttribute("serviceList", list);

            // Forward to products.jsp
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/services.jsp");
            dispatcher.forward(request, response);
        } catch (Throwable theException) {
            theException.printStackTrace();
        }
    }
}
