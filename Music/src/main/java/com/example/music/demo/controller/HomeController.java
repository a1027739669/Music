package com.example.music.demo.controller;

import com.example.music.demo.entity.Label;
import com.example.music.demo.entity.SheetDetail;
import com.example.music.demo.entity.SongSheet;
import com.example.music.demo.entity.User;
import com.example.music.demo.service.LabelService;
import com.example.music.demo.service.SongSheetService;
import com.example.music.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
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
    @GetMapping("/user/home")
    public String toHome(ModelMap modelMap, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer count = 0;
        if (user != null) {
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
        return "home2";
    }

    @GetMapping("/user/create")
    public String create(ModelMap modelMap){
        List<Label> labelList=labelService.findAll();
        modelMap.addAttribute("labelList",labelList);
        return "createsheet";
    }
}
