<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="accesodato.Conexion"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%try{
                Conexion con = new Conexion();
                File reportFile = new File(application.getRealPath("/reportes/reports/reporteUsuarios.jasper"));
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), null, con.getConexion());
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream ouputStream = response.getOutputStream();
                ouputStream.write(bytes, 0, bytes.length);
                ouputStream.flush();
                ouputStream.close();
            }
            catch(Exception ex){
            }
            %>
    </body>
</html>