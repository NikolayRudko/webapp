<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<
<head>
    <jsp:include page="_head.jsp"></jsp:include>
    <title>Register</title>
</head>
<body>
<div class="shell">
    <!-- Header -->
    <jsp:include page="_header.jsp"></jsp:include>
    <!-- End Header -->

    <!--Register-->
    <div id="register">

        <script>
            function validate() {
                var email = document.form.email.value;
                var firstName = document.form.firstName.value;
                var lastName = document.form.lastName.value;
                var password = document.form.password.value;
                var conPassword = document.form.conPassword.value;

                if (email == null || email === "") {
                    alert("Email can't be blank");
                    return false;
                }

                if (firstName == null || firstName === "") {
                    alert("First name can't be blank");
                    return false;
                }

                if (lastName == null || lastName === "") {
                    alert("Last name can't be blank");
                    return false;
                }

                if (password == null || password === "") {
                    alert("Password can't be blank");
                    return false;
                } else if (password.length < 6) {
                    alert("Password must be at least 6 characters long.");
                    return false;
                } else if (password !== conPassword) {
                    alert("Confirm Password should match with the Password");
                    return false;
                }
            }
        </script>
        <h2>Java Registration application using MVC and MySQL </h2>
        <form name="form" action="/register" method="post" onsubmit="return validate()">
            <table align="center">
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email"/></td>
                </tr>
                <tr>
                    <td>First name</td>
                    <td><input type="text" name="firstName"/></td>
                </tr>
                <tr>
                    <td>Last name</td>
                    <td><input type="text" name="lastName"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="conPassword"/></td>
                </tr>
                <tr>
                    <td><%=(request.getAttribute("errMessage") == null) ? ""
                            : request.getAttribute("errMessage")%>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Register">
                        <input type="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>

    </div>

    <!--end register-->

    <!-- Footer -->
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- End Footer -->
</div>
</body>
</html>
