package com.example.music.demo.controller;

import com.example.music.demo.entity.Album;
import com.example.music.demo.entity.AlbumDetail;
import com.example.music.demo.entity.Song;
import com.example.music.demo.service.AlbumService;
import com.example.music.demo.service.IndexService;
import com.example.music.demo.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.concurrent.TimeUnit;


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
    @Autowired
    private RedisService redisService;

    @GetMapping("/guest/albumtable")
    public String getAlbumList(ModelMap modelMap, String category, Integer pageId) {
        Page<Album> albumPage = albumService.getAlbumList(pageId, category);
        modelMap.addAttribute("currentCate", category);
        modelMap.addAttribute("albumPage", albumPage);
        return "albumtable";
    }

    @GetMapping("/guest/albumlist")
    public String detail(ModelMap modelMap) {
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
        return "albumlist";
    }

    @GetMapping("/guest/albumDetail")
    public String sheetDetail(ModelMap modelMap, Integer albumId) {
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
        Album album = albumService.findByAlbumId(albumId);
        modelMap.addAttribute("album", album);
        List<Album> others = albumService.findOthers(album.getSinger().getId());
        for(int i=others.size()-1;i>=0;i--){
            if (others.get(i).getAlbumId().equals(album.getAlbumId()))
                others.remove(i);
        }
        if(others!=null&&others.size()>0)
        modelMap.addAttribute("others",others);
        return "albumdetail";
    }
}
