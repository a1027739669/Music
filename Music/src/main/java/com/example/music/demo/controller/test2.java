package com.example.music.demo.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;


import java.util.Calendar;
import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.controller
 * @ClassName: test2
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/14 16:32
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/14 16:32
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
public class test2 {
    public static void main(String[] args) throws IOException {
        List<String> test=Files.readAllLines(Paths.get("D:\\MUSICRESOURCE\\lyic\\桃花诺-G1575773184574.E"));
        String ans="";
        for (int i = 0; i <test.size() ; i++) {
           ans+=test.get(i)+"\n";
        }
        System.out.println(ans);
    }
}
