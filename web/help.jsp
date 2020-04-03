<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="_head.jsp"></jsp:include>
    <title>Help</title>
</head>
<body>
<div class="shell">
    <!-- Header -->
    <jsp:include page="_header.jsp"></jsp:include>
    <!-- End Header -->

    <!-- Content-->
    <div class="help">
        <h1>Ответы на вопросы</h1>
        <button class="collapsible">Вопрос 1</button>
        <div class="help_content">
            <p>Товарищи! постоянный количественный рост и сфера нашей активности в значительной степени обуславливает
                создание модели развития. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров
                способствует подготовки и реализации системы обучения кадров, соответствует насущным потребностям.</p>
        </div>
        <button class="collapsible">Вопрос 2</button>
        <div class="help_content">
            <p>С другой стороны укрепление и развитие структуры способствует подготовки и реализации существенных
                финансовых и административных условий. С другой стороны новая модель организационной деятельности в
                значительной степени обуславливает создание соответствующий условий активизации. Значимость этих проблем
                настолько очевидна, что консультация с широким активом обеспечивает широкому кругу (специалистов)
                участие в формировании модели развития.</p>
        </div>
        <button class="collapsible">Вопрос 3</button>
        <div class="help_content">
            <p>Разнообразный и богатый опыт рамки и место обучения кадров влечет за собой процесс внедрения и
                модернизации позиций, занимаемых участниками в отношении поставленных задач. С другой стороны постоянное
                информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и
                модернизации системы обучения кадров, соответствует насущным потребностям. Равным образом сложившаяся
                структура организации играет важную роль в формировании соответствующий условий активизации.</p>
        </div>

        <script>
            var coll = document.getElementsByClassName("collapsible");
            var i;

            for (i = 0; i < coll.length; i++) {
                coll[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var content = this.nextElementSibling;
                    if (content.style.maxHeight) {
                        content.style.maxHeight = null;
                        content.style.paddingTop = "0px";
                        content.style.paddingBottom = "0px";
                    } else {
                        content.style.maxHeight = content.scrollHeight + "px";
                        content.style.paddingTop = "10px";
                        content.style.paddingBottom = "10px";
                    }
                });
            }
        </script>
    </div>
    <%--end Content--%>

    <!-- Footer -->
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- End Footer -->
</div>
</body>
</html>


