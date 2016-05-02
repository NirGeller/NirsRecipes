/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ServletHelpers.connectToDatabase;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gelle
 */
@WebServlet(urlPatterns = {"/AdminQuery"})
public class AdminQuery extends HttpServlet {

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
            String operation = request.getParameter("operation");
            String tableName = request.getParameter("tableName");
            String columName = request.getParameter("columName");
            String value = request.getParameter("operationValue");
            String condition = request.getParameter("operationCondition");

            if(!columName.equals("age") && !columName.equals("servings"))
                value = "'" + value + "'";
            
            String query = "";
            query += operation + " ";
            String outputQuery = "SELECT * FROM " + tableName;
            switch(operation){
                case "DELETE": query+= " FROM " + tableName; break;
                case "INSERT INTO": query+= tableName + " (" + columName + ")" + " VALUES (" + value + ")"; break;
                case "UPDATE": query+= tableName + " SET " + columName + "=" + value;
            }
            
            //add condition
            if(!condition.isEmpty()){
                query+= " WHERE " + condition;
                outputQuery += " WHERE " + condition;
            }
            
            
            try{
                
                //connect to database
                Connection con = connectToDatabase.createConnection();
                if(con == null)
                {
                    out.println("error: database down");
                    return;
                }
                
                //execute admins query
                Statement stmt = con.createStatement();
                if(!operation.equalsIgnoreCase("SELECT")){
                    stmt.executeUpdate(query);
                }
                
                //get current database
                ResultSet rs = stmt.executeQuery(outputQuery);
                      
                //output the database to user
                switch(tableName){
                    case "members": {
                        String result = "";
                        result+= "first_name|last_name|age|email|pass|regdate;";
                        while(rs.next()){
                            result+= rs.getString("first_name") + "|" + rs.getString("last_name") + "|" + rs.getString("age") + "|" + rs.getString("email") + "|" + rs.getString("pass") + "|" +rs.getString("regdate") + ";";
                        }
                        out.println(result);
                        return;
                    }
                    case "gallery": {
                        String result = "";
                        result+= "src|title;";
                        while(rs.next()){
                            result+= rs.getString("src") + "|" + rs.getString("title")+";";
                        }
                        out.println(result);

                        return;
                    }
                    case "recipes": {
                        String result = "";
                        result+= "title|src|description|ETA|servings|ingredients|steps|username;";
                        while(rs.next()){
                            result+= rs.getString("title") + "|" + rs.getString("src") + "|" + rs.getString("description") + "|" + rs.getString("ETA") + "|" + rs.getString("servings") + "|" +rs.getString("ingredients") + "|" + rs.getString("steps") + "|" +  rs.getString("username") + ";";
                        }
                        out.println(result);
                    }
                    
                
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
