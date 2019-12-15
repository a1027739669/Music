package com.example.music.demo.Interceptor;


import com.example.music.demo.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import reactor.util.annotation.Nullable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.Interceptor
 * @ClassName: MyInterceptor
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/12/9 20:06
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/12/9 20:06
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Component
public class MyInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            String s = request.getRequestURI().split("/")[1];
            if (s.equalsIgnoreCase("user"))
                response.sendRedirect("/guest/index");
            else if (s.equalsIgnoreCase("back"))
                response.sendRedirect("/back/login");
            return false;
        } else {
            return true;
        }
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
    }
}
