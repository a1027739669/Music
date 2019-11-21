package com.example.music.demo.controller;

import com.example.music.demo.entity.Song;
import com.example.music.demo.repository.SongRepository;
import com.example.music.demo.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.controller
 * @ClassName: PlayCobtroller
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/13 9:18
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/13 9:18
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class PlayController {
    @Autowired
    private IndexService indexService;
    @RequestMapping("/guest/playSong")
    public String play(HttpSession httpSession, Integer id, ModelMap modelMap){
        List<Song> playlist=indexService.setPlaySong(httpSession,id);
        modelMap.addAttribute("playlist",playlist);
        return "play";
    }

}
