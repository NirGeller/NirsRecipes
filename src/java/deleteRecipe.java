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
import ServletHelpers.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
/**
 *
 * @author Nir
 */
public class deleteRecipe extends HttpServlet {

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
            String src = request.getParameter("src");
            
            
            //delete image
            fileHandler.deleteFile(src);
            
            //update database
            try{
                //connect to database
                Connection con = connectToDatabase.createConnection();
                if(con == null)
                {
                    out.println("error: database down");
                    return;
                }

                
                PreparedStatement stmt = con.prepareStatement("delete from recipes where src= ?");
                stmt.setString(1, src);
                boolean deleted = ServletHelpers.fileHandler.deleteFile(getServletContext().getRealPath("/" + src));
                if(!deleted)
                    out.println("error: couldnt delete Server image" + src);
                else
                {
                    stmt.executeUpdate();
                    out.println("the recipe was deleted successfully :)");
                }
            } catch(Exception e){out.println("error: sql error");}
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
