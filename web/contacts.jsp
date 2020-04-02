<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="_head.jsp"></jsp:include>
    <title>Contacts</title>
</head>
<body>
<div class="shell">
    <!-- Header -->
    <jsp:include page="_header.jsp"></jsp:include>
    <!-- End Header -->

    <!-- Content-->
     <div class="contacts">
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2351.5073115845234!2d27.537247551253913!3d53.88718647999824!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46dbcfe01ef30ecb%3A0x14be8c0e95b6c791!2svul.%20Masko%C5%ADskaja%2015%2C%20Minsk!5e0!3m2!1sen!2sby!4v1585761213150!5m2!1sen!2sby"
                    width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""
                    aria-hidden="false"
                    tabindex="0"></iframe>

        </div>
        <div class="contact-box">
            <h2>Наши контакты</h2>
            <p>г. Минск ул.Московская 15А</p>
            <p><a href="tel:+375 (17) 000-00-00">+375 (17) 000-00-00</a></p>
            <p><a href="mailto:4Wheels@site.com">4Wheels@site.com</a></p>
        </div>

    </div>

    <!-- Footer -->
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- End Footer -->
</div>
</body>
</html>


