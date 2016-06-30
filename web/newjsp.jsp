<%@ page  import="java.io.*"%> 
<%@ page  import="java.sql.Connection"%> 
<%@ page  import="java.sql.DriverManager"%>
<%@ page  import="java.util.HashMap"%>
<%@ page  import="java.util.Map"%>
<%@ page  import="net.sf.jasperreports.engine.*"%>
 
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Hello World!</h2>
        <%
            Connection conexion;

            Class.forName("com.mysql.jdbc.Driver").newInstance();

            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/Prueba3", "root", "");

            /*Establecemos la ruta del reporte*/

            File reportFile = new File(application.getRealPath("reportes//reporteModelos.jasper"));

            /* No enviamos parámetros porque nuestro reporte no los necesita asi que escriba cualquier cadena de texto ya que solo seguiremos el formato del método runReportToPdf*/

            Map parameters = new HashMap();;

            /*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/

            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, conexion);

            /*Indicamos que la respuesta va a ser en formato PDF*/

            response.setContentType("application/pdf");

            response.setContentLength(bytes.length);

            ServletOutputStream ouputStream = response.getOutputStream();

            ouputStream.write(bytes, 0, bytes.length); /*Limpiamos y cerramos flujos de salida*/

            ouputStream.flush();

            ouputStream.close();
        %>
    </body>
</html>