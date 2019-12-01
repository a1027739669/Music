package com.example.music.demo.controller;

import com.example.music.demo.entity.Album;
import com.example.music.demo.entity.Label;
import com.example.music.demo.entity.Singer;
import com.example.music.demo.entity.Song;
import com.example.music.demo.service.*;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.controller
 * @ClassName: SingerController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/28 15:24
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/28 15:24
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class SingerController {
    @Autowired
    private LabelService labelService;
    @Autowired
    private SingerService singerService;
    @Autowired
    private SongService songService;
    @Autowired
    private AlbumService albumService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private IndexService indexService;

    @GetMapping("/guest/singertable")
    public String getSingerList(ModelMap modelMap, String country, String sex, String label, Integer pageId) {
        Page<Singer> singerPage = singerService.getSingerList(country, sex, label, pageId);
        modelMap.addAttribute("currentCoun", country);
        modelMap.addAttribute("currentSex", sex);
        modelMap.addAttribute("currentLabel", label);
        modelMap.addAttribute("singerPage", singerPage);
        List<Label> labelList = labelService.findAll();
        modelMap.addAttribute("labelList", labelList);
        return "singerlisttable";

    }

    @GetMapping("/guest/singerDetail")
    public String detail(ModelMap modelMap, Integer singerId) throws IOException {
        Singer singer = singerService.getSingerById(singerId);
        singer.setTotalSongs(songService.getTotalSongNumber(singerId));
        singer.setTotalAlbums(albumService.findAlbumBySingerId(singerId).size());
        modelMap.addAttribute("singer", singer);
        List<Album> albumList = albumService.findAlbumBySingerId(singerId);
        if (albumList != null) {
            modelMap.addAttribute("albumList", albumList);
        }
        List<Singer> likes = singerService.findLikes(singer.getLabels());
        Collections.sort(likes, new Comparator<Singer>() {
            @Override
            public int compare(Singer o1, Singer o2) {
                return -o1.getSupport().compareTo(o2.getSupport());
            }
        });
        if(likes.size()>0){
        if (likes.size() >= 5)
            modelMap.addAttribute("likes", likes.subList(0, 5));
        else
            modelMap.addAttribute("likes", likes);
        }

        return "singer";
    }

    @GetMapping("/guest/singerlist")
    public String singerList(ModelMap modelMap) {
        if (redisService.get("hotSearch") != null) {
            List<Song> hotSearch = (List<Song>) redisService.get("hotSearch");
            if (hotSearch.size() >= 5)
                modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
            else
                modelMap.addAttribute("hotSearch", hotSearch);
        } else {
            List<Song> hotSearch = indexService.getMoreSearchMusics();
            redisService.set("hotSearch", hotSearch, (long) 1, TimeUnit.DAYS);
            if (hotSearch.size() >= 5)
                modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
            else
                modelMap.addAttribute("hotSearch", hotSearch);
        }
        return "singerlist";
    }
}
