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
    <%--  <% List<Product> products= (List<Product>) session.getAttribute("currentSessionUser");
          for (Product s : products)
              out.println(s);
      %>--%>
    <%--<style>
        /*  сверху и снизу отступ 50px   слева и справа отступ 20px */
        .products {
            padding: 50px 20px;
        }

        .products h1 {
            padding-bottom: 20px;
            color: #f5db2d;
            text-align: center;
        }

        table {
            table-layout: fixed;
            width: 100%;
            border-collapse: collapse;
            border: 3px solid black;
            color: white;
        }

        thead th:nth-child(1) {
            width: 5%;
        }

        thead th:nth-child(2) {
            width: 20%;
        }

        thead th:nth-child(3) {
            width: 65%;
        }

        thead th:nth-child(4) {
            width: 10%;
        }

        th, td {
            padding: 20px;
        }

        th {
            letter-spacing: 2px;
        }

        td {
            letter-spacing: 1px;
        }

        tbody td {
            text-align: center;
        }

        tfoot th {
            text-align: right;
        }

        thead, tfoot {
            background: #f5db2d;
            text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.4);
        }

        thead th, tfoot th, tfoot td {
            background: #f5db2d;
            border: 3px solid black;
        }

        tbody tr:nth-child(odd) {
            background-color: #292929;
        }

        tbody tr:nth-child(even) {
            background-color: #191919;
        }

       /* tbody tr {
            background-image: url(noise.png);
        }*/

        table {
            background-color: #292929;
        }

        caption {
         /*   font-family: 'Rock Salt', cursive;*/
            padding: 20px;
            font-style: italic;
            caption-side: bottom;
            color: #666;
            text-align: right;
            letter-spacing: 1px;
        }
    </style>--%>
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


