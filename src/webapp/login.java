package webapp;

import appLyer.ValidUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "login")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       /* PrintWriter out = response.getWriter();
        out.print("Login-name:" + request.getParameter("loginname") + "Password:" + request.getParameter("password"));*/

        ValidUser validUserObjects = new ValidUser();
        request.setAttribute("username", request.getParameter("loginname"));
        request.setAttribute("password", request.getParameter("password"));

        try {
            if (validUserObjects.isValidUserCredentials(request.getParameter("loginname"), request.getParameter("password"))) {
                request.getRequestDispatcher("/welcome.jsp").forward(request, response);
            }else {
                request.setAttribute("errorMassage" , "Invalid login or password. Try again.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.print("Login-name:" + request.getParameter("loginname") + "Password:" + request.getParameter("password"));
    }
}
