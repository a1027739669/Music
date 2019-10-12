package com.example.music.demo.controller;

import com.example.music.demo.entity.SongAndDyna;
import com.example.music.demo.repository.SongAndCountRepository;
import com.example.music.demo.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.controller
 * @ClassName: test
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 9:46
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 9:46
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class test {
    @Autowired
    private SongAndCountRepository songAndCountRepository;
    @GetMapping("/test")
    public String test(){
       return "index";
    }
}
