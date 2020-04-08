<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <jsp:include page="_head.jsp"></jsp:include>
    <title>Services</title>
</head>
<body>
<div class="shell">
    <!-- Header -->
    <jsp:include page="_header.jsp"></jsp:include>
    <!-- End Header -->

    <!-- Content-->
    <div>
        <p>Services</p>

        <p style="color: red;">${errorString}</p>

        <table border="1" cellpadding="5" cellspacing="1">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>

            </tr>
            <c:forEach items="${serviceList}" var="service">
            <tr>
                <td>${service.id}</td>
                <td>${service.name}</td>
                <td>${service.description}</td>
                <td>${service.price}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
    <%--end Content--%>

    <!-- Footer -->
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- End Footer -->
</div>
</body>
</html>


