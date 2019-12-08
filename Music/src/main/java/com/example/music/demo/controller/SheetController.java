package com.example.music.demo.controller;

import com.example.music.demo.entity.*;
import com.example.music.demo.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
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
    @Autowired
    private RedisService redisService;
    @Autowired
    private LabelService labelService;
    @Autowired
    private CollectionService collectionService;
    @Autowired
    private UserService userService;
    @GetMapping("/guest/sheetDetail")
    public String sheetDetail(ModelMap modelMap, Integer sheetId,HttpSession session) {
        SongSheet songSheet = songSheetService.findById(sheetId);
        modelMap.addAttribute("sheetDetail", songSheet);
        List<SongSheet> others = songSheetService.findMyCreateLimit(songSheet.getUser().getId());
        modelMap.addAttribute("others", others);
        List<SongSheet> likes = songSheetService.findByLabelsLike(songSheet.getLabels());
        for (int i = 0; i < likes.size(); i++) {
            if (likes.get(i).getId() == songSheet.getId()) {
                likes.remove(i);
                break;
            }
        }
        if(likes.size()>5){
            likes.remove(5);
        }
        modelMap.addAttribute("likes", likes);
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
        User user= (User) session.getAttribute("user");
        if(user!=null){
            List<SongSheet> myCreateSheet=songSheetService.findMyCreate(user.getId());
            if(myCreateSheet!=null){
                modelMap.addAttribute("myCreateSheet",myCreateSheet);
            }
        }
        return "sheetdetail";
    }

    @GetMapping("/guest/playSheetAll")
    public String playSheetAll(ModelMap modelMap, Integer sheetId,HttpSession session) {
        List<SheetDetail> sheetDetails = sheetDetailService.findAllBySheetId(sheetId);
        List<Song> playlist = new ArrayList<>();
        for (int i = 0; i < sheetDetails.size(); i++) {
            playlist.add(songService.getOneDetail(sheetDetails.get(i).getSongId()));
        }
        modelMap.addAttribute("playlist", playlist);
        User user= (User) session.getAttribute("user");
        if(user!=null){
            String key="user"+""+user.getId();
            List<Song> recentPlay= (List<Song>) redisService.get(key);
            for(int i=0;i<playlist.size(); i++){
                Song song = playlist.get(i);
                if(!recentPlay.contains(song)){
                    recentPlay.add(song);
                }
                if(recentPlay.size()>=101)
                    recentPlay.remove(0);
            }
            redisService.set(key,recentPlay);
        }
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
            fileName = s[0] + System.currentTimeMillis() + '.' + s[1];
            File path = new File("D:/MUSICRESOURCE/image/" + fileName);
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
    public String getSheetList(ModelMap modelMap, Integer rankMethod, Integer pageId, String label) {

        Page<SongSheet> sheetsPage = indexService.getSheetList(pageId, rankMethod, label);
        modelMap.addAttribute("currentLabel", label);
        modelMap.addAttribute("currentRankId", rankMethod);
        if(sheetsPage.getContent().size()>0)
        modelMap.addAttribute("sheetsPage", sheetsPage);
        return "sheettable";
    }

    @GetMapping("/guest/sheetlist")
    public String detail(ModelMap modelMap) {
        List<Label> labelList = labelService.findAll();
        modelMap.addAttribute("labelList", labelList);
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
        modelMap.addAttribute("tempLabel", "全部");
        return "sheetlist";
    }

    @GetMapping("/user/addtosheet")
    @ResponseBody
    public String addtosheet(Integer sheetId, Integer[] songId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (songId!=null&&songId.length == 1) {
            if (user != null) {
                SheetDetail sheetDetail = sheetDetailService.findBySongIdAndSheetId(sheetId, songId[0]);
                if (sheetDetail != null)
                    return "歌曲已经存在";
                else {
                    SheetDetail temp = new SheetDetail();
                    temp.setSheetId(sheetId);
                    temp.setSongId(songId[0]);
                    sheetDetailService.save(temp);
                    return "添加成功";
                }
            } else
                return "添加失败";
        } else {
            for (int i = 0; i < songId.length; i++) {
                SheetDetail temp = new SheetDetail();
                temp.setSheetId(sheetId);
                temp.setSongId(songId[i]);
                sheetDetailService.save(temp);
            }
            return "添加成功";
        }
    }

    @GetMapping("/user/toCollect")
    @ResponseBody
    public String toCollect(Integer sheetId,HttpSession session){
        User user = (User) session.getAttribute("user");
        SongSheet songSheet=songSheetService.findById(sheetId);
        if (user!=null) {
            if(user.getId().equals(songSheet.getCreateId())){
                return "此歌单为您创建的歌单";
            }
            else {
                List<UserCollection> collectionList=songSheetService.findMyConlection(user.getId());
                for (int i = 0; i <collectionList.size() ; i++) {
                    if(collectionList.get(i).getSongSheet().getId().equals(user.getId()))
                    {
                        return "歌单为已收藏歌单";
                    }
                }
                UserCollection userCollection=new UserCollection();
                userCollection.setSheetId(songSheet.getId());
                userCollection.setUserId(user.getId());
                collectionService.save(userCollection);
                songSheet.setSupport(songSheet.getSupport()+1);
                songSheetService.save(songSheet);
                return "收藏成功";
            }
        }
        return "错误";
    }

    @GetMapping("/user/usercreated")
    public String usercreated(ModelMap modelMap,Integer userId){
        List<SongSheet> songSheetList=songSheetService.findByCreateId(userId);
        if(songSheetList.size()>0)
        modelMap.addAttribute("songSheetList",songSheetList);
        User user=userService.findById(userId);
        modelMap.addAttribute("nicheng",user.getNicheng());
        List<Song> hotSearch=redisService.getHotSearch();
        modelMap.addAttribute("hotSearch",hotSearch);
        return "usercreatelist";
    }

    @GetMapping("/user/usercollections")
    public String usercollections(ModelMap modelMap,Integer userId){
        List<SongSheet> songSheetList=songSheetService.findByCreateId(userId);
        if(songSheetList.size()>0)
        modelMap.addAttribute("songSheetList",songSheetList);
        User user=userService.findById(userId);
        modelMap.addAttribute("nicheng",user.getNicheng());
        List<Song> hotSearch=redisService.getHotSearch();
        modelMap.addAttribute("hotSearch",hotSearch);
        return "usercollections";
    }

    @GetMapping("/user/deletesheet")
    public String deleteSheet(Integer sheetId){
        songSheetService.deleteSheet(sheetId);
        redisService.remove("randomSheet");
        return "删除成功";
    }
}
