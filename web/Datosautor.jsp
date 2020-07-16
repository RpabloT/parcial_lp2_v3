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
            String s_accion;
            String s_idautor;
        %>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th colspan="4">Autores</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th> Nro </th>
                    <th> Nombre </th>
                    <th> Fecha de Nacimiento </th>
                    <th> Eliminar </th>
                </tr>
                <%
                    try{
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        
                        s_accion = request.getParameter("f_accion");
                        s_idautor = request.getParameter("f_idautor");
                        
                        if (s_accion!=null) {
                                consulta =  " delete from autor "
                                    + " where "
                                    + " idautor = " + s_idautor + "; ";
                                //out.print(consulta);
                                pst = cn.prepareStatement(consulta);
                                pst.executeUpdate();          
                        }
                        consulta = "select idautor, nombre, f_nacimiento "
                                 + " from autor";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                        int num = 0;
                        String ide;
                        while(rs.next()){
                            ide = rs.getString(1);
                            num++;
                %>
                <tr>
                    <td><% out.print(num); %></td>
                    <td><% out.print(rs.getString(2)); %></td>
                    <td><% out.print(rs.getString(3)); %></td>
                    <td><a href="Datosautor.jsp?f_accion=E&f_idautor=<%out.print(ide);%>">Eliminar</a></td>
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