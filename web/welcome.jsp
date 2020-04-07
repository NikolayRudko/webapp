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
    <div><h1>Welcome</h1>

        <% UserBean userBean = (UserBean) session.getAttribute("currentSessionUser");%>
        Welcome <%= userBean.getUserName() + " " + userBean.getUserPassword() %>

        <p>Dear: <%= userBean.getUserName()%></p>
        <p>Your password is: <%=userBean.getUserPassword()%></p>
    </div>
    <%--end user info--%>

    <!-- Footer -->
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- End Footer -->
</div>
</body>
</html>


