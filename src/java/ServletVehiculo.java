/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import negocio.Vehiculo;

/**
 *
 * @author Kuper
 */
public class ServletVehiculo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
               
            if(request.getParameter("crear")!=null){
                String tipo = request.getParameter("tipo");
                String patente = request.getParameter("patente");
                String fecha_creacion = request.getParameter("fecha_creacion");
                int modelo_id = Integer.parseInt(request.getParameter("modelo_id"));
                HttpSession sesion = request.getSession();
                String creado_por = String.valueOf(sesion.getAttribute("usuario"));
                Vehiculo vehiculo = new Vehiculo();
                vehiculo.setTipo(tipo);
                vehiculo.setPatente(patente);
                vehiculo.setFecha_creacion(fecha_creacion);
                vehiculo.setModelo_id(modelo_id);
                vehiculo.setCreado_por(creado_por);
                vehiculo.crearV();
                response.sendRedirect("vehiculos/index.jsp");
            }
            else if(request.getParameter("actualizar")!=null){
                int vehiculo_id = Integer.parseInt(request.getParameter("vehiculo_id"));
                String tipo = request.getParameter("tipo");
                String patente = request.getParameter("patente");
                String fecha_creacion = request.getParameter("fecha_creacion");
                int modelo_id = Integer.parseInt(request.getParameter("modelo_id"));
                HttpSession sesion = request.getSession();
                String creado_por = String.valueOf(sesion.getAttribute("usuario"));
                Vehiculo vehiculo = new Vehiculo();
                vehiculo.setVehiculo_id(vehiculo_id);
                vehiculo.setTipo(tipo);
                vehiculo.setPatente(patente);
                vehiculo.setFecha_creacion(fecha_creacion);
                vehiculo.setModelo_id(modelo_id);
                vehiculo.setCreado_por(creado_por);
                vehiculo.actualizarV();
                response.sendRedirect("vehiculos/index.jsp");
            }
            else if(request.getParameter("eliminar")!=null){
                int vehiculo_id = Integer.parseInt(request.getParameter("eliminar"));
                Vehiculo vehiculo = new Vehiculo();
                vehiculo.setVehiculo_id(vehiculo_id);
                vehiculo.eliminarV();
                response.sendRedirect("vehiculos/index.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
