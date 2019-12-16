package com.example.music.demo.controller;

import com.example.music.demo.entity.*;
import com.example.music.demo.repository.*;
import com.example.music.demo.service.*;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.TimeUnit;


/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.controller
 * @ClassName: test
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 9:46
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 9:46
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class test {
    @Autowired
    private SongSheetRepository songSheetRepository;
    @Autowired
    private SheetDetailRepository sheetDetailRepository;
    @Autowired
    private SongRepository songRepository;
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private SongService songService;
    @Autowired
    private IndexService indexService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private SongSheetService songSheetService;
    @Autowired
    private AlbumRepository albumRepository;
    @Autowired
    private LabelService labelService;
    @Autowired
    private AlbumDetailRepository albumDetailRepository;
    @Autowired
    private SingerRepository singerRepository;
    @Autowired
    private UserRepository userRepository;
    @GetMapping("/test")
    public String test(ModelMap modelMap, HttpSession session) {

//        if (redisService.get("hotSearch") != null) {
//            List<Song> hotSearch = (List<Song>) redisService.get("hotSearch");
//            if (hotSearch.size() >= 5)
//                modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
//            else
//                modelMap.addAttribute("hotSearch", hotSearch);
//        } else {
//            List<Song> hotSearch = indexService.getMoreSearchMusics();
//            redisService.set("hotSearch", hotSearch, (long) 1, TimeUnit.DAYS);
//            if (hotSearch.size() >= 5)
//                modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
//            else
//                modelMap.addAttribute("hotSearch", hotSearch);
//        }

//        List<Song> songList1=new ArrayList<>();
//        List<Song> songList2=new ArrayList<>();
//        List<Song> songList3=new ArrayList<>();
//        List<Song> songList4=new ArrayList<>();
//        redisService.set("user1",songList1);
//        redisService.set("user2",songList2);
//        redisService.set("user3",songList3);
//        redisService.set("user4",songList4);
       return "player";
    }

}
