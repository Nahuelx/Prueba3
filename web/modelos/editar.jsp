<%-- 
    Document   : editar
    Created on : jun 9, 2016, 3:52:42 a.m.
    Author     : Kuper
--%>

<%@page import="accesodato.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../favicon.ico">
        <title>Prueba 4 JavaEE</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
        <link href="../template/css/bootstrap.min.css" rel="stylesheet">
        <%
            HttpSession sesion = request.getSession();
            if(sesion.getAttribute("usuario")==null){
                response.sendRedirect("../index.jsp");
            }
        %>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Prueba3</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="../success.jsp">Inicio</a></li>
                        <li><a href="../usuarios/index.jsp">Usuarios</a></li>
                        <li><a href="../vehiculos/index.jsp">Vehiculos</a></li>
                        <li><a href="index.jsp">Modelos</a></li>
                        <li><a href="../marcas/index.jsp">Marcas</a></li>
                        <li><a href="../ciudades/index.jsp">Ciudades</a></li>
                        <li><a href="../paises/index.jsp">Paises</a></li>
                        <li><a href="../reportes/index.jsp">Reportes</a></li>
                        <li><a href="../ServletLogin?out=si">Log-out</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container">
            <br><br><br>
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Actualizar Modelo</h3>
                    </div>
                    <%
                        int id = Integer.parseInt(request.getParameter("editar"));
                        Conexion con = new Conexion();
                        String marca = "";
                        con.setConsulta("select * from Modelos where modelo_id ='" + id + "'");
                    %>
                    <div class="panel-body">
                        <% while (con.getResultado().next()) {
                            marca = con.getResultado().getString("marca_id");
                        %>

                        <form method="POST" action="../ServletModelo">
                            <div class="form-group">
                                <label for="modelo_id">ID</label>
                                <input type="text" class="form-control" id="usuario_id" name="modelo_id" value='<% out.println("" + con.getResultado().getString("modelo_id")); %>' readonly="true">
                            </div>
                            <div class="form-group">
                                <label for="nombre"> Nombre </label>
                                <input type="text" class="form-control" name="nombre" value='<% out.println("" + con.getResultado().getString("nombre")); %>' id="nombre" placeholder="Ingresar Nombre">
                            </div>
                            <% } %>
                            <div class="form-group">
                                <label for="marca_id">Marca</label>
                                <%
                                    con.setConsulta("select * from marcas");
                                %>
                                <select name="marca_id" class="form-control" id="modelo_id">
                                    <%while(con.getResultado().next()){
                                        if(marca.equals(con.getResultado().getString("marca_id"))){
                                           out.println("<option value='" + con.getResultado().getString("marca_id") + "' selected>" + con.getResultado().getString("nombre") + "</option>"); 
                                        }
                                        else{
                                        out.println("<option value='" + con.getResultado().getString("marca_id") + "'>" + con.getResultado().getString("nombre") + "</option>");
                                        }
                                    } %>
                                </select>
                            </div>
                            <button type="submit" name="actualizar" class="btn btn-default">Actualizar</button>
                        </form>

                    </div>
                </div>
            </div>
        </div><!-- /.container -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../template/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
        <script>
            $("select").select2();
        </script>
        
    </body>
</html>