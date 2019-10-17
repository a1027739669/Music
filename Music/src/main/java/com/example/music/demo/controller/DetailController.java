package com.example.music.demo.controller;

import com.example.music.demo.entity.Comment;
import com.example.music.demo.entity.Song;
import com.example.music.demo.repository.SongRepository;
import com.example.music.demo.service.DetailService;
import com.example.music.demo.service.IndexService;
import com.example.music.demo.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.controller
 * @ClassName: DetailController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/16 11:23
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/16 11:23
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class DetailController {
    @Autowired
    private DetailService detailService;
    @Autowired
    private SongService songService;

    @GetMapping("/songDetail")
    public String getDetail(ModelMap modelMap,Integer songId,Integer pageId) {
        Song song = songService.getOneDetail(songId);
        modelMap.addAttribute("song", song);
        Page<Comment> commentPage = detailService.getSongPages(pageId,songId);
        modelMap.addAttribute("commentPage", commentPage);
        return "table";
    }
    @GetMapping("/detail")
    public String detail(ModelMap modelMap,Integer songId){
        Song song = songService.getOneDetail(songId);
        modelMap.addAttribute("song", song);
        return "detail";
    }
}
