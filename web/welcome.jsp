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
    <div><h1>Welcome dear <%= userBean.getFirstName() + " " + userBean.getLastName()%></h1>
        <p>id: <%= userBean.getId()%></p>
        <p>Your e-mail is: <%= userBean.getUserName()%></p>
        <p>Your password is: <%=userBean.getUserPassword()%></p>
        <p>Your first name is: <%=userBean.getFirstName()%></p>
        <p>Your last name is: <%=userBean.getLastName()%></p>

    </div>
    <%--end user info--%>

    <!-- Footer -->
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- End Footer -->
</div>
</body>
</html>


