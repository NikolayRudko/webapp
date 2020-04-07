<%@ page import="java.util.List" %>
<%@ page import="app.bean.Product" %>
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
    <div>
        <p>Products</p>


        <p style="color: red;">${errorString}</p>
        <%--    <table>
                <c:forEach items="${productList}" var="product">
                    <tr>
                        <td><c:out value="${product.id}" /></td>
                &lt;%&ndash;        <td><c:out value="${product.barCode}" /></td>&ndash;%&gt;
                    </tr>
                </c:forEach>
            </table>--%>

        <table border="1" cellpadding="5" cellspacing="1">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>

            </tr>
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>${product.price}</td>
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


