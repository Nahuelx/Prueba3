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
        <style>
            #test{
                width: 570px;
                margin: 0 auto;
            }
        </style>
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
            </div>
        </nav>
        <div class="container">
            <br><br><br><br><br><br><br><br>
            <div class="row">
                <div class="panel panel-primary" id="test">
                    <div class="panel-heading">
                        <h3 class="panel-title">Log-in</h3>
                    </div>
                    <div class="panel-body">
                        <form method="POST" action="ServletLogin" class="form-horizontal">
                            <div class="form-group">
                                <label for="user" class="col-sm-2 control-label">Usuario</label>
                                <div class="col-sm-10">
                                <input type="text" name="user" id="user" placeholder="Nombre de usuario..." class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pass" class="col-sm-2 control-label">Contraseņa</label>
                                <div class="col-sm-10">
                                    <input type="password" name="pass" id="pass" placeholder="Contraseņa..." class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" name="login" class="btn btn-default" value="login">Ingresar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div><!-- /.container -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="template/js/bootstrap.min.js"></script>

    </body>
</html>
