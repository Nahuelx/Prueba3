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
        <title>Starter Template for Bootstrap</title>
        <link href="../template/css/bootstrap.min.css" rel="stylesheet">
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
                        <li><a href="../index.jsp">Inicio</a></li>
                        <li><a href="../usuarios/index.jsp">Usuarios</a></li>
                        <li><a href="index.jsp">Vehiculos</a></li>
                        <li><a href="../modelos/index.jsp">Modelos</a></li>
                        <li><a href="../marcas/index.jsp">Marcas</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container">
            <br><br><br>
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Actualizar Vehiculo</h3>
                    </div>
                    <%
                        int id = Integer.parseInt(request.getParameter("editar"));
                        Conexion con = new Conexion();
                        con.setConsulta("select * from vehiculos where vehiculo_id ='" + id + "'");
                    %>
                    <div class="panel-body">
                        <% while (con.getResultado().next()) {  %>

                        <form method="POST" action="../ServletVehiculo?editar=si">

                            <input type="text" readonly="true" value='<% out.println("" + con.getResultado().getString("vehiculo_id")); %>' name="id">

                            <div class="form-group">    
                                <label for="tipo"> Tipo </label>
                                <input type="text" class="form-control" name="tipo" value='<% out.println("" + con.getResultado().getString("tipo")); %>' id="tipo" placeholder="Ingresar Tipo">
                            </div>

                            <div class="form-group">
                                <label for="patente"> Patente </label>
                                <input type="text" class="form-control" name="patente" value='<% out.println("" + con.getResultado().getString("patente")); %>' id="patente" placeholder="Ingresar patente">
                            </div>
                            
                            <div class="form-group">
                                <label for="fecha_creacion">Fecha de Creacion</label>
                                <input type="date" class="form-control" name="fecha_creacion" value='<% out.println("" + con.getResultado().getString("fecha_creacion")); %>' id="fecha_creacion">
                            </div>

                            <div class="form-group">
                                <label for="modelo_id">ID del Modelo</label>
                                <input type="text" class="form-control" name="modelo_id" value='<% out.println("" + con.getResultado().getString("modelo_id")); %>' id="modelo_id" placeholder="Ingresar ID del Modelo">
                            </div>

                            <div class="form-group">
                                <label for="creado_por">Creado por</label>
                                <input type="text" class="form-control" name="creado_por" value='<% out.println("" + con.getResultado().getString("creado_por")); %>' id="creado_por" placeholder="Ingresar el Nombre del creador">
                            </div>


                            <button type="submit" name="actualizar" class="btn btn-default">Actualizar</button>
                        </form>
                        <% }%> 

                    </div>
                </div>
            </div>
        </div><!-- /.container -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../template/js/bootstrap.min.js"></script>

    </body>
</html>