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

    <!-- Bootstrap core CSS -->
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
                        <li><a href="#">Usuarios</a></li>
                        <li><a href="../vehiculos/index.jsp">Vehiculos</a></li>
                        <li><a href="../modelos/index.jsp">Modelos</a></li>
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
                        <h3 class="panel-title">Lista de Usuarios</h3>
                    </div>
                    <div class="panel-body">
                        <form action="index.jsp" method="post" class="form-inline">
                            <div class="form-group">
                                <label for="buscar" class="control-label">Buscar por nombre : </label>
                                <input type="text" name="buscar" id="buscar" class="form-control" />
                            </div>
                                <input type="submit" value="Buscar" class="btn btn-default" />
                        </form>
                        <br>
                        <a href="crear.jsp" class="btn btn-primary">Nuevo Usuario</a>
                        <br><br>
                        <table class="table table-condensed table-hover">
                            <thead>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Clave</th>
                                <th>Fecha de nacimiento</th>
                                <th>Ciudad</th>
                                <th>Acciones</th>
                            </thead>
                            <tbody>
                                <% Conexion con = new Conexion();
                                if(request.getParameter("buscar")!=null){
                                    if(request.getParameter("buscar").isEmpty()){
                                        con.setConsulta("select u.*, c.nombre as ciudad from Usuarios u, Ciudades c where u.ciudad_id = c.ciudad_id and u.estado='Activo'");
                                    }
                                    else{
                                        String nombre = request.getParameter("buscar");
                                        con.setConsulta("select u.*, c.nombre as ciudad from Usuarios u, Ciudades c where u.ciudad_id = c.ciudad_id and u.estado='Activo' and u.usuario like '%" + nombre + "%'");
                                    }
                                }
                                else{
                                con.setConsulta("select u.*, c.nombre as ciudad from Usuarios u, Ciudades c where u.ciudad_id = c.ciudad_id and u.estado='Activo'");
                                }
                                while(con.getResultado().next()){
                                    out.println("<tr>");
                                    out.println("<td>" + con.getResultado().getString("usuario_id") + "</td>");
                                    out.println("<td>" + con.getResultado().getString("usuario") + "</td>");
                                    out.println("<td>" + con.getResultado().getString("clave") + "</td>");
                                    out.println("<td>" + con.getResultado().getString("fecha_nacimiento") + "</td>");
                                    out.println("<td>" + con.getResultado().getString("ciudad") + "</td>");
                                    out.println("<td><a href='../ServletUsuario?eliminar=" + con.getResultado().getString("usuario_id") + "' class='btn btn-danger'>Eliminar</a>&nbsp;&nbsp;<a href='editar.jsp?editar=" + con.getResultado().getString("usuario_id") + "' class='btn btn-success'>Editar Usuario</a></td>");
                                    out.println("</tr>");
                                }
                                %>
                            </tbody>
                            
                        </table>
                        
                        

                    </div>
                </div>
            </div>

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../template/js/bootstrap.min.js"></script>
  </body>
</html>
