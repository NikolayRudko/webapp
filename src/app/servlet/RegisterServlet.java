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

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Copying all the input parameters in to local variables
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");

        System.out.println("The registration service is running!");

        UserBean newUserBean = new UserBean();
        //Using Java Beans - An easiest way to play with group of related data
        newUserBean.setUserName(email);
        newUserBean.setUserPassword(password);
        newUserBean.setFirstName(firstName);
        newUserBean.setLastName(lastName);

        //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        String userRegistered = UserDAO.registerUser(newUserBean);
        //On success, you can display a message to user on Home page
        if (userRegistered.equals("SUCCESS")) {
            HttpSession session = request.getSession(true);
            session.setAttribute("currentSessionUser", newUserBean);
            //logged-in page
            request.getRequestDispatcher("/welcome.jsp").forward(request, response);
        } else   //On Failure, display a meaningful message to the User.
        {
            request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.print("doGet method");
    }
}
