package com.example.music.demo.controller;
import com.example.music.demo.entity.Album;
import com.example.music.demo.entity.Label;
import com.example.music.demo.entity.Singer;
import com.example.music.demo.service.LabelService;
import com.example.music.demo.service.SingerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import	java.util.function.Consumer;

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
    @GetMapping("/guest/singertable")
    public String getSingerList(ModelMap modelMap, String country,String sex,String label, Integer pageId) {
        Page<Singer> singerPage = singerService.getSingerList(country, sex,label,pageId);
        modelMap.addAttribute("currentCoun", country);
        modelMap.addAttribute("currentSex", sex);
        modelMap.addAttribute("currentLabel",label);
        modelMap.addAttribute("singerPage",singerPage);
        List<Label> labelList=labelService.findAll();
        modelMap.addAttribute("labelList",labelList);
        return "singerlisttable";

    }

    @GetMapping("/guest/singerlist")
    public String singerList(ModelMap modelMap) {
        return "singerlist";
    }
}
