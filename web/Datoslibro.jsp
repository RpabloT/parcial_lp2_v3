<%-- 
    Document   : Datoslibro
    Created on : 24-jun-2020, 18:37:42
    Author     : Lord Redlawer
--%>
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Libros</title>
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
                    <th colspan="9">Libros</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td> Nro </td>
                    <td> Autor </td>
                    <td> Titulo </td>
                    <td> Cantidad </td>
                    <td> Año </td>
                    <td> Editorial </td>
                    <td> Pais </td>
                    <td> Precio </td>
                    <td> Estado </td>
                </tr>
                <tr>
                    <%
                    try{
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        consulta = "Select idlibro,a.nombre,l.titulo,l.cantidad,l.año,e.nombre,p.nombre,l.precio,l.estado from libro l, autor a, editorial e, pais p where a.idautor=l.idautor and e.ideditorial=l.ideditorial and p.idpais=l.idpais";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                        while(rs.next()){  
                    %>
                    <td><% out.print(rs.getString(1)); %></td>
                    <td><% out.print(rs.getString(2)); %></td>
                    <td><% out.print(rs.getString(3)); %></td>
                    <td><% out.print(rs.getString(4)); %></td>
                    <td><% out.print(rs.getString(5)); %></td>
                    <td><% out.print(rs.getString(6)); %></td>
                    <td><% out.print(rs.getString(7)); %></td>
                    <td><% out.print(rs.getString(8)); %></td>
                    <td><% out.print(rs.getString(9)); %></td>
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
