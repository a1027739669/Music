package com.example.music.demo.controller;

import com.example.music.demo.entity.Album;
import com.example.music.demo.entity.Comment;
import com.example.music.demo.entity.Singer;
import com.example.music.demo.entity.Song;
import com.example.music.demo.service.AlbumService;
import com.example.music.demo.service.SingerService;
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
 * @ClassName: SongController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/21 14:14
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/21 14:14
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class SongController {
    @Autowired
    private SongService songService;
    @Autowired
    private SingerService singerService;
    @Autowired
    private AlbumService albumService;
    @GetMapping("/guest/singerSongs")
    public String getSingerSongs(ModelMap modelMap, Integer singerId, Integer pageId) {
        Page<Song> songPage = songService.getSongPages(pageId, singerId);
        Singer singer=singerService.getSingerById(singerId);
        modelMap.addAttribute("singer", singer);
        modelMap.addAttribute("songPage", songPage);
        return "singersongstable";
    }

    @GetMapping("/guest/singerDetail")
    public String detail(ModelMap modelMap, Integer singerId) throws IOException {
        Singer singer=singerService.getSingerById(singerId);
        singer.setTotalSongs(songService.getTotalSongNumber(singerId));
        singer.setTotalAlbums(albumService.findAlbumBySingerId(singerId).size());
        modelMap.addAttribute("singer", singer);
        List<Album> albumList=albumService.findAlbumBySingerId(singerId);
        if(albumList!=null){
            modelMap.addAttribute("albumList",albumList);
        }
        return "singer";
    }
}
