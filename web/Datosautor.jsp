<%-- 
    Document   : Datosautor
    Created on : 24-jun-2020, 18:36:35
    Author     : Lord Redlawer
--%>
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Autores</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
        %>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th colspan="3">Autores</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th> Nro </th>
                    <th> Nombre </th>
                    <th> Fecha de Nacimiento </th>
                </tr>
                <%
                    try{
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        consulta = "select idautor, nombre, f_nacimiento "
                                 + "from autor order by nombre";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                        while(rs.next()){  
                %>
                <tr>
                    <td><% out.print(rs.getString(1)); %></td>
                    <td><% out.print(rs.getString(2)); %></td>
                    <td><% out.print(rs.getString(3)); %></td>
                </tr>
                <%
                        }
                        rs.close();
                        pst.close();
                        cn.close();
                    }catch(Exception e){
                        out.print("Error SQL");
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
