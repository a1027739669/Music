package com.example.music.demo.controller;

import com.example.music.demo.entity.SheetDetail;
import com.example.music.demo.entity.Song;
import com.example.music.demo.entity.SongSheet;
import com.example.music.demo.service.SheetDetailService;
import com.example.music.demo.service.SongService;
import com.example.music.demo.service.SongSheetService;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.controller
 * @ClassName: SheetController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/16 11:45
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/16 11:45
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class SheetController {
    @Autowired
    private SongSheetService songSheetService;
    @Autowired
    private SheetDetailService sheetDetailService;
    @Autowired
    private SongService songService;
    @GetMapping("/guest/sheetDetail")
    public String sheetDetail(ModelMap modelMap,Integer sheetId){
        SongSheet songSheet=songSheetService.findById(sheetId);
        modelMap.addAttribute("sheetDetail",songSheet);
        return "songsheet5";
    }
    @GetMapping("/guest/playSheetAll")
    public String playSheetAll(ModelMap modelMap,Integer sheetId){
        List<SheetDetail> sheetDetails=sheetDetailService.findAllBySheetId(sheetId);
        List<Song> playlist=new ArrayList<>();
        for (int i = 0; i <sheetDetails.size() ; i++) {
            playlist.add(songService.getOneDetail(sheetDetails.get(i).getSongId()));
        }
        modelMap.addAttribute("playlist",playlist);
        return "play";
    }

}
