package com.example.music.demo.controller;


import com.example.music.demo.entity.Song;
import com.example.music.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeUnit;


/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.controller
 * @ClassName: RankingController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/18 16:43
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/18 16:43
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class RankingController {
    @Autowired
    private IndexService indexService;
    @Autowired
    private SongService songService;
    @Autowired
    private LabelService labelService;
    @Autowired
    private RankingService rankingService;
    @Autowired
    private RedisService redisService;
    @GetMapping("/guest/rankDetail")
    public String getRankDetail(ModelMap modelMap, Integer rankClassId, Integer pageId) {
        modelMap.addAttribute("classId",rankClassId);
        modelMap.addAttribute("pageIndex",pageId);
        Page<Song> songList = rankingService.getSongRank(pageId,rankClassId);
        if(songList.getContent().size()>0)
        modelMap.addAttribute("songList", songList);
        return "rankingtable";
    }

    @GetMapping("/guest/rank")
    public String detail(ModelMap modelMap) throws IOException {
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
        return "rank";
    }

}
