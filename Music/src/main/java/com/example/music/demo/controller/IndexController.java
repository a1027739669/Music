package com.example.music.demo.controller;
import	java.util.Set;

import java.util.*;
import java.util.concurrent.TimeUnit;

import com.example.music.demo.entity.*;
import com.example.music.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

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
    @Autowired
    private RedisService redisService;
    @Autowired
    private SongSheetService songSheetService;
    @Autowired
    private SongService songService;
    @Autowired
    private AlbumService albumService;

    @GetMapping("/guest/index")
    public String randomSheet(ModelMap modelMap) {
        if (redisService.get("randomSheet") != null) {
            List<SongSheet> randomSheet = (List<SongSheet>) redisService.get("randomSheet");
            modelMap.addAttribute("randomSheet", randomSheet);
        } else {
            Random random = new Random(System.currentTimeMillis());
            List<Integer> list = new ArrayList<>();
            Integer size = songSheetService.getSize();
            while (list.size() != 10) {
                Integer temp = random.nextInt(size) + 1;
                if (!list.contains(temp) && (songSheetService.findById(temp).getDetails().size() >= 1))
                    list.add(temp);
            }
            List<SongSheet> temp = songSheetService.getRandomSheet(list);
            redisService.set("randomSheet", temp, (long) 1, TimeUnit.DAYS);
            modelMap.addAttribute("randomSheet", temp);
        }
        if (redisService.get("newMusices") != null) {
            List<Song> newMusices = (List<Song>) redisService.get("newMusices");
            modelMap.addAttribute("newMusices1", newMusices.subList(0, 9));
            modelMap.addAttribute("newMusices2", newMusices.subList(9, 18));
            modelMap.addAttribute("newMusices3", newMusices.subList(18, 27));
            modelMap.addAttribute("newMusices4", newMusices.subList(27, 36));
            modelMap.addAttribute("newMusices5", newMusices.subList(0, 9));
        } else {
            List<Song> newMusices = songService.getNewMusicies();
            redisService.set("newMusices", newMusices, (long) 1, TimeUnit.DAYS);
            modelMap.addAttribute("newMusices1", newMusices.subList(0, 9));
            modelMap.addAttribute("newMusices2", newMusices.subList(9, 18));
            modelMap.addAttribute("newMusices3", newMusices.subList(18, 27));
            modelMap.addAttribute("newMusices4", newMusices.subList(27, 36));
        }
        if (redisService.get("newAlbums") != null) {
            List<Album> newAlbums = (List<Album>) redisService.get("newAlbums");
            modelMap.addAttribute("newAlbums", newAlbums);
        } else {
            List<Album> newAlbums = albumService.getNewAlbums();
            redisService.set("newAlbums", newAlbums, (long) 1, TimeUnit.DAYS);
            modelMap.addAttribute("newAlbums", newAlbums);
        }
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
        return "index";
    }

    @GetMapping("/guest/playAll")
    public String playAll(ModelMap modelMap) {
        List<Song> playlist = (List<Song>) redisService.get("newMusices");
        modelMap.addAttribute("playlist", playlist);
        return "play";
    }

    @GetMapping("/guest/playSheet")
    public String playSheet(ModelMap modelMap, Integer sheetId) {
        SongSheet songSheet = songSheetService.findById(sheetId);
        List<Song> playlist = new ArrayList<>();
        List<SheetDetail> sheetDetails = songSheet.getDetails();
        if (sheetDetails != null)
            for (int i = 0; i <sheetDetails.size(); i++) {
                  playlist.add(sheetDetails.get(i).getSong());
            }
        modelMap.addAttribute("playlist", playlist);
        return "play";
    }

    @GetMapping("/guest/playAlbum")
    public String playAlbum(ModelMap modelMap, Integer albumId) {
        Album album=albumService.findByAlbumId(albumId);
        List<Song> playlist = new ArrayList<>();
        List<AlbumDetail> albumDetails = album.getDetails();
        if (albumDetails != null)
            for (int i = 0; i <albumDetails.size(); i++) {
                playlist.add(albumDetails.get(i).getSong());
            }
        modelMap.addAttribute("playlist", playlist);
        return "play";
    }
}
