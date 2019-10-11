package com.example.music.demo.controller;

import com.example.music.demo.entity.Label;
import com.example.music.demo.entity.Song;
import com.example.music.demo.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.controller
 * @ClassName: IndexController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 9:55
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 9:55
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class IndexController {
    @Autowired
    private IndexService indexService;


    @GetMapping("/index")
    public String index(ModelMap modelMap) {
        List<Song> songList = indexService.getSongWithHot();
        modelMap.addAttribute("hot_song", songList);
        List<Label> labelList = indexService.getAllLabel();
        modelMap.addAttribute("labelList", labelList);
        return "index";
    }
}
