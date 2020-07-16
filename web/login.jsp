<%-- 
    Document   : login
    Created on : 24-jun-2020, 18:35:52
    Author     : Lord Redlawer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Libros</title>
    </head>
    <body>
        <h1 align="center">COVID69</h1>
        <form name="f_datos" action="valida.jsp" method="POST">
            <table border="0" align="center" cellspacing="0">
                <thead>
                    <tr>
                        <th colspan="2">Ingrese usuario y clave</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Usuario: </td>
                        <td><input type="text" name="f_usuario" value="" /></td>
                    </tr>
                    <tr>
                        <td>Clave: </td>
                        <td><input type="password" name="f_clave" value="" /></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2"><input type="submit" value="Ingresar" name="f_ingresar" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
