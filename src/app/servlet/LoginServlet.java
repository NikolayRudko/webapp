package app.servlet;

import app.bean.UserBean;
import app.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserBean user = new UserBean();
        user.setUserName(request.getParameter("loginname"));
        user.setUserPassword(request.getParameter("password"));

        try {

            UserDAO.login(user);

            if (user.isValid()) {

                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", user);
                //logged-in page
                request.getRequestDispatcher("/welcome.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMassage", "Invalid login or password. Try again.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (Throwable theException) {
            theException.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.print("Login-name:" + request.getParameter("loginname") + "Password:" + request.getParameter("password"));
    }
}
