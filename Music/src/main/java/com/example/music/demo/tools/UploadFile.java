package com.example.music.demo.tools;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.config
 * @ClassName: UploadFile
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/12/2 20:49
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/12/2 20:49
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
public class UploadFile {
    public String uploadFile(MultipartFile file) throws IOException {
        String fileName = file.getOriginalFilename();
        String[] s = fileName.split("\\.");
        fileName =System.currentTimeMillis() + '.' + s[1];
        File path = new File("C:/MUSICRESOURCE/image/" + fileName);
        file.transferTo(path);
        return fileName;
    }
    public String uploadFileToMp3(MultipartFile file) throws IOException {
        String fileName = file.getOriginalFilename();
        String[] s = fileName.split("\\.");
        fileName = System.currentTimeMillis() + '.' + s[1];
        File path = new File("C:/MUSICRESOURCE/yinpin/" + fileName);
        file.transferTo(path);
        return fileName;
    }
    public String uploadFileToLyric(MultipartFile file) throws IOException {
        String fileName = file.getOriginalFilename();
        String[] s = fileName.split("\\.");
        fileName = System.currentTimeMillis() + '.' + s[1];
        File path = new File("C:/MUSICRESOURCE/lyic/" + fileName);
        file.transferTo(path);
        return fileName;
    }
}
