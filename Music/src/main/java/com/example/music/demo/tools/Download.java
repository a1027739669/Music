package com.example.music.demo.tools;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.tools
 * @ClassName: Download
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/12/3 18:54
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/12/3 18:54
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
public class Download {
    public void downFile(HttpServletResponse response, String filename, String path ){
        if (filename != null) {
            FileInputStream is = null;
            BufferedInputStream bs = null;
            OutputStream os = null;
            try {
                File file = new File(path);
                if (file.exists()) {
                    response.setHeader("Content-Type","application/octet-stream");
                    response.setHeader("Content-Disposition","attachment;filename=" +  new String( filename.getBytes("gb2312"), "ISO8859-1" ));
                    is = new FileInputStream(file);
                    bs =new BufferedInputStream(is);
                    os = response.getOutputStream();
                    byte[] buffer = new byte[1024];
                    int len = 0;
                    while((len = bs.read(buffer)) != -1){
                        os.write(buffer,0,len);
                    }
                }
            }catch(IOException ex){
                ex.printStackTrace();
            }finally {
                try{
                    if(is != null){
                        is.close();
                    }
                    if( bs != null ){
                        bs.close();
                    }
                    if( os != null){
                        os.flush();
                        os.close();
                    }
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
        }
    }
}
