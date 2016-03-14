/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletHelpers;

import java.util.logging.Level;
import javax.servlet.http.Part;

/**
 *
 * @author Nir
 */
public class pathModifier {
    public static String generateSrc(String path)
    {
        String temp = path.split("web\\\\")[1];
        String[] dirs = temp.split("\\\\");
        temp = "";
        for(String dir : dirs)
        {
            temp += dir + "/";
        }
        return temp;
    }
    
    public static String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
    return null;
    }
    
    public static String setServerFilePath(String path)
    {
        //set path to server side path
        String[] temp = path.split("build\\\\");
        path = temp[0] + temp[1];
        return path;
    }
}
