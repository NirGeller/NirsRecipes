/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletHelpers;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Nir
 */
public class connectToDatabase {
    public static Connection createConnection()
    {
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cookingsite",
                "Cook", "cookingiseasy");
        return con;
        }catch(Exception e){}
        return null;
    }
        
        
}
