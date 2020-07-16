<%-- 
    Document   : valida
    Created on : 24-jun-2020, 18:36:03
    Author     : Lord Redlawer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ejercicios</title>
        <%!
            String s_usuario="";
            String s_clave="";
        %>
    </head>
    <body>
        <%
            s_usuario = request.getParameter("f_usuario");
            s_clave = request.getParameter("f_clave");
            if(s_usuario.equals("covid69") && s_clave.equals("2020")){
                response.sendRedirect("menu.jsp");
            }else{
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>
