<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="accesodato.Conexion"%>
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
                    <a class="navbar-brand" href="#">Prueba3</a>
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
                        <h3 class="panel-title">Actualizar Usuario</h3> <!--Soy informatico NO FAKE EN UN SOLO LINK PAPUH APROVECHA MEN UuUuUuUuUuUuUuUuUuFFFFFFFFF MEN ESTE MEN-->
                    </div>
                    <%
                        int id = Integer.parseInt(request.getParameter("editar"));
                        Conexion con = new Conexion();
                        con.setConsulta("select * from Usuarios where usuario_id='" + id + "'");
                        String ciudad_id = "";
                    %>
                    <div class="panel-body">
                        <%  while (con.getResultado().next()) {  
                            ciudad_id = con.getResultado().getString("ciudad_id");
                        %>

                        <form method="POST" action="../ServletUsuario">
                            <div class="form-group">
                                <label for="usuario_id">ID</label>
                                <input type="text" class="form-control" id="usuario_id" name="usuario_id" value='<% out.println("" + con.getResultado().getString("usuario_id")); %>' readonly="true">
                            </div>
                            
                            <div class="form-group">
                                <label for="nombre">Nombre </label>
                                <input type="text" class="form-control" name="usuario" value='<% out.println("" + con.getResultado().getString("usuario")); %>' id="nombre" placeholder="Ingresar Nombre">
                            </div>
                            
                            <div class="form-group">
                                <label for="clave">Clave</label>
                                <input type="text" class="form-control" name="clave" value='<% out.println("" + con.getResultado().getString("clave")); %>' id="nombre" placeholder="Ingresar clave">
                            </div>
                            
                            <div class="form-group">
                                <label for="fecha_nacimiento">Fecha de Nacimiento</label>
                                <% out.println("<input type='date' class='form-control' name='fecha_nacimiento' value='" + con.getResultado().getString("fecha_nacimiento") + "' id='fecha_nacimiento'>"); %>
                            </div>
                            
                            <div class="form-group">
                                <label for="paises">Pais</label>
                                <select name="pais_id" id="paises" class="form-control">
                                    <%
                                        con.setConsulta("select * from ciudades where ciudad_id = '" + ciudad_id + "'");
                                        String pais_id = "";
                                        while (con.getResultado().next()) {
                                            pais_id = con.getResultado().getString("pais_id");
                                        }
                                        con.setConsulta("select * from paises");%>
                                    <%while (con.getResultado().next()) {
                                            if (pais_id.equals(con.getResultado().getString("pais_id"))) {
                                                out.println("<option value='" + con.getResultado().getString("pais_id") + "' selected>" + con.getResultado().getString("nombre") + "</option>");
                                            } else {
                                                out.println("<option value='" + con.getResultado().getString("pais_id") + "'>" + con.getResultado().getString("nombre") + "</option>");
                                            }
                                        }%>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="ciudades">Ciudad</label>
                                <select name="ciudad_id" id="ciudades" class="form-control">
                                    <% con.setConsulta("select * from ciudades where pais_id = '" + pais_id + "'");%>
                                    <%while (con.getResultado().next()) {
                                            if (ciudad_id.equals(con.getResultado().getString("ciudad_id"))) {
                                                out.println("<option value='" + con.getResultado().getString("ciudad_id") + "' selected>" + con.getResultado().getString("nombre") + "</option>");
                                            } else {
                                                out.println("<option value='" + con.getResultado().getString("ciudad_id") + "'>" + con.getResultado().getString("nombre") + "</option>");
                                            }
                                        }%>
                                </select>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
        <script>
            $(document).ready(function () {
                $('select').select2();
                
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