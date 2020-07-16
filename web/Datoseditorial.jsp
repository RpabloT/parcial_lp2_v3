<%-- 
    Document   : Datoseditorial
    Created on : 24-jun-2020, 18:36:52
    Author     : Lord Redlawer
--%>
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editoriales</title>
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
                    <th colspan="3">Editoriales</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td> Nro </td>
                    <td> Nombre </td>
                    <td> Estado </td>
                </tr>
                <tr>
                    <%
                    try{
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        consulta = "select ideditorial, nombre, estado "
                                 + "from editorial order by nombre";
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
                </tr>
            </tbody>
        </table>

    </body>
</html>
