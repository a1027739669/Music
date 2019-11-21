package com.example.music.demo.controller;

import com.example.music.demo.repository.*;
import com.example.music.demo.service.IndexService;
import com.example.music.demo.service.RedisService;
import com.example.music.demo.service.SongService;
import com.example.music.demo.service.SongSheetService;
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
    private SongSheetRepository songSheetRepository;
    @Autowired
    private SheetDetailRepository sheetDetailRepository;
    @Autowired
    private SongRepository songRepository;
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private SongService songService;
    @Autowired
    private IndexService indexService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private SongSheetService songSheetService;
    @Autowired
    private AlbumRepository albumRepository;
    @GetMapping("/test")
    public String test(ModelMap modelMap){

       return "login";
    }

}
