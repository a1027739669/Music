package com.example.music.demo.controller;


import com.example.music.demo.entity.Song;
import com.example.music.demo.service.IndexService;
import com.example.music.demo.service.LabelService;
import com.example.music.demo.service.RankingService;
import com.example.music.demo.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;


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
    @GetMapping("/guest/rankDetail")
    public String getRankDetail(ModelMap modelMap, Integer rankClassId, Integer pageId) {
        modelMap.addAttribute("classId",rankClassId);
        modelMap.addAttribute("pageIndex",pageId);
        Page<Song> songList = rankingService.getSongRank(pageId,rankClassId);
        modelMap.addAttribute("songList", songList);
        return "rankingtable";
    }

    @GetMapping("/guest/rank")
    public String detail(ModelMap modelMap) throws IOException {
        return "rank";
    }

}
