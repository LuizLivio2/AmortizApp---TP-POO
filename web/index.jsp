<%-- 
    Document   : index
    Created on : 10 de set de 2020, 22:38:38
    Author     : Luiz Livio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/bootstrap-head.jspf"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>AmortizApp - Cálculo de Amortização</title>
    </head>

    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <div style="font-family: helvetica; text-align:center;">
            <h1>AmortizApp - Cálculo de Amortização</h1>
            <hr/>
            <p>Este aplicativo tem como finalidade realizar cálculos contábeis de amortização.<br>
                Navegue pelos diferentes tipos de amortização através do menu superior.<br>
                <hr/>
                Componentes do grupo: <br>
                Luiz Paulo Livio dos Santos<br>
                Filipe Lemos Machado de Souza
            <p>
        </div>
        <%@include file="WEB-INF/jspf/bootstrap-scripts.jspf" %>
    </body>
</html>
