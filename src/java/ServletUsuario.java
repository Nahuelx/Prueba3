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
import negocio.Usuario;

/**
 *
 * @author Administrador
 */
public class ServletUsuario extends HttpServlet {

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
                String usuario = request.getParameter("usuario");
                String clave = request.getParameter("clave");
                String fecha_nacimiento = request.getParameter("fecha_nacimiento");
                int ciudad_id = Integer.parseInt(request.getParameter("ciudad_id"));
                Usuario user = new Usuario();
                user.setUsuario(usuario);
                user.setClave(clave);
                user.setFecha_nacimiento(fecha_nacimiento);
                user.setCiudad_id(ciudad_id);
                user.crearU();
                response.sendRedirect("usuarios/index.jsp");
            }
            else if(request.getParameter("actualizar")!=null){
                int usuario_id = Integer.parseInt(request.getParameter("usuario_id"));
                String usuario = request.getParameter("usuario");
                String clave = request.getParameter("clave");
                String fecha_nacimiento = request.getParameter("fecha_nacimiento");
                int ciudad_id = Integer.parseInt(request.getParameter("ciudad_id"));
                Usuario user = new Usuario();
                user.setUsuario_id(usuario_id);
                user.setUsuario(usuario);
                user.setClave(clave);
                user.setFecha_nacimiento(fecha_nacimiento);
                user.setCiudad_id(ciudad_id);
                user.actualizarU();
                response.sendRedirect("usuarios/index.jsp");
            }
            else if(request.getParameter("eliminar")!=null){
                int usuario_id = Integer.parseInt(request.getParameter("eliminar"));
                Usuario user = new Usuario();
                user.setUsuario_id(usuario_id);
                user.eliminarU();
                response.sendRedirect("usuarios/index.jsp");
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
