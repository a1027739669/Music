package com.example.music.demo.controller;

import com.example.music.demo.repository.CommentRepository;
import com.example.music.demo.repository.SongRepository;
import com.example.music.demo.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

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
    private SongRepository songRepository;
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private SongService songService;
    @GetMapping("/test")
    public String test(ModelMap modelMap){

       return "home2";
    }
}
