package com.example.music.demo.controller;

import com.example.music.demo.entity.*;
import com.example.music.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.controller
 * @ClassName: HomeController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/17 10:22
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/17 10:22
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class HomeController {
    @Autowired
    private UserService userService;
    @Autowired
    private SongSheetService songSheetService;
    @Autowired
    private LabelService labelService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private SongService songService;

    @GetMapping("/user/home")
    public String toHome(ModelMap modelMap, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer count = 0;
        if (user != null) {
            modelMap.addAttribute("user",user);
            List<UserCollection> myCollectionSongs = songService.getMyCollection(user.getId());
            modelMap.addAttribute("myCollection", myCollectionSongs);
            List<Song> recentPlay = (List<Song>) redisService.get("user" + user.getId());
            modelMap.addAttribute("recentPlay", recentPlay);
            List<SongSheet> allSongSheet = songSheetService.findAllLikeSheet(user.getId());
            Set<Integer> ans = new HashSet<>();
            for (int i = 0; i < allSongSheet.size(); i++) {
                List<SheetDetail> temp = allSongSheet.get(i).getDetails();
                for (int j = 0; j < temp.size(); j++) {
                    ans.add(temp.get(j).getSongId());
                }
            }
            count = ans.size();
            List<SongSheet> myCreate = songSheetService.findMyCreate(user.getId());
            List<SongSheet> myCollection = songSheetService.findMyConlection(user.getId());
            if (myCreate.size() >= 10)
                modelMap.addAttribute("myCreate", myCreate.subList(0, 10));
            else
                modelMap.addAttribute("myCreate", myCreate);
            if (myCollection.size() >= 10)
                modelMap.addAttribute("myCollection", myCollection.subList(0, 10));
            else
                modelMap.addAttribute("myCollection", myCollection);
        }
        modelMap.addAttribute("allSong", count);
        List<Song> hotSearch = (List<Song>) redisService.get("hotSearch");
        if (hotSearch.size() >= 5)
            modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
        else
            modelMap.addAttribute("hotSearch", hotSearch);
        return "home2";
    }

    @GetMapping("/user/create")
    public String create(ModelMap modelMap) {
        List<Label> labelList = labelService.findAll();
        modelMap.addAttribute("labelList", labelList);
        List<Song> hotSearch = (List<Song>) redisService.get("hotSearch");
        if (hotSearch.size() >= 5)
            modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
        else
            modelMap.addAttribute("hotSearch", hotSearch);
        return "createsheet";
    }

    @GetMapping("/user/userinfo")
    public String userInfo(ModelMap modelMap, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null)
            modelMap.addAttribute("user", user);
        List<Song> hotSearch = (List<Song>) redisService.get("hotSearch");
        if (hotSearch.size() >= 5)
            modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
        else
            modelMap.addAttribute("hotSearch", hotSearch);
        return "myinfo";
    }

    @GetMapping("/user/recentplay")
    public String recentPlay(ModelMap modelMap,HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user != null)
            modelMap.addAttribute("user", user);
        List<Song> hotSearch = (List<Song>) redisService.get("hotSearch");
        if (hotSearch.size() >= 5)
            modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
        else
            modelMap.addAttribute("hotSearch", hotSearch);
        List<Song> recentPlay= (List<Song>) redisService.get("user"+user.getId());
        if(recentPlay!=null)
            modelMap.addAttribute("recentPlay",recentPlay);
        return "recentplay";
    }

    @GetMapping("/user/mycollection")
    public String mycollection(ModelMap modelMap,HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user != null)
            modelMap.addAttribute("user", user);
        List<Song> hotSearch = (List<Song>) redisService.get("hotSearch");
        if (hotSearch.size() >= 5)
            modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
        else
            modelMap.addAttribute("hotSearch", hotSearch);
        List<UserCollection> myCollection= songService.getMyCollection(user.getId());
        if(myCollection!=null)
            modelMap.addAttribute("myCollection",myCollection);
        return "mycollection";
    }
}
