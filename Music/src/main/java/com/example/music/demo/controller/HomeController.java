package com.example.music.demo.controller;

import com.example.music.demo.entity.User;
import com.example.music.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

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

    @GetMapping("/user/home")
    public String toHome(ModelMap modelMap) {
        User user = userService.getUser("admin", "123456");
        modelMap.addAttribute("user", user);
        return "home2";
    }
}
