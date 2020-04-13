<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <jsp:include page="_head.jsp"></jsp:include>
    <title>Products</title>
</head>
<body>
<div class="shell">
    <!-- Header -->
    <jsp:include page="_header.jsp"></jsp:include>
    <!-- End Header -->

    <!-- Content-->
    <div class="products">
        <h1>Товары</h1>

        <p style="color: #fc0505;">${errorString}</p>

        <table>
            <caption>Products</caption>
            <thead>
            <tr>
                <th scope="col">№</th>
                <th scope="col">Название</th>
                <th scope="col">Описание</th>
                <th scope="col">Цена</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${productList}" var="product">
                <tr>
                    <th scope="row">${product.id}</th>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>${product.price}</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <th scope="row" colspan="4">Ценну уточняйте у специалиста</th>
            </tr>
            </tfoot>
        </table>
    </div>
    <%--end Content--%>

    <!-- Footer -->
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- End Footer -->
</div>
</body>
</html>


