/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletHelpers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import javax.servlet.http.Part;

/**
 *
 * @author gelle
 */
public class fileHandler {
    public static boolean deleteFile(String path)
    {
        try{
            //Set path to an absolute path; note that the parameter to getRealPath() here should be a context-relative path. get the path to the build directory
            File buildFile = new File(path);
            File serverFile = new File(pathModifier.setServerFilePath(path));
            if(!buildFile.delete())
            {
                //nothing much we can do here, the build will refresh any way, the deletion is just a precaution
            }
            if(!serverFile.delete())
                return false;
            return true;
        } catch(Exception e){return false;}

    }
    
    public static boolean insertFile(Part filePart, Part filePartBuild, String fileName, String path, String pathBuild)
    {
        OutputStream out = null;
        OutputStream outBuild = null;
        InputStream filecontent = null;
        InputStream filecontentBuild = null;
        try {
            out = new FileOutputStream(new File(path + File.separator
                    + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024*1024*10];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }

            outBuild = new FileOutputStream(new File(pathBuild + File.separator
                    + fileName));
            filecontentBuild = filePartBuild.getInputStream();

            int readBuild = 0;
            final byte[] bytesBuild = new byte[1024*1024*10];

            while ((readBuild = filecontentBuild.read(bytesBuild)) != -1) {
                out.write(bytesBuild, 0, readBuild);
            }
            
            try{Thread.sleep(3000);} catch(Exception e){return false;}
            
            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
            return true;
        }catch(Exception e){return false;}
        
    }
}
