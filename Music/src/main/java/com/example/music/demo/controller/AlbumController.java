package com.example.music.demo.controller;

import com.example.music.demo.entity.Album;
import com.example.music.demo.service.AlbumService;
import com.example.music.demo.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;


/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.controller
 * @ClassName: AlbumController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/26 14:22
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/26 14:22
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class AlbumController {
    @Autowired
    private AlbumService albumService;
    @Autowired
    private IndexService indexService;

    @GetMapping("/guest/albumtable")
    public String getAlbumList(ModelMap modelMap, String category, Integer pageId) {
        Page<Album> albumPage = albumService.getAlbumList(pageId, category);
        modelMap.addAttribute("currentCate", category);
        modelMap.addAttribute("albumPage", albumPage);
        return "albumtable";
    }

    @GetMapping("/guest/albumlist")
    public String detail(ModelMap modelMap) {
        return "albumlist";
    }

}
