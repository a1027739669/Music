package com.example.music.demo.controller;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.example.music.demo.repository.UserCollectionRepository;
import com.example.music.demo.tools.AliyunSMS;
import com.example.music.demo.tools.UploadFile;
import com.example.music.demo.entity.*;
import com.example.music.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

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
    @Autowired
    private UserCollectionRepository userCollectionRepository;
    private UploadFile uploadFile = new UploadFile();

    @GetMapping("/user/home")
    public String toHome(ModelMap modelMap, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer count = 0;
        if (user != null) {
            modelMap.addAttribute("user", user);
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
            List<UserCollection> myCollection = userCollectionRepository.findAllByUserId(user.getId());
            if (myCreate.size() >= 10)
                modelMap.addAttribute("myCreate", myCreate.subList(0, 10));
            else {
                if (myCreate.size() > 0)
                    modelMap.addAttribute("myCreate", myCreate);
            }
            if (myCollection.size() >= 10)
                modelMap.addAttribute("myCollection", myCollection.subList(0, 10));
            else if (myCollection.size() > 0)
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
    public String recentPlay(ModelMap modelMap, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null)
            modelMap.addAttribute("user", user);
        List<Song> hotSearch = (List<Song>) redisService.get("hotSearch");
        if (hotSearch.size() >= 5)
            modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
        else
            modelMap.addAttribute("hotSearch", hotSearch);
        List<Song> recentPlay = (List<Song>) redisService.get("user" + user.getId());
        if (recentPlay != null&&recentPlay.size()>0)
            modelMap.addAttribute("recentPlay", recentPlay);
        return "recentplay";
    }

    @GetMapping("/user/mycollection")
    public String mycollection(ModelMap modelMap, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null)
            modelMap.addAttribute("user", user);
        List<Song> hotSearch = (List<Song>) redisService.get("hotSearch");
        if (hotSearch.size() >= 5)
            modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
        else
            modelMap.addAttribute("hotSearch", hotSearch);
        List<UserCollection> myCollection = songService.getMyCollection(user.getId());
        if (myCollection != null)
            modelMap.addAttribute("myCollection", myCollection);
        return "mycollection";
    }

    @PostMapping("/user/modifyinfo")
    @ResponseBody
    public String modifyinfo(MultipartFile file, String nicheng, String mobile, String email, String introduction, String usersex, Integer userId) throws IOException {
        User user = userService.findById(userId);
        if (file != null) {
            String fileName = uploadFile.uploadFile(file);
            user.setUser_image(fileName);
        }
        user.setNicheng(nicheng);
        user.setMobile(mobile);
        user.setIntroduction(introduction);
        user.setUserSex(usersex);
        user.setEmail(email);
        userService.saveUser(user);
        return "SUCCESE";
    }

    @PostMapping(value = "/user/SMSVerification")
    @ResponseBody
    public String SMSVerification(String telephone, HttpSession session) throws ClientException {
        System.out.println(telephone);
        AliyunSMS.setNewcode();
        String code = Integer.toString(AliyunSMS.getNewcode());
        System.out.println("发送的验证码为：" + code);
        //发短信t
        session.setAttribute("usertele", telephone);
        SendSmsResponse response = AliyunSMS.sendSms(telephone, code);// TODO 填写你需要测试的手机号码
        System.out.println("短信接口返回的数据----------------");
        System.out.println("Code=" + response.getCode());
        System.out.println("Message=" + response.getMessage());
        System.out.println("RequestId=" + response.getRequestId());
        System.out.println("BizId=" + response.getBizId());
        return "验证码已发送";
    }

    @PostMapping("/user/modify")
    @ResponseBody
    public String modifyCode(String frontcode) {
        String backCode = Integer.toString(AliyunSMS.getNewcode());
        if (backCode.equalsIgnoreCase(frontcode))
            return "OK";
        return "OK";
    }

    @PostMapping("/user/modifypass")
    @ResponseBody
    public String register2(String password, String telephone, HttpSession session) {
        User user = userService.findByTelephone(telephone);
        if (user != null) {
            user.setPassword(password);
            user = userService.saveUser(user);
            session.setAttribute("user", user);
            return "OK";
        }
        return "失败";
    }

}
