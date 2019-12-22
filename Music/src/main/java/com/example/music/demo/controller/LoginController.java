package com.example.music.demo.controller;


import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.example.music.demo.entity.Song;
import com.example.music.demo.service.RedisService;
import com.example.music.demo.tools.AliyunSMS;

import com.example.music.demo.entity.SongSheet;
import com.example.music.demo.entity.User;
import com.example.music.demo.service.SongSheetService;
import com.example.music.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;


/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.controller
 * @ClassName: LoginController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/8 7:59
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/8 7:59
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private SongSheetService songSheetService;
    @Autowired
    private RedisService redisService;

    @PostMapping(value = "/guest/SMSVerification")
    @ResponseBody
    public String SMSVerification(String telephone, HttpSession session)
            throws ClientException {
        List<User> userList = userService.findAll();
        for (int i = 0; i < userList.size(); i++) {
            if (userList.get(i).getMobile().equalsIgnoreCase(telephone))
                return "手机号已注册";
        }
        System.out.println(telephone);
        AliyunSMS.setNewcode();
        String code = Integer.toString(AliyunSMS.getNewcode());
        System.out.println("发送的验证码为：" + code);
        //发短信t
        session.setAttribute("teleph", telephone);
        SendSmsResponse response = AliyunSMS.sendSms(telephone, code);// TODO 填写你需要测试的手机号码
        System.out.println("短信接口返回的数据----------------");
        System.out.println("Code=" + response.getCode());
        System.out.println("Message=" + response.getMessage());
        System.out.println("RequestId=" + response.getRequestId());
        System.out.println("BizId=" + response.getBizId());
        return "验证码已发送";
    }

    @PostMapping(value = "/guest/login")
    @ResponseBody
    public String login(@RequestParam String username, @RequestParam String password,
                        HttpSession session) {
        User user = userService.findByUserName(username);
        if (user == null) {
            user = userService.findByPhone(username);
            if (user == null)
                return "用户名不存在";
        }
        if (!user.getPassword().equals(password))
            return "密码错误";
        if (user.getIsAlive() != 1)
            return "用户已被封禁";
        else {
            List<SongSheet> songSheetList = songSheetService.findByCreateId(user.getId());
            session.setAttribute("loginusersheet", songSheetList);
            session.setAttribute("user", user);
            List<Song> list = (List<Song>) redisService.get("user" + user.getId());
            if (list != null) {
                list = new ArrayList<>();
                redisService.set("user" + user.getId(), list);
            }
            return "登录成功";
        }
    }

    @GetMapping("/user/loginout")
    public String loginout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/guest/index";
    }

    @PostMapping("/guest/vertify")
    @ResponseBody
    public String vertifyCode(String frontcode) {
        String backCode = Integer.toString(AliyunSMS.getNewcode());

        if (backCode.equalsIgnoreCase(frontcode))
            return "OK";
        return "FALSE";
    }

    @PostMapping("/guest/register")
    @ResponseBody
    public String register(String password, String telephone, HttpSession
            session) {
        User user = new User();
        user.setIsAlive(1);
        user.setIntroduction("暂无介绍");
        user.setMobile(telephone);
        user.setPassword(password);
        user.setNicheng("暂无昵称");
        user.setUsername(telephone);
        user.setIs_super(0);
        user.setUserSex("保密");
        user.setCreate_date(new Date());
        user.setUser_image("user.jpg");
        user = userService.saveUser(user);
        List<Song> songList = new ArrayList<>();
        redisService.set("user" + user.getId(), songList);
        session.setAttribute("user", user);
        return "OK";
    }
}
