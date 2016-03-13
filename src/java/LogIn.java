/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nir
 */
@WebServlet(urlPatterns = {"/LogIn"})
public class LogIn extends HttpServlet {

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
            //get paramaters
            String email = request.getParameter("email");    
            String pwd = request.getParameter("pwd");
            String rememberMe = request.getParameter("rememberMe");
            boolean setLifeSpan = true;
            if(rememberMe == null)
                setLifeSpan = false;
            
            try{
                //connect to database
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cookingsite",
                        "Cook", "cookingiseasy");

                
                
                //try to login
                PreparedStatement stmt = con.prepareStatement("select * from members where email= ? AND pass= ?");
                stmt.setString(1, email);
                stmt.setString(2, pwd);
                ResultSet rs = stmt.executeQuery();
                if(rs.next())
                {
                    Cookie ck = new Cookie("mail", email);
                    if(setLifeSpan)
                        ck.setMaxAge(30*60*30);
                    else
                        ck.setMaxAge(-1);
                    response.addCookie(ck);
                    out.print(email);
                }
                else
                    out.print("error: wrong email password combination");   
                
                
            } catch(SQLException e){out.print("error: " + e.getLocalizedMessage());} catch(ClassNotFoundException e){out.println("error: " + e.toString());}
           
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
