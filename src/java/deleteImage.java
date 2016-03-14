/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ServletHelpers.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gelle
 */
public class deleteImage extends HttpServlet {

    
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
            String src = request.getParameter("src");
            try{
                //connect to database
                Connection con = connectToDatabase.createConnection();
                if(con == null)
                {
                    out.println("error: database down");
                    return;
                }

                
                //delete image
                PreparedStatement stmt = con.prepareStatement("delete from gallery where src= ?");
                stmt.setString(1, src);
                try{
                    
                    //Set path to an absolute path; note that the parameter to getRealPath() here should be a context-relative path. get the path to the build directory
                    String path =getServletContext().getRealPath("/" + src);
                    File buildFile = new File(path);
                    
                    File serverFile = new File(pathModifier.setServerFilePath(path));
                    if(!buildFile.delete())
                    {
                        out.println("error: couldnt delete Build image" + buildFile.getAbsolutePath());
                        
                    }
                    if(!serverFile.delete())
                        out.println("error: couldnt delete Server image" + serverFile);
                    else
                    {
                        stmt.executeUpdate();
                        out.println("the image was deleted successfully :)");
                    }
                } catch(Exception e){out.println("error: couldn't delete image this is " + e.getMessage());}
                
                
            } catch(SQLException e){out.println("error: " + e.getLocalizedMessage());} 
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
