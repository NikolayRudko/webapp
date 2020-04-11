<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="_head.jsp"></jsp:include>
    <title>Login</title>
</head>
<body>
<div class="shell">
    <!-- Header -->
    <jsp:include page="_header.jsp"></jsp:include>
    <!-- End Header -->

    <!--login-->
    <div id="login">
        <h1>Авторизация</h1>
        <form action="/loginServlet" method="post" class="my-form">
            <div class="form-group">
                <label for="loginname">Введите e-mail:</label>
                <input type="text" name="loginname" id="loginname" placeholder="E-mail"/>
            </div>
            <div class="form-group">
                <label for="password">Введите пароль:</label>
                    <input type="password" name="password" id="password" placeholder="Пароль"/>
            </div>
            <div class="form-group">
                <a href="#" id="s-h-pass">Показать пароль</a>
            </div>
            <div class="form-group">
                <input id="enter" type="submit" value="Вход"/>
            </div>
        </form>
        <p>${errorMassage}</p>
    </div>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#s-h-pass').click(function () {
                var type = $('#password').attr('type') == "text" ? "password" : 'text',
                    c = $(this).text() == "Скрыть пароль" ? "Показать пароль" : "Скрыть пароль";
                $(this).text(c);
                $('#password').prop('type', type);
            });
        });
    </script>
    <!--end login-->

    <!-- Footer -->
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- End Footer -->
</div>
</body>
</html>
