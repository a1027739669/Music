package com.example.music.demo.config;
import com.example.music.demo.Interceptor.MyInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.config
 * @ClassName: WebConfigurer
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/12/9 20:08
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/12/9 20:08
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Configuration
public class WebConfigurer implements WebMvcConfigurer {
    @Autowired
    private MyInterceptor myInterceptor;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    }
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(myInterceptor).addPathPatterns("/user/**");
        registry.addInterceptor(myInterceptor).addPathPatterns("/back/**").excludePathPatterns("/back/login","/back/tologin");
    }
}
