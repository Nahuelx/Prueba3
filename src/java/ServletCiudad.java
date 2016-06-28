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
import negocio.Ciudad;

public class ServletCiudad extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if(request.getParameter("crear")!=null){
                String nombre = request.getParameter("nombre");
                int pais_id = Integer.parseInt(request.getParameter("pais_id"));
                HttpSession sesion = request.getSession();
                String creado_por = String.valueOf(sesion.getAttribute("usuario"));
                Ciudad ciu = new Ciudad();
                ciu.setNombre(nombre);
                ciu.setPais_id(pais_id);
                ciu.setCreado_por(creado_por);
                ciu.crearC();
                response.sendRedirect("ciudades/index.jsp");
            }
            else if(request.getParameter("actualizar")!=null){
                int ciudad_id = Integer.parseInt(request.getParameter("ciudad_id"));
                String nombre = request.getParameter("nombre");
                int pais_id = Integer.parseInt(request.getParameter("pais_id"));
                Ciudad ciu = new Ciudad();
                ciu.setCiudad_id(ciudad_id);
                ciu.setNombre(nombre);
                ciu.setPais_id(pais_id);
                ciu.actualizarC();
                response.sendRedirect("ciudades/index.jsp");
            }
            else if(request.getParameter("eliminar")!=null){
                int ciudad_id = Integer.parseInt(request.getParameter("eliminar"));
                Ciudad ciu = new Ciudad();
                ciu.setCiudad_id(ciudad_id);
                ciu.eliminarC();
                response.sendRedirect("ciudades/index.jsp");
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
