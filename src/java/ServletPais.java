import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import negocio.Pais;

public class ServletPais extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if(request.getParameter("crear")!=null){
                String nombre = request.getParameter("nombre");
                HttpSession sesion = request.getSession();
                String creado_por = String.valueOf(sesion.getAttribute("usuario"));
                Pais pais = new Pais();
                pais.setNombre(nombre);
                pais.setCreado_por(creado_por);
                pais.crearP();
                response.sendRedirect("paises/index.jsp");
            }
            else if(request.getParameter("actualizar")!=null){
                int pais_id = Integer.parseInt(request.getParameter("pais_id"));
                String nombre = request.getParameter("nombre");
                Pais pais = new Pais();
                pais.setPais_id(pais_id);
                pais.setNombre(nombre);
                pais.actualizarP();
                response.sendRedirect("paises/index.jsp");
            }
            else if(request.getParameter("eliminar")!=null){
                int pais_id = Integer.parseInt(request.getParameter("eliminar"));
                Pais pais = new Pais();
                pais.setPais_id(pais_id);
                pais.eliminarP();
                response.sendRedirect("paises/index.jsp");
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
