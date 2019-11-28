package com.example.music.demo.controller;
import java.util.*;
import java.util.concurrent.TimeUnit;

import com.example.music.demo.entity.*;
import com.example.music.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.controller
 * @ClassName: IndexController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 9:55
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 9:55
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class IndexController {
    @Autowired
    private IndexService indexService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private SongSheetService songSheetService;
    @Autowired
    private SongService songService;
    @Autowired
    private AlbumService albumService;
    @GetMapping("/guest/index")
    public String randomSheet(ModelMap modelMap) {
       if(redisService.get("randomSheet")!=null){
           List<SongSheet> randomSheet= (List<SongSheet>) redisService.get("randomSheet");
           modelMap.addAttribute("randomSheet",randomSheet);
       }
       else {
           Random random=new Random(System.currentTimeMillis());
           List<Integer> list=new ArrayList<>();
           Integer size=songSheetService.getSize();
           while(list.size() !=10){
               Integer temp=random.nextInt(size)+1;
               if(!list.contains(temp)&&(songSheetService.findById(temp).getDetails().size()>=1))
                   list.add(temp);
           }
           List<SongSheet> temp=songSheetService.getRandomSheet(list);
           redisService.set("randomSheet",temp, (long) 1,TimeUnit.DAYS);
           modelMap.addAttribute("randomSheet",temp);
       }
       if(redisService.get("newMusices")!=null){
           List<Song>   newMusices= (List<Song>) redisService.get("newMusices");
           modelMap.addAttribute("newMusices1",newMusices.subList(0,9));
           modelMap.addAttribute("newMusices2",newMusices.subList(9,18));
           modelMap.addAttribute("newMusices3",newMusices.subList(18,27));
           modelMap.addAttribute("newMusices4",newMusices.subList(27,36));
           modelMap.addAttribute("newMusices5",newMusices.subList(0,9));
       }
       else {
           List<Song> newMusices=songService.getNewMusicies();
           redisService.set("newMusices" , newMusices, (long) 1, TimeUnit.DAYS);
           modelMap.addAttribute("newMusices1",newMusices.subList(0,9));
           modelMap.addAttribute("newMusices2",newMusices.subList(9,18));
           modelMap.addAttribute("newMusices3",newMusices.subList(18,27));
           modelMap.addAttribute("newMusices4",newMusices.subList(27,36));
       }
        if(redisService.get("newAlbums")!=null){
             List<Album>   newAlbums= (List<Album>) redisService.get("newAlbums");
             modelMap.addAttribute("newAlbums",newAlbums);
        }
        else {
          List<Album> newAlbums=albumService.getNewAlbums();
          redisService.set("newAlbums" , newAlbums, (long) 1, TimeUnit.DAYS);
          modelMap.addAttribute("newAlbums",newAlbums);
        }
       return "index";
    }
    @GetMapping("/guest/playAll")
    public String playAll(ModelMap modelMap){
        List<Song>   playlist= (List<Song>) redisService.get("newMusices");
        modelMap.addAttribute("playlist",playlist);
        return "play";
    }

}
