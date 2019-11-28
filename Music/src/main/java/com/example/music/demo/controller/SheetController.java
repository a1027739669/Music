package com.example.music.demo.controller;

import com.example.music.demo.entity.SheetDetail;
import com.example.music.demo.entity.Song;
import com.example.music.demo.entity.SongSheet;
import com.example.music.demo.service.IndexService;
import com.example.music.demo.service.SheetDetailService;
import com.example.music.demo.service.SongService;
import com.example.music.demo.service.SongSheetService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.controller
 * @ClassName: SheetController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/16 11:45
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/16 11:45
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class SheetController {
    @Autowired
    private SongSheetService songSheetService;
    @Autowired
    private SheetDetailService sheetDetailService;
    @Autowired
    private SongService songService;
    @Autowired
    private IndexService indexService;
    @GetMapping("/guest/sheetDetail")
    public String sheetDetail(ModelMap modelMap, Integer sheetId) {
        SongSheet songSheet = songSheetService.findById(sheetId);
        modelMap.addAttribute("sheetDetail", songSheet);
        List<SongSheet> others = songSheetService.findMyCreateLimit(songSheet.getUser().getId());
        modelMap.addAttribute("others", others);
        List<SongSheet> likes = songSheetService.findByLabelsLike(songSheet.getLabels());
        for(int i=0;i<likes.size();i++){
            if(likes.get(i).getId()==songSheet.getId()){
                likes.remove(i);
                break;
            }
        }
        modelMap.addAttribute("likes", likes);
        return "sheetdetail";
    }

    @GetMapping("/guest/playSheetAll")
    public String playSheetAll(ModelMap modelMap, Integer sheetId) {
        List<SheetDetail> sheetDetails = sheetDetailService.findAllBySheetId(sheetId);
        List<Song> playlist = new ArrayList<>();
        for (int i = 0; i < sheetDetails.size(); i++) {
            playlist.add(songService.getOneDetail(sheetDetails.get(i).getSongId()));
        }
        modelMap.addAttribute("playlist", playlist);
        return "play";
    }

    @ResponseBody
    @PostMapping("/user/createSheet")
    public String createSheet(@RequestParam("file") MultipartFile file, String sheetName, String textArea, String tags, Integer userId) throws IOException {
        Pattern pattern = Pattern.compile("\\S+");
        Matcher matcher = pattern.matcher(tags);
        String tag = "";
        SongSheet songSheet = new SongSheet();
        while (matcher.find()) {
            tag += matcher.group() + ",";
        }
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String[] s = fileName.split("\\.");
            File path = new File("D:/MUSICRESOURCE/image/" + s[0] + System.currentTimeMillis() + '.' + s[1]);
            file.transferTo(path);
            songSheet.setSheetImg(fileName);
        }
        songSheet.setSheetName(sheetName);
        songSheet.setUserId(userId);
        songSheet.setSupport((float) 0);
        songSheet.setCreateDate(new Date());
        songSheet.setIntroduction(textArea);
        songSheet.setCreateId(userId);
        songSheet.setPlayCount(0);
        songSheet.setLabels(tag);
        songSheetService.insertSheet(songSheet);
        return "success";
    }
    @GetMapping("/guest/sheettable")
    public String getSheetList(ModelMap modelMap,Integer rankMethod,Integer pageId) {

        Page<SongSheet> sheetsPage = indexService.getSheetList(pageId,rankMethod);

        modelMap.addAttribute("sheetsPage", sheetsPage);
        return "sheettable";
    }
    @GetMapping("/guest/sheetlist")
    public String detail(ModelMap modelMap){
        return "sheetlist";
    }
}
