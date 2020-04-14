<%@ page import="app.bean.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="_head.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="css/Style.css"/>
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
        <h1>Добро пожаловать, <%= userBean.getFirstName() + " " + userBean.getLastName()%>
        </h1>
        <table>
            <tbody>
            <tr>
                <th scope="row">id:</th>
                <td><%= userBean.getId()%>
                </td>
            </tr>
            <tr>
                <th scope="row">Ваш e-mail is:</th>
                <td><%= userBean.getUserName()%>
                </td>
            </tr>
            <tr>
                <th scope="row">Ваше имя:</th>
                <td><%=userBean.getFirstName()%>
                </td>
            </tr>
            <tr>
                <th scope="row">Ваша фамилия:</th>
                <td><%=userBean.getLastName()%>
                </td>
            </tr>
            <tr>
                <th scope="row">Ваш пароль:</th>
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


