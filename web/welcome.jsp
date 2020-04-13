<%@ page import="app.bean.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="_head.jsp"></jsp:include>
    <title>Welcome</title>
</head>
<body>
<div class="shell">
    <!-- Header -->
    <jsp:include page="_header.jsp"></jsp:include>
    <!-- End Header -->


    <!-- User info-->
    <% UserBean userBean = (UserBean) session.getAttribute("currentSessionUser");%>
    <div id="welcome">
        <h1>Welcome dear <%= userBean.getFirstName() + " " + userBean.getLastName()%>
        </h1>
        <table>
            <tbody>
            <tr>
                <th scope="row">id:</th>
                <td><%= userBean.getId()%>
                </td>
            </tr>
            <tr>
                <th scope="row">Your e-mail is:</th>
                <td><%= userBean.getUserName()%>
                </td>
            </tr>
            <tr>
                <th scope="row">Your first name is:</th>
                <td><%=userBean.getFirstName()%>
                </td>
            </tr>
            <tr>
                <th scope="row">Your last name is:</th>
                <td><%=userBean.getLastName()%>
                </td>
            </tr>
            <tr>
                <th scope="row">Your password is:</th>
                <td><%=userBean.getUserPassword()%>
                </td>
            </tr>
            </tbody>
        </table>
   </div>
    <%--end user info--%>

    <!-- Footer -->
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- End Footer -->
</div>
</body>
</html>


