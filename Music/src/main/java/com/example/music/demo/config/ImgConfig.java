package com.example.music.demo.config;



import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.config
 * @ClassName: ImgConfig
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 16:47
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 16:47
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Configuration
public class ImgConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/upload/**").addResourceLocations("file:D:/MUSICRESOURCE/image/");
    }
}
