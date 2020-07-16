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
            String s_accion;
            String s_ideditorial;
        %>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th colspan="4">Editoriales</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td> Nro </td>
                    <td> Nombre </td>
                    <td> Estado </td>
                    <td> Eliminar </td>
                </tr>
                <tr>
                    <%
                    try{
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        
                        s_accion = request.getParameter("f_accion");
                        s_ideditorial = request.getParameter("f_ideditorial");
                        
                        if (s_accion!=null) {
                                consulta =  " delete from editorial "
                                    + " where "
                                    + " ideditorial = " + s_ideditorial + "; ";
                                //out.print(consulta);
                                pst = cn.prepareStatement(consulta);
                                pst.executeUpdate();          
                        }
                        consulta = "select ideditorial, nombre, estado "
                                 + " from editorial";
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
                    <td><a href="Datoseditorial.jsp?f_accion=E&f_ideditorial=<%out.print(ide);%>">Eliminar</a></td>
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