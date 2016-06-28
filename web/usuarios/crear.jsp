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
                    <a class="navbar-brand" href="#">Prueba 3</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="../success.jsp">Inicio</a></li>
                        <li><a href="index.jsp">Usuarios</a></li>
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
                        <h3 class="panel-title">Crear Usuario</h3>
                    </div>
                    <div class="panel-body">


                        <form method="POST" action="../ServletUsuario">

                            <div class="form-group">
                                <label for="nombre">Nombre del Usuario</label>
                                <input type="text" class="form-control" name="usuario" id="nombre" placeholder="Ingresar nombre del usuario">
                            </div>

                            <div class="form-group">
                                <label for="clave">Clave</label>
                                <input type="password" class="form-control" name="clave" id="clave" placeholder="Ingresar clave">
                            </div>

                            <div class="form-group">
                                <label for="fecha_nacimiento">Fecha de Nacimiento</label>
                                <input type="date" class="form-control" name="fecha_nacimiento" id="fecha_nacimiento" >
                            </div>
                            
                            <div class="form-group">
                                <label for="clave">Pais</label>
                                <select type="select" class="form-control" name="pais" id="paises">
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="clave">Ciudad</label>
                                <select type="select" class="form-control" name="ciudad_id" id="ciudades">
                                </select>
                            </div>
                            
                            <button type="submit" name="crear" class="btn btn-default">Guardar</button>
                        </form>
                        <br>
                        <a href="index.jsp" class="btn btn-danger">volver</a>


                    </div>
                </div>
            </div>
        </div><!-- /.container -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../template/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
        <script>
            $(document).ready(function () {
                $('select').select2();
                $('#paises').append('<option value="none"> Seleccionar Pais</option>');
                $.get("http://localhost:8080/Prueba3/Recibir", function (data, status) {
                    $.each(data, function (i, item) {
                        $("#paises").append("<option value=" + item.pais_id + ">" + item.nombre + "</option>");
                    });
                });
                $("#paises").change(function () {
                    $("#ciudades").empty();
                    $('#ciudades').append('<option> Seleccionar Ciudad</option>');
                    var pais_id = $("#paises").val();
                    $.get("http://localhost:8080/Prueba3/Recibir?pais_id=" + pais_id, function(data, status) {
                        $.each(data, function(i, item) {
                            $("#ciudades").append("<option value=" + item.ciudad_id + ">" + item.nombre + "</option>");
                        });
                    });
                });
            });
        </script>
    </body>
</html>