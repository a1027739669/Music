package com.example.music.demo.controller;
import	java.awt.font.NumericShaper.Range;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.example.music.demo.config.AliyunSMS;
import com.example.music.demo.entity.User;
import com.example.music.demo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

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
    @PostMapping(value = "/SMSVerification")
    @ResponseBody
    public void SMSVerification( String telephone) throws ClientException {
        System.out.println(telephone);
        AliyunSMS.setNewcode();
        String code = Integer.toString(AliyunSMS.getNewcode());
        System.out.println("发送的验证码为："+code);
        //发短信t
        SendSmsResponse response =AliyunSMS.sendSms(telephone,code); // TODO 填写你需要测试的手机号码
        System.out.println("短信接口返回的数据----------------");
        System.out.println("Code=" + response.getCode());
        System.out.println("Message=" + response.getMessage());
        System.out.println("RequestId=" + response.getRequestId());
        System.out.println("BizId=" + response.getBizId());
    }
    @ResponseBody
    @RequestMapping(value = "/guest/login")
    public String login(@RequestParam String username, @RequestParam String password, HttpServletRequest request){

        return "yes";
    }
}
