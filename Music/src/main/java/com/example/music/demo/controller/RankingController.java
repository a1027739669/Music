package com.example.music.demo.controller;

import com.example.music.demo.entity.Label;
import com.example.music.demo.entity.SongClass;
import com.example.music.demo.service.IndexService;
import com.example.music.demo.service.LabelService;
import com.example.music.demo.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

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
    @GetMapping("/guest/songRank")
    public String songRanking(ModelMap modelMap){
        List<Label> labelList = indexService.getAllLabel();
        modelMap.addAttribute("labelList", labelList);
        return "rank";
    }
    @GetMapping("/guest/songTable")
    public String songTable(ModelMap modelMap,Integer labelId,Integer pageId){
        Page<SongClass> songClassPage=songService.getSongPage(labelId, pageId);
        modelMap.addAttribute("songPage",songClassPage);
        List<SongClass> songClassList=songClassPage.getContent();
        if(labelId!=0){
        Label label=labelService.getLabelById(labelId);
        }
        return "rankingtable";
    }

}
