<%-- 
    Document   : Datospais
    Created on : 24-jun-2020, 18:37:26
    Author     : Lord Redlawer
--%>
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paises</title>
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
                    <th colspan="3">Paises</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th> Nro </th>
                    <th> Nombre </th>
                    <th> Estado </th>
                </tr>
                <%
                    try{
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        consulta = "select idpais, nombre, estado "
                                 + "from pais order by nombre";
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
