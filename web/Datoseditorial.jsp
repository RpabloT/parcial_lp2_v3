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
            String s_nombre;
            String s_estado;
            
        %>
    </head>
    <body>
        <form name="AgregarEditorialForm" action="Datoseditorial.jsp">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Editorial</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" /></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar" />
                            <input type="hidden" name="f_accion" value="C" />
                        </td>
                    </tr>
                    
                </tbody>
            </table>

        </form>
        
        
        
        <table border="1" cellspacing="0" cellpadding="" align = "center">
            <thead>
                <tr>
                    <th colspan="4">Datos Editorial</th>
                </tr>
                <tr>
                    <td> Nro </td>
                    <td> Nombre </td>
                    <td> Estado </td>
                    <td> Eliminar </td>
                </tr>
            </thead>
            
            <%
                try{
                    ConectaBd bd = new ConectaBd();
                    cn = bd.getConnection();
                    
                    s_accion = request.getParameter("f_accion");
                    s_ideditorial = request.getParameter("f_ideditorial");
                    
                    if (s_accion!=null) {
                        if (s_accion.equals("E")) {
                            consulta =  " delete from editorial "
                                        + " where "
                                        + " ideditorial = " + s_ideditorial + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                            
                            
                        }else if(s_accion.equals("C")){
                            s_nombre=request.getParameter("f_nombre");
                            s_estado=request.getParameter("f_estado");
                            
                            consulta =  "   insert into "
                                    + " editorial(nombre, estado) "
                                    + " values ('"+ s_nombre +"','"+ s_estado +"')";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                        }
                    }
                    
                    
                    consulta = "select ideditorial, nombre, estado " 
                            + "from editorial";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    
                    int num = 0;
                    String ide;
                    while (rs.next()) {
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
            }catch(Exception e){
                out.print("ERROR SQL");;
            }
                %>
            <tr>
                    <th colspan="4"><a href="menu.jsp">atras</a></th>
            </tr>
        </table>

    </body>
</html>