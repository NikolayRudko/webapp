<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <div class="register">
        <script>
            function validate() {
                var email = document.form.email.value;
                var firstName = document.form.firstName.value;
                var lastName = document.form.lastName.value;
                var password = document.form.password.value;
                var conPassword = document.form.conPassword.value;

                if (email == null || email === "") {
                    alert("Поле Email не заполнено");
                    return false;
                }

                if (firstName == null || firstName === "") {
                    alert("Поле Имя не заполнено");
                    return false;
                }

                if (lastName == null || lastName === "") {
                    alert("Поле Фамилия не заполнено");
                    return false;
                }

                if (password == null || password === "") {
                    alert("Поле Пароль не заполнено");
                    return false;
                } else if (password.length < 6) {
                    alert("Пароль не может быть короче чем 6 символов");
                    return false;
                } else if (password !== conPassword) {
                    alert("Пароли не совпадают");
                    return false;
                }
            }
        </script>

        <h1>Регистрация</h1>
        <form name="form" action="/register" method="post" onsubmit="return validate()" class="my-form">
            <div class="form-group">
                <label for="email">Введите e-mail:</label>
                <input type="text" name="email" id="email" placeholder="E-mail"/>
                <label for="firstName">Введите имя:</label>
                <input type="text" name="firstName" id="firstName" placeholder="Имя"/>
                <label for="lastName">Введите фамилию:</label>
                <input type="text" name="lastName" id="lastName" placeholder="Фаимилия"/>
                <label for="password">Введите пароль:</label>
                <input type="password" name="password" id="password" placeholder="Пароль"/>
                <label for="conPassword">Поторите пароль:</label>
                <input type="password" name="conPassword" id="conPassword" placeholder="Пароль"/>
            </div>
            <div class="form-control">
                <input id="cancel" type="reset" value="Отмена">
                <input id="enter" type="submit" value="Регистрация">
            </div>
            <p><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
        </form>

    </div>

    <!--end register-->

    <!-- Footer -->
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- End Footer -->
</div>
</body>
</html>
