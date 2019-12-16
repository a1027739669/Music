package com.example.music.demo.controller;

import java.io.File;
import java.io.IOException;

import com.example.music.demo.entity.*;
import com.example.music.demo.service.*;
import com.example.music.demo.tools.UploadFile;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3AudioHeader;
import org.jaudiotagger.audio.mp3.MP3File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.text.Collator;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class BackIndexController {
    @Autowired
    private UserService userService;
    @Autowired
    private SingerService singerService;
    @Autowired
    private LabelService labelService;
    @Autowired
    private CommentService commandService;
    @Autowired
    private SongService songService;
    @Autowired
    private AlbumService albumService;
    @Autowired
    private InfoService infoService;
    @Autowired
    private AlbumDetailService albumDetailService;
    private UploadFile uploadFile = new UploadFile();

    @GetMapping("/back/userlist")
    public String userList(ModelMap modelMap) {
        List<User> userList = userService.findWithNotSuper();
        Collections.reverse(userList);
        modelMap.addAttribute("userList", userList);
        return "back/userlist";
    }

    @GetMapping("/back/singerlist")
    public String singerlist(ModelMap modelMap) {
        List<Singer> singerList = singerService.findSingerWithIdNotZero();
        Collections.reverse(singerList);
        modelMap.addAttribute("singerList", singerList);
        List<Label> labelList = labelService.findAll();
        modelMap.addAttribute("labelList", labelList);
        return "back/singerlist";
    }

    @GetMapping("/back/prohibition")
    @ResponseBody
    public String prohibition(Integer userId) {
        User user = userService.findById(userId);
        user.setIsAlive(0);
        userService.saveUser(user);
        return "ok";
    }

    @GetMapping("/back/unsealing")
    @ResponseBody
    public String unsealing(Integer userId) {
        System.out.println(userId);
        User user = userService.findById(userId);
        user.setIsAlive(1);
        userService.saveUser(user);
        return "ok";
    }

    @GetMapping("/back/editsinger")
    public String editsinger(ModelMap modelMap) {
        List<Label> labelList = labelService.findAll();
        modelMap.addAttribute("labelList", labelList);
        return "back/addsinger";
    }

    @GetMapping("/back/modifysinger")
    public String modifysinger(ModelMap modelMap, Integer singerId) {
        List<Label> labelList = labelService.findAll();
        modelMap.addAttribute("labelList", labelList);
        Singer singer = singerService.getSingerById(singerId);
        modelMap.addAttribute("singer", singer);
        List<String> singerLabels = Arrays.asList(singer.getLabels().split(","));
        modelMap.addAttribute("singerLabels", singerLabels);
        return "back/modifysinger";
    }

    @GetMapping("/back/delete")
    @ResponseBody
    public String delete() {
        return "权限不足";
    }


    @GetMapping("/back/commentlist")
    public String commentList(ModelMap modelMap) {
        List<Comment> commentList = commandService.allComment();
        modelMap.addAttribute("commentList", commentList);
        return "back/commentlist";
    }

    @PostMapping("/back/deleteComment")
    @ResponseBody
    public String deleteComment(Integer[] ids) {
        commandService.deleteBatch(ids);
        return "ok";
    }

    @GetMapping("/back/deleteCom")
    @ResponseBody
    public String deleteCom(Integer id) {
        commandService.deleteOne(id);
        return "删除成功";
    }

    @GetMapping("/back/songlist")
    public String songList(ModelMap modelMap) {
        List<Song> songList = songService.findAll();
        modelMap.addAttribute("songList", songList);
        return "back/songlist";
    }

    @GetMapping("/back/addsong")
    public String addSong(ModelMap modelMap) {
        List<Label> labelList = labelService.findAll();
        List<Singer> singerList = singerService.findAll();
        Comparator<Object> comparator = Collator.getInstance(Locale.CHINA);
        Collections.sort(singerList, (e1, e2) -> {
            return comparator.compare(e1.getSingerName(), e2.getSingerName());
        });

        List<Album> albumList = albumService.findAll();
        Collections.sort(albumList, (e1, e2) -> {
            return comparator.compare(e1.getAlbumName(), e2.getAlbumName());
        });
        modelMap.addAttribute("albumlist", albumList);
        modelMap.addAttribute("singerList", singerList);
        modelMap.addAttribute("labelList", labelList);
        return "back/addsong";
    }

    @PostMapping("/back/modifysinger")
    @ResponseBody
    public String modifySinger(MultipartFile file, String singerName, String birthday,
                               String introduction, String country, String sex,
                               String[] labels) throws ParseException, IOException {
        Singer singer = new Singer();
        singer.setSingerName(singerName);
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
        singer.setBirthday(date);
        singer.setIntroduction(introduction);
        singer.setCountry(country);
        singer.setSingerImg(uploadFile.uploadFile(file));
        singer.setSex(sex);
        String label = "";
        for (int i = 0; i < labels.length; i++) {
            label += labels[i] + ',';
        }
        singer.setLabels(label);
        singer.setSupport(1);

        return singerService.save(singer);
    }


    @GetMapping("/back/modifysong")
    public String modifySong(ModelMap modelMap, Integer songId) {
        List<Label> labelList = labelService.findAll();
        List<Singer> singerList = singerService.findAll();
        Comparator<Object> comparator = Collator.getInstance(Locale.CHINA);
        Collections.sort(singerList, (e1, e2) -> {
            return comparator.compare(e1.getSingerName(), e2.getSingerName());
        });

        List<Album> albumList = albumService.findAll();
        Collections.sort(albumList, (e1, e2) -> {
            return comparator.compare(e1.getAlbumName(), e2.getAlbumName());
        });
        modelMap.addAttribute("albumlist", albumList);
        modelMap.addAttribute("singerList", singerList);
        modelMap.addAttribute("labelList", labelList);
        Song song = songService.getOneDetail(songId);
        modelMap.addAttribute("song", song);
        List<String> songLabels = Arrays.asList(song.getSongLabel().split(","));
        modelMap.addAttribute("songLabels", songLabels);
        return "back/modifysong";
    }

    @PostMapping("/back/changesinger")
    @ResponseBody
    public String modifySinger(MultipartFile file, String singerName, String birthday,
                               String introduction, String country, String sex,
                               String[] labels, Integer singerId) throws ParseException, IOException {
        Singer singer = singerService.getSingerById(singerId);
        singer.setSingerName(singerName);
        Pattern pattern = Pattern.compile("-?[1-9]\\d*");
        Matcher matcher = pattern.matcher(birthday);
        birthday = "";
        while (matcher.find()) {
            birthday += matcher.group() + '-';
        }
        birthday = birthday.substring(0, birthday.length() - 1);
        Date date = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINA).parse(birthday);
        singer.setBirthday(date);
        singer.setIntroduction(introduction);
        singer.setCountry(country);
        if (file != null)
            singer.setSingerImg(uploadFile.uploadFile(file));
        singer.setSex(sex);
        String label = "";
        for (int i = 0; i < labels.length; i++) {
            label += labels[i] + ',';
        }
        singer.setLabels(label);
        singerService.save2(singer);
        return "修改成功";
    }

    @PostMapping("/back/tomodifysong")
    @ResponseBody
    public String toModifySong(MultipartFile file1, MultipartFile file2, MultipartFile
            file3,
                               String songname, Integer singerId,
                               String languages, String release, Integer albumId,
                               String[] labels, Integer songId)
            throws IOException, ParseException {
        Song song = songService.getOneDetail(songId);
        song.setSong_name(songname);
        song.setSongSinger(singerId);
        if (file3 != null) {
            String songfilename = uploadFile.uploadFileToMp3(file3);
            song.setSong_file(songfilename);
            File file = new File("D:/MUSICRESOURCE/yinpin/" + songfilename);
            try {
                MP3File f = (MP3File) AudioFileIO.read(file);
                MP3AudioHeader audioHeader = (MP3AudioHeader) f.getAudioHeader();
                int temp = audioHeader.getTrackLength();
                String songtime = "0";
                songtime += (int) (temp / 60) + ":";
                songtime += (int) (temp % 60);
                song.setSong_time(songtime);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        song.setSongLanguages(languages);
        Pattern pattern = Pattern.compile("-?[1-9]\\d*");
        Matcher matcher = pattern.matcher(release);
        release = "";
        while (matcher.find()) {
            release += matcher.group() + '-';
        }
        release = release.substring(0, release.length() - 1);
        Date date = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINA).parse(release);
        song.setSong_release(date);
        if (file1 != null) {
            song.setSong_img(uploadFile.uploadFile(file1));
        }
        if (file2 != null) {
            song.setSong_lyrics(uploadFile.uploadFileToLyric(file2));
        }
        song.setAlbum_id(albumId);
        String label = "";
        for (int i = 0; i < labels.length; i++) {
            label += labels[i] + ',';
        }
        song.setSongLabel(label);
        songService.save(song);
        return "修改成功";
    }

    @GetMapping("/back/albumlist")
    public String albumList(ModelMap modelMap) {
        List<Album> albumList = albumService.findAll();
        modelMap.addAttribute("albumList", albumList);
        return "back/albumlist";
    }

    @GetMapping("/back/addalbum")
    public String addalbum(ModelMap modelMap) {
        List<Label> labelList = labelService.findAll();
        List<Singer> singerList = singerService.findAll();
        modelMap.addAttribute("labelList", labelList);
        Comparator<Object> comparator = Collator.getInstance(Locale.CHINA);
        Collections.sort(singerList, (e1, e2) -> {
            return comparator.compare(e1.getSingerName(), e2.getSingerName());
        });
        modelMap.addAttribute("singerList", singerList);
        return "back/addalbum";
    }

    @PostMapping("/back/toaddsong")
    @ResponseBody
    public String toaddsong(MultipartFile file1, MultipartFile file2, MultipartFile file3,
                            String songname, Integer singerId,
                            String languages, String release, Integer albumId,
                            String[] labels) throws IOException, ParseException {

        Song song = new Song();
        song.setSong_name(songname);
        song.setSongSinger(singerId);
        String songfilename = uploadFile.uploadFileToMp3(file3);
        song.setSong_file(songfilename);
        File file = new File("D:/MUSICRESOURCE/yinpin/" + songfilename);
        try {
            MP3File f = (MP3File) AudioFileIO.read(file);
            MP3AudioHeader audioHeader = (MP3AudioHeader) f.getAudioHeader();
            int temp = audioHeader.getTrackLength();
            String songtime = "0";
            songtime += (int) (temp / 60) + ":";
            songtime += (int) (temp % 60);
            song.setSong_time(songtime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        song.setSongLanguages(languages);
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(release);
        song.setSong_release(date);
        song.setSong_img(uploadFile.uploadFile(file1));
        if (file2 == null) {
            song.setSong_lyrics("暂无歌词");
        } else {
            song.setSong_lyrics(uploadFile.uploadFileToLyric(file2));
        }
        song.setAlbum_id(albumId);
        song.setIsOnline(1);
        String label = "";
        for (int i = 0; i < labels.length; i++) {
            label += labels[i] + ',';
        }
        song.setSongLabel(label);

        Song song1 = songService.save(song);
        Info info = new Info();
        info.setInfo_search(0);
        info.setInfo_down(0);
        info.setInfo_plays(0);
        info.setSongId(song1.getSongId());
        infoService.save(info);
        song1.setInfo(info);
        AlbumDetail albumDetail = new AlbumDetail();
        albumDetail.setSongId(song1.getSongId());
        albumDetail.setAlbumId(albumId);
        albumDetailService.saveAlbumDetail(albumDetail);
        return "添加成功";
    }

    @PostMapping("/back/toaddalbum")
    @ResponseBody
    public String toAddAlbum(MultipartFile file, String albumname, Integer singerId,
                             String release, String[] labels, String introduction)
            throws IOException, ParseException {
        Album album = new Album();
        String albumImg = uploadFile.uploadFile(file);
        album.setAlbum_img(albumImg);
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(release);
        album.setAlbum_release(date);
        album.setAlbum_singer(singerId);
        album.setAlbumName(albumname);
        album.setIntroduction(introduction);
        String label = "";
        for (int i = 0; i < labels.length; i++) {
            label += labels[i] + ',';
        }
        album.setLabels(label);
        albumService.save(album);
        return "添加成功";
    }

    @GetMapping("/back/modifyalbum")
    public String modifyAlbum(Integer albumId, ModelMap modelMap) {
        List<Label> labelList = labelService.findAll();
        List<Singer> singerList = singerService.findAll();
        modelMap.addAttribute("labelList", labelList);
        Comparator<Object> comparator = Collator.getInstance(Locale.CHINA);
        Collections.sort(singerList, (e1, e2) -> {
            return comparator.compare(e1.getSingerName(), e2.getSingerName());
        });
        modelMap.addAttribute("singerList", singerList);
        Album album = albumService.findByAlbumId(albumId);
        modelMap.addAttribute("album", album);
        List<String> albumLabels = Arrays.asList(album.getLabels().split(","));
        modelMap.addAttribute("albumLabels", albumLabels);
        return "back/modifyalbum";
    }

    @PostMapping("/back/tomodifyalbum")
    @ResponseBody
    public String toModifyAlbum(MultipartFile file, String albumname, Integer
            singerId, String release, String[] labels, String introduction, Integer albumId)
            throws IOException, ParseException {
        Album album = albumService.findByAlbumId(albumId);
        album.setIntroduction(introduction);
        album.setAlbumName(albumname);
        album.setAlbum_singer(singerId);
        Pattern pattern = Pattern.compile("-?[1-9]\\d*");
        Matcher matcher = pattern.matcher(release);
        release = "";
        while (matcher.find()) {
            release += matcher.group() + '-';
        }
        release = release.substring(0, release.length() - 1);
        Date date = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINA).parse(release);
        album.setAlbum_release(date);
        if (file != null) {
            album.setAlbum_img(uploadFile.uploadFile(file));
        }
        String label = "";
        for (int i = 0; i < labels.length; i++) {
            label += labels[i] + ',';
        }
        album.setLabels(label);
        albumService.save(album);
        return "修改成功";
    }

    @GetMapping("/back/labellist")
    public String labelList(ModelMap modelMap) {
        List<Label> labelList = labelService.findAll();
        modelMap.addAttribute("labellist", labelList);
        return "back/labellist";
    }

    @GetMapping("/back/addlabel")
    public String addlabel() {
        return "back/addlabel";
    }

    @PostMapping("/back/toaddlabel")
    @ResponseBody
    public String toAddLabel(String labelname) {
        Label label = labelService.findByLabelName(labelname);
        if (label != null)
            return "标签已存在";
        else {
            label = new Label();
            label.setLabel_name(labelname);
            labelService.save(label);
            return "添加成功";
        }
    }

    @GetMapping("/back/modifylabel")
    public String modifyLabel(ModelMap modelMap, Integer labelId) {
        Label label = labelService.getLabelById(labelId);
        modelMap.addAttribute("label", label);
        return "back/modifylabel";
    }

    @PostMapping("/back/tomodifylabel")
    @ResponseBody
    public String toModifyLabel(Integer labelId, String labelname) {
        Label label = labelService.getLabelById(labelId);
        label.setLabel_name(labelname);
        labelService.save(label);
        return "修改成功";
    }

    @GetMapping("/back/deletelabel")
    @ResponseBody
    public String deleteLabel(Integer labelId) {
        labelService.deleteById(labelId);
        return "删除成功";
    }

    @PostMapping("/back/deletelabels")
    @ResponseBody
    public String deletelabels(Integer[] ids) {
        labelService.deleteByIds(ids);
        return "ok";
    }

    @GetMapping("/back/login")
    public String backLosin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            if (user.getIs_super() == 1) {
                session.removeAttribute("user");
            }
        }
        return "back/login";
    }

    @PostMapping("/back/tologin")
    @ResponseBody
    public String tologing(String username, String password, HttpSession session) {
        User user = userService.findByUserName(username);
        if (user == null) {
            user = userService.findByPhone(username);
            if (user == null) {
                return "用户不存在";
            } else if (!user.getPassword().equals(password))
                return "密码不正确";
            else {
                if (user.getIs_super().equals(1))
                    session.setAttribute("user", user);
                else
                    return "权限不足";
            }
        } else {
            if (!user.getPassword().equals(password))
                return "密码不正确";
            else {
                if (user.getIs_super().equals(1))
                    session.setAttribute("user", user);
                else
                    return "权限不足";
            }
        }
        return "OK";
    }

    @GetMapping("/back/index")
    public String toIndex(ModelMap modelMap) {
        return "back/backindex";
    }

}
