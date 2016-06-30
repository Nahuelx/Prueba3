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
        <link href="template/css/bootstrap.min.css" rel="stylesheet">
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("usuario") == null) {
                response.sendRedirect("index.jsp");
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
                        <li><a href="#">Inicio</a></li>
                        <li><a href="usuarios/index.jsp">Usuarios</a></li>
                        <li><a href="vehiculos/index.jsp">Vehiculos</a></li>
                        <li><a href="modelos/index.jsp">Modelos</a></li>
                        <li><a href="marcas/index.jsp">Marcas</a></li>
                        <li><a href="ciudades/index.jsp">Ciudades</a></li>
                        <li><a href="paises/index.jsp">Paises</a></li>
                        <li><a href="reportes/index.jsp">Reportes</a></li>
                        <li><a href="ServletLogin?out=si">Log-out</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container">
            <br><br><br>
            <div class="page-header">
                        <h1>Prueba Java Web para Programación 2</h1>
                    </div>
            
            <div class="row">
                <div class="panel panel-primary" id="test">
                    
                    <div class="panel-heading">
                        <h3 class="panel-title">Menú</h3>
                    </div>
                    <div class="panel-body">
                        <div class="list-group">
                            <a href="usuarios/index.jsp" class="list-group-item">Usuarios</a>
                            <a href="vehiculos/index.jsp" class="list-group-item">Vehiculos</a>
                            <a href="marcas/index.jsp" class="list-group-item">Marcas</a>
                            <a href="modelos/index.jsp" class="list-group-item">Modelos</a>
                            <a href="ciudades/index.jsp" class="list-group-item">Ciudades</a>
                            <a href="paises/index.jsp" class="list-group-item">Paises</a>
                            <a href="reportes/index.jsp" class="list-group-item">Reportes</a>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- /.container -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="template/js/bootstrap.min.js"></script>

    </body>
</html>
