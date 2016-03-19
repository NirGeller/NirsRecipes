/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ServletHelpers.connectToDatabase;
import ServletHelpers.pathModifier;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author gelle
 */
@WebServlet("/saveRecipe")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class saveRecipe extends HttpServlet {

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
        try (PrintWriter writer = response.getWriter()) {
            
         
            
            
            
            
            
            
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
        try (PrintWriter writer = response.getWriter()) {
            
            //set variables
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String estimatedTime = request.getParameter("estimatedTime");
            String servings = request.getParameter("servings");
            String ingredients = request.getParameter("ingredients");
            String Dir = request.getParameter("Dir");
            String username = request.getParameter("username");
            
            //set step
            String[] tempSteps = request.getParameter("steps").split("\n");
            String steps = "";
            for(int i = 0; i < tempSteps.length - 1; i++)
                steps+= tempSteps[i].substring(0, tempSteps[i].length() - 1) + ",";
            steps +=tempSteps[tempSteps.length -1];
            // gets absolute path of the web application
            String path = getServletContext().getRealPath("Images") + "\\" + Dir;
            String pathBuild = path;
            path= pathModifier.setServerFilePath(path);
            
            // Create path components to save the file
            final Part filePart = request.getPart("recipeImage");
            final Part filePartBuild = request.getPart("recipeImage");
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
                try{
                
                //connect to database
                Connection con = connectToDatabase.createConnection();
                if(con == null)
                {
                    writer.println("error: database down");
                    return;
                }
                
                //insert into database
                PreparedStatement stmt = con.prepareStatement("insert into recipes(title, src, description, ETA, servings, ingredients, steps, username) values (?,?,?,?,?,?,?,?)");
                stmt.setString(1, title);
                stmt.setString(2, src);
                stmt.setString(3, description);
                stmt.setString(4, estimatedTime);
                stmt.setString(5, servings);
                stmt.setString(6, ingredients);
                stmt.setString(7, steps);
                stmt.setString(8, username);
                stmt.executeUpdate();
                response.sendRedirect(request.getHeader("referer"));
                
                    
                } catch(SQLException e){writer.print("sql error: " + e.getMessage());} 
                try{Thread.sleep(3000);} catch(Exception e){}
                
                writer.println("database updated");
                
                
            } catch (FileNotFoundException fne) {
                writer.println("You either did not specify a file to upload or are "
                        + "trying to upload a file to a protected or nonexistent "
                        + "location.");
                writer.println("<br/> ERROR: " + fne.getMessage());

               
            } 
            
            
            
        }
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
