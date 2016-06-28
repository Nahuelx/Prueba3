/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import accesodato.Conexion;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.Ciudad;
import negocio.Pais;

/**
 *
 * @author Kuper
 */
public class Recibir extends HttpServlet {

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
            
            Conexion con = new Conexion();
            if(request.getParameter("pais_id") != null){
                String pais_id = request.getParameter("pais_id");
                con.setConsulta("select * from ciudades where pais_id = '" + pais_id + "' and estado='Activo'");
                ArrayList lista = new ArrayList();
                try {
                    while(con.getResultado().next()) {
                        Ciudad ciu = new Ciudad();
                        ciu.setCiudad_id(con.getResultado().getInt("ciudad_id"));
                        ciu.setNombre(con.getResultado().getString("nombre"));
                        ciu.setPais_id(con.getResultado().getInt("pais_id"));
                        ciu.setEstado(con.getResultado().getString("estado"));
                        lista.add(ciu);
                    }
                } catch (Exception ex){
                    
                }
                //variable json con arraylist
            String json = new Gson().toJson(lista);
            //setear aplicacion json
            response.setContentType("application/json");
            //encodear a utf8
            response.setCharacterEncoding("UTF-8");
            //mostrar o imprimir el json
            response.getWriter().write(json);
            }
            else {
                con.setConsulta("select * from Paises where estado='Activo'");
            ArrayList lista = new ArrayList();
            //Crear objetos y guardarlos en lista
            try {
                while(con.getResultado().next()){
                    Pais pais = new Pais();
                    pais.setPais_id(con.getResultado().getInt("pais_id"));
                    pais.setNombre(con.getResultado().getString("nombre"));
                    pais.setEstado(con.getResultado().getString("estado"));
                    lista.add(pais);
                }
            } catch (Exception ex) {
            }
            //variable json con arraylist
            String json = new Gson().toJson(lista);
            //setear aplicacion json
            response.setContentType("application/json");
            //encodear a utf8
            response.setCharacterEncoding("UTF-8");
            //mostrar o imprimir el json
            response.getWriter().write(json);
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
