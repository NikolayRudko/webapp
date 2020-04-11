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
    <div class="services">
        <h1>Services</h1>

        <p style="color: red;">${errorString}</p>

        <table>
            <caption>Services</caption>
            <thead>
            <tr>
                <th scope="col">№</th>
                <th scope="col">Название</th>
                <th scope="col">Описание</th>
                <th scope="col">Цена</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${serviceList}" var="service">
                <tr>
                    <th scope="row">${service.id}</th>
                    <td>${service.name}</td>
                    <td>${service.description}</td>
                    <td>${service.price}</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <th scope="row" colspan="4">Ценну уточняйте у специалиста</th>
            </tr>
            </tfoot>
        </table>

     <%--   <table>
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
        </table>--%>
    </div>
    <%--end Content--%>

    <!-- Footer -->
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- End Footer -->
</div>
</body>
</html>


