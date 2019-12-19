package com.example.music.demo.controller;

import com.example.music.demo.entity.*;
import com.example.music.demo.service.*;
import com.example.music.demo.tools.Download;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.controller
 * @ClassName: SongController
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/21 14:14
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/21 14:14
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Controller
public class SongController {
    @Autowired
    private SongService songService;
    @Autowired
    private SingerService singerService;
    @Autowired
    private AlbumService albumService;
    @Autowired
    private InfoService infoService;
    @Autowired
    private SongSheetService songSheetService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private IndexService indexService;
    @Autowired
    private CommentService commentService;
    private Download download = new Download();
    @GetMapping("/guest/singerSongs")
    public String getSingerSongs(ModelMap modelMap, Integer singerId,
                                 Integer pageId) {
        Page<Song> songPage = songService.getSongPages(pageId, singerId);
        Singer singer = singerService.getSingerById(singerId);
        modelMap.addAttribute("singer", singer);
        modelMap.addAttribute("songPage", songPage);
        return "singersongstable";
    }
    @GetMapping(value = "/user/downsong")
    public void downSong(HttpServletResponse response, String[] names,
                         String[] paths) {

        String directory = "D:\\MUSICRESOURCE\\zip";
        File directoryFile = new File(directory);
        if (!directoryFile.isDirectory() && !directoryFile.exists()) {
            directoryFile.mkdirs();
        }

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
        String zipFileName = formatter.format(new Date()) + ".zip";
        String strZipPath = directory + "\\" + zipFileName;

        ZipOutputStream zipStream = null;
        FileInputStream zipSource = null;
        BufferedInputStream bufferStream = null;
        File zipFile = new File(strZipPath);
        try {

            zipStream = new ZipOutputStream(new FileOutputStream(zipFile));
            for (int i = 0; i < paths.length; i++) {

                String realFileName = java.net.URLDecoder.decode(names[i], "UTF-8");
                String realFilePath = java.net.URLDecoder.decode(paths[i], "UTF-8");
                File file = new File(realFilePath);

                if (file.exists()) {
                    zipSource = new FileInputStream(file);//将需要压缩的文件格式化为输入流
                    ZipEntry zipEntry = new ZipEntry(realFileName);//在压缩目录中文件的名字
                    zipStream.putNextEntry(zipEntry);//定位该压缩条目位置，开始写入文件到压缩包中
                    bufferStream = new BufferedInputStream(zipSource, 1024 * 10);
                    int read = 0;
                    byte[] buf = new byte[1024 * 10];
                    while ((read = bufferStream.read(buf, 0, 1024 * 10)) != -1) {
                        zipStream.write(buf, 0, read);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭流
            try {
                if (null != bufferStream) bufferStream.close();
                if (null != zipStream) {
                    zipStream.flush();
                    zipStream.close();
                }
                if (null != zipSource) zipSource.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        if (zipFile.exists()) {
            download.downFile(response, zipFileName, strZipPath);
            zipFile.delete();
        }
    }
    @GetMapping(value = "/user/downsongbyids")
    public void downSongByIds(HttpServletResponse response,
                              Integer[] ids) {
        List<Song> songList = songService.findAllByIds(ids);
        for (int i = 0; i < songList.size(); i++) {
            Song song = songList.get(i);
            Info info = song.getInfo();
            Singer singer = song.getSinger();
            info.setInfo_down(info.getInfo_down() + 1);
            infoService.save(info);
            singer.setSupport(singer.getSupport() + 1);
            singerService.save(singer);

        }
        String[] names = new String[songList.size()];
        String[] paths = new String[songList.size()];
        for (int i = 0; i < songList.size(); i++) {
            String tempname = songList.get(i).getSong_file();
            String[] temp = tempname.split("\\.");
            String suffix = temp[temp.length - 1];
            names[i] = songList.get(i).getSong_name() + '.' + suffix;
            paths[i] = "D:/MUSICRESOURCE/yinpin/" + songList.get(i).getSong_file();
        }
        String directory = "D:\\MUSICRESOURCE\\zip";
        File directoryFile = new File(directory);
        if (!directoryFile.isDirectory() && !directoryFile.exists()) {
            directoryFile.mkdirs();
        }

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
        String zipFileName = formatter.format(new Date()) + ".zip";
        String strZipPath = directory + "\\" + zipFileName;

        ZipOutputStream zipStream = null;
        FileInputStream zipSource = null;
        BufferedInputStream bufferStream = null;
        File zipFile = new File(strZipPath);
        try {

            zipStream = new ZipOutputStream(new FileOutputStream(zipFile));
            for (int i = 0; i < paths.length; i++) {

                String realFileName = java.net.URLDecoder.decode(names[i], "UTF-8");
                String realFilePath = java.net.URLDecoder.decode(paths[i], "UTF-8");
                File file = new File(realFilePath);

                if (file.exists()) {
                    zipSource = new FileInputStream(file);//将需要压缩的文件格式化为输入流
                    ZipEntry zipEntry = new ZipEntry(realFileName);//在压缩目录中文件的名字
                    zipStream.putNextEntry(zipEntry);//定位该压缩条目位置，开始写入文件到压缩包中
                    bufferStream = new BufferedInputStream(zipSource, 1024 * 10);
                    int read = 0;
                    byte[] buf = new byte[1024 * 10];
                    while ((read = bufferStream.read(buf, 0, 1024 * 10)) != -1) {
                        zipStream.write(buf, 0, read);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭流
            try {
                if (null != bufferStream) bufferStream.close();
                if (null != zipStream) {
                    zipStream.flush();
                    zipStream.close();
                }
                if (null != zipSource) zipSource.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        if (zipFile.exists()) {
            download.downFile(response, zipFileName, strZipPath);
            zipFile.delete();
        }
    }
    @GetMapping(value = "/user/downsinglesong")
    public void downSongSingle(HttpServletResponse response,
                               Integer id) {
        Song song = songService.getOneDetail(id);
        Info info = song.getInfo();
        Singer singer = song.getSinger();
        info.setInfo_down(info.getInfo_down() + 1);
        infoService.save(info);
        singer.setSupport(singer.getSupport() + 1);
        singerService.save(singer);
        String[] temp = song.getSong_file().split("\\.");
        String name = song.getSong_name() + '.' + temp[temp.length - 1];
        String path = "D:/MUSICRESOURCE/yinpin/" + song.getSong_file();
        File file = new File(path);
        if (file.exists()) {
            download.downFile(response, name, path);
        }
    }
    @GetMapping("/guest/playAll")
    public String playAll(ModelMap modelMap,HttpSession session) {
        List<Song> playlist = (List<Song>) redisService.get("newMusices");
        addSupport(playlist);
        modelMap.addAttribute("playlist", playlist);
        User user= (User) session.getAttribute("user");
        if(user!=null){
            String key="user"+""+user.getId();
            List<Song> recentPlay= (List<Song>) redisService.get(key);
            for(int i=0;i<playlist.size(); i++){
                Song song = playlist.get(i);
                if(!recentPlay.contains(song)){
                    recentPlay.add(song);
                }
                if(recentPlay.size()>=101)
                    recentPlay.remove(0);
            }
            redisService.set(key,recentPlay);
        }
        return "play";
    }
    @GetMapping("/user/recentallplay")
    public String recentAllPlay(ModelMap modelMap,HttpSession session){
        User user= (User) session.getAttribute("user");
        if(user!=null){
            String key="user"+user.getId();
            List<Song> playlist = (List<Song> ) redisService.get(key);
            modelMap.addAttribute("playlist",playlist);
            addSupport(playlist);
        }
        return "play";
    }
    @GetMapping("/guest/playSheet")
    public String playSheet(ModelMap modelMap, Integer sheetId,
                            HttpSession session) {
        SongSheet songSheet = songSheetService.findById(sheetId);
        songSheet.setPlayCount(songSheet.getPlayCount()+1);
        songSheetService.save(songSheet);
        List<Song> playlist = new ArrayList<>();
        List<SheetDetail> sheetDetails = songSheet.getDetails();
        if (sheetDetails != null)
            for (int i = 0; i < sheetDetails.size(); i++) {
                playlist.add(sheetDetails.get(i).getSong());
            }
        addSupport(playlist);
        modelMap.addAttribute("playlist", playlist);
        User user= (User) session.getAttribute("user");
        if(user!=null){
            String key="user"+""+user.getId();
            List<Song> recentPlay= (List<Song>) redisService.get(key);
            for(int i=0;i<playlist.size(); i++){
                Song song = playlist.get(i);
                if(!recentPlay.contains(song)){
                    recentPlay.add(song);
                }
                if(recentPlay.size()>=101)
                    recentPlay.remove(0);
            }
            redisService.set(key,recentPlay);
        }
        return "play";
    }
    @GetMapping("/guest/playAlbum")
    public String playAlbum(ModelMap modelMap, Integer albumId,
                            HttpSession session) {
        Album album = albumService.findByAlbumId(albumId);
        List<Song> playlist = new ArrayList<>();
        List<AlbumDetail> albumDetails = album.getDetails();
        if (albumDetails != null)
            for (int i = 0; i < albumDetails.size(); i++) {
                playlist.add(albumDetails.get(i).getSong());
            }
        addSupport(playlist);
        modelMap.addAttribute("playlist", playlist);
        User user= (User) session.getAttribute("user");
        if(user!=null){
            String key="user"+""+user.getId();
            List<Song> recentPlay= (List<Song>) redisService.get(key);
            for(int i=0;i<playlist.size(); i++){
                Song song = playlist.get(i);
                if(!recentPlay.contains(song)){
                    recentPlay.add(song);
                }
                if(recentPlay.size()>=101)
                    recentPlay.remove(0);
            }
            redisService.set(key,recentPlay);
        }
        return "play";
    }
    @GetMapping("/guest/playAllRank")
    public String playAllRank(ModelMap modelMap, Integer[] ids,
                              HttpSession session) {
        List<Song> playlist = new ArrayList<>();
        for (int i = 0; i < ids.length; i++) {
            playlist.add(songService.getOneDetail(ids[i]));
        }
        addSupport(playlist);
        modelMap.addAttribute("playlist", playlist);
        User user= (User) session.getAttribute("user");
        if(user!=null){
            String key="user"+""+user.getId();
            List<Song> recentPlay= (List<Song>) redisService.get(key);
            for(int i=0;i<playlist.size(); i++){
                Song song = playlist.get(i);
                if(!recentPlay.contains(song)){
                    recentPlay.add(song);
                }
                if(recentPlay.size()>=101)
                    recentPlay.remove(0);
            }
            redisService.set(key,recentPlay);
        }
        return "play";
    }
    @RequestMapping("/guest/playSong")
    public String play(HttpSession httpSession, Integer id,
                       ModelMap modelMap,HttpSession session){
        List<Song> playlist=indexService.setPlaySong(httpSession,id);
        modelMap.addAttribute("playlist",playlist);
        User user= (User) session.getAttribute("user");
        if(user!=null){
            String key="user"+""+user.getId();
            List<Song> recentPlay= (List<Song>) redisService.get(key);
            for(int i=0;i<playlist.size(); i++){
                Song song = playlist.get(i);
                int flag=1;
                for (Song value : recentPlay) {
                    if (value.getSongId().equals(song.getSongId())) {
                        flag = 0;
                        break;
                    }
                }
                if(flag!=0){
                    recentPlay.add(song);
                }
                if(recentPlay.size()>=101)
                    recentPlay.remove(0);
            }
            redisService.set(key,recentPlay);
        }
        return "play";
    }
    @GetMapping("/guest/playsingerall")
    public String playSingerAll(ModelMap modelMap,Integer singerId,
                                HttpSession session){
        List<Song> playlist=songService.findAllbySingerId(singerId);
        addSupport(playlist);
        modelMap.addAttribute("playlist",playlist);
        User user= (User) session.getAttribute("user");
        if(user!=null){
            String key="user"+""+user.getId();
            List<Song> recentPlay= (List<Song>) redisService.get(key);
            for(int i=0;i<playlist.size(); i++){
                Song song = playlist.get(i);
                if(!recentPlay.contains(song)){
                    recentPlay.add(song);
                }
                if(recentPlay.size()>=101)
                    recentPlay.remove(0);
            }
            redisService.set(key,recentPlay);
        }
        return "play";
    }
    public void addSupport(List<Song> playlist){
        for (int i = 0; i < playlist.size(); i++) {
            Song song = playlist.get(i);
            Singer singer=song.getSinger();
            singer.setSupport(singer.getSupport()+1);
            singerService.save(singer);
            Info info = song.getInfo();
            info.setInfo_plays(info.getInfo_plays() + 1);
            infoService.save(info);
        }
    }
    @GetMapping("/user/tocomment")
    @ResponseBody
    public String toComment(String text,Integer songId,HttpSession
            session){
        User user= (User) session.getAttribute("user");
        Comment comment=new Comment();
        comment.setComment_text(text);
        comment.setComment_user(user.getId());
        comment.setCommentDate(new Date());
        comment.setSongId(songId);
        comment.setSupport(0);
        commentService.save(comment);
        return "评论成功";
    }
    @GetMapping("/guest/getlyric")
    @ResponseBody
    public String getLyric(String path) throws IOException {
        List<String> temp= Files.readAllLines(Paths.get("D:/MUSICRESOURCE/lyic/"+path));
        String ans="";
        for (int i = 0; i <temp.size() ; i++) {
            ans+=(temp.get(i)+"\n");
        }
        return ans;
    }
}
