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
            if (sesion.getAttribute("usuario") == null) {
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
                        <li><a href="../modelos/index.jsp">Modelos</a></li>
                        <li><a href="../marcas/index.jsp">Marcas</a></li>
                        <li><a href="index.jsp">Ciudades</a></li>
                        <li><a href="../paises/index.jsp">Paises</a></li>
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
                        <h3 class="panel-title">Actualizar Ciudad</h3>
                    </div>
                    <%
                        int id = Integer.parseInt(request.getParameter("editar"));
                        Conexion con = new Conexion();
                        String pais = "";
                        con.setConsulta("select * from ciudades where ciudad_id ='" + id + "'");
                    %>
                    <div class="panel-body">
                        <% while (con.getResultado().next()) {
                                pais = con.getResultado().getString("pais_id");
                        %>

                        <form method="POST" action="../ServletCiudad">
                            <div class="form-group">
                                <label for="ciudad_id">ID</label>
                                <input type="text" readonly="true" id="ciudad_id" name="ciudad_id" class="form-control" value='<% out.println("" + con.getResultado().getString("ciudad_id")); %>'>
                            </div>
                            <div class="form-group">    
                                <label for="tipo"> Nombre </label>
                                <input type="text" class="form-control" name="nombre" value='<% out.println("" + con.getResultado().getString("nombre")); %>' id="nombre" placeholder="Ingresar nombre">
                            </div>

                            <% }%>
                            <div class="form-group">
                                <label for="pais_id"> Pais </label>
                                <select name="pais_id" id="pais_id" class="form-control">
                                    <% con.setConsulta("select * from paises");%>
                                    <%while (con.getResultado().next()) {
                                            if (pais.equals(con.getResultado().getString("pais_id"))) {
                                                out.println("<option value='" + con.getResultado().getString("pais_id") + "' selected>" + con.getResultado().getString("nombre") + "</option>");
                                            } else {
                                                out.println("<option value='" + con.getResultado().getString("pais_id") + "'>" + con.getResultado().getString("nombre") + "</option>");
                                            }
                                        }%>
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