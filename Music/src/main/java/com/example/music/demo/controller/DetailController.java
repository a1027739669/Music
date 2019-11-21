package com.example.music.demo.controller;


import com.example.music.demo.entity.Comment;
import com.example.music.demo.entity.Song;
import com.example.music.demo.service.DetailService;
import com.example.music.demo.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
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

    @GetMapping("/guest/songDetail")
    public String getDetail(ModelMap modelMap, Integer songId, Integer pageId) {
        Song song = songService.getOneDetail(songId);
        song.setTotalComNum(detailService.getTotalComNub(songId));
        modelMap.addAttribute("song", song);
        Page<Comment> commentPage = detailService.getSongPages(pageId, songId);
        modelMap.addAttribute("commentPage", commentPage);
        return "commenttable";
    }

    @GetMapping("/guest/detail")
    public String detail(ModelMap modelMap, Integer songId) throws IOException {
        Song song = songService.getOneDetail(songId);
        song.setTotalComNum(detailService.getTotalComNub(songId));
        modelMap.addAttribute("song", song);
        String filePath="D:/MUSICRESOURCE/lyic/"+song.getSong_lyrics();
        File file = new File(filePath);
        if (file.exists()) {
            List<String> temp = Files.readAllLines(Paths.get(filePath));
            List<String> lyric=new ArrayList<>();
            for (int i = 0; i <temp.size(); i++) {
                String[] line=temp.get(i).split("]");
                if(line.length>1)
                {
                    lyric.add(line[1]);
                }
            }
            if(lyric.size()!=0)
            modelMap.addAttribute("lyric",lyric);
        }
        return "detail";
    }
}
