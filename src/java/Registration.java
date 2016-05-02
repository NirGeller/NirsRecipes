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
import java.sql.*;
import javax.servlet.http.*;
import ServletHelpers.*;
/**
 *
 * @author gelle
 */
public class Registration extends HttpServlet {

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
            String email = request.getParameter("email");    
            String pwd = password.crypt(request.getParameter("pwd"));
            String name = request.getParameter("name");
            String lastName = request.getParameter("lastName");
            int age = Integer.parseInt(request.getParameter("age"));
            String rememberMe = request.getParameter("rememberMe");
            boolean setLifeSpan = true;
            if(rememberMe == null)
                setLifeSpan = false;
            
            try{
                //connect to database
                Connection con = connectToDatabase.createConnection();
                if(con == null)
                {
                    out.println("error: database down");
                    return;
                }
                
                //checking for multipels
                PreparedStatement stmt = con.prepareStatement("select * from members where email= ?");
                stmt.setString(1, email);
                ResultSet rs = stmt.executeQuery();
                if(rs.next())
                {
                    out.println("error: " + email + " already in use");
                    out.println("'"+email+"'");
                    return;
                }
                
                //insert into database
                stmt = con.prepareStatement("insert into members(first_name, last_name, age, email, pass, regdate) values (?,?,?,?,?" + ", CURDATE())");
                stmt.setString(1, name);
                stmt.setString(2, lastName);
                stmt.setInt(3, age);
                stmt.setString(4, email);
                stmt.setString(5, pwd);
                int i = stmt.executeUpdate();
                
                //save to cookie
                if (i > 0) {
                    Cookie ck = new Cookie("mail", email);
                    if(setLifeSpan)
                        ck.setMaxAge(30*60*30);
                    else
                        ck.setMaxAge(-1);
                    response.addCookie(ck);
                    out.print(email);
                }else
                {
                    out.print("error: couldnt sign up, sql error");
                }
            } catch(SQLException e){out.print("sql error");} 
           
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
