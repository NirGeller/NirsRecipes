/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import ServletHelpers.*;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadFile")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB

public class uploadFile extends HttpServlet {
    private final static Logger LOGGER = Logger.getLogger(uploadFile.class.getCanonicalName());
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter writer = response.getWriter()) {
            // gets absolute path of the web application
            String Dir = request.getParameter("Dir");
            String path = getServletContext().getRealPath("Images/" + Dir);
            String pathBuild = path;
            path= pathModifier.setServerFilePath(path);
            
            // Create path components to save the file
            final Part filePart = request.getPart("file");
            final Part filePartBuild = request.getPart("file");
            final String fileName = pathModifier.getFileName(filePart);
            
            try {
                if(ServletHelpers.fileHandler.insertFile(filePart, filePartBuild, fileName, path, pathBuild))
                    writer.println("file was successfully inserted :)");
                else
                {
                    writer.println("error: couldn' upload file");
                    response.sendRedirect(request.getHeader("referer"));
                
                }
                //add to database the new src and title
                String src = pathModifier.generateSrc(path) + fileName;
                String title = request.getParameter("fileTitle");
                try{
                    //connect to database
                Connection con = connectToDatabase.createConnection();
                if(con == null)
                {
                    writer.println("error: database down");
                    return;
                }
                    
                //insert into database
                PreparedStatement stmt = con.prepareStatement("insert into gallery(src, title) values (?,?)");
                stmt.setString(1, src);
                stmt.setString(2, title);
                stmt.executeUpdate();
                    
                } catch(SQLException e){writer.print("sql error");} 
                try{Thread.sleep(3000);} catch(Exception e){}
                
                writer.println("database updated");
                response.sendRedirect(request.getHeader("referer"));
                
                
            } catch (FileNotFoundException fne) {
                writer.println("You either did not specify a file to upload or are "
                        + "trying to upload a file to a protected or nonexistent "
                        + "location.");
                writer.println("<br/> ERROR: " + fne.getMessage());

                LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}", 
                        new Object[]{fne.getMessage()});
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
