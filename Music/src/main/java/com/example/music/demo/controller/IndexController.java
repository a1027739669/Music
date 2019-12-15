package com.example.music.demo.controller;


import java.util.*;
import java.util.concurrent.TimeUnit;

import com.example.music.demo.entity.*;
import com.example.music.demo.repository.UserCollectionRepository;
import com.example.music.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

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
    @Autowired
    private SingerService singerService;
    @Autowired
    private UserService userService;
    @Autowired
    private InfoService infoService;
    @Autowired
    private UserCollectionRepository userCollectionRepository;
    @GetMapping("/guest/index")
    public String randomSheet(ModelMap modelMap) {
        if (redisService.get("randomSheet") != null) {
            List<SongSheet> randomSheet = (List<SongSheet>) redisService.get("randomSheet");
            modelMap.addAttribute("randomSheet", randomSheet);
        } else {
            Random random = new Random(System.currentTimeMillis());
            List<Integer> list = new ArrayList<>();
            Integer size = songSheetService.getSize();
            while (list.size() != 10) {
                Integer temp = random.nextInt(size) + 1;
                if (!list.contains(temp)) {
                    SongSheet songSheet = songSheetService.findById(temp);
                    if (songSheet != null) {
                        list.add(temp);
                    }
                }
            }
            List<SongSheet> temp = songSheetService.getRandomSheet(list);
            redisService.set("randomSheet", temp, (long) 1, TimeUnit.DAYS);
            modelMap.addAttribute("randomSheet", temp);
        }
        if (redisService.get("newMusices") != null) {
            List<Song> newMusices = (List<Song>) redisService.get("newMusices");
            modelMap.addAttribute("newMusices1", newMusices.subList(0, 9));
            modelMap.addAttribute("newMusices2", newMusices.subList(9, 18));
            modelMap.addAttribute("newMusices3", newMusices.subList(18, 27));
            modelMap.addAttribute("newMusices4", newMusices.subList(27, 36));
            modelMap.addAttribute("newMusices5", newMusices.subList(0, 9));
        } else {
            List<Song> newMusices = songService.getNewMusicies();
            redisService.set("newMusices", newMusices, (long) 1, TimeUnit.DAYS);
            modelMap.addAttribute("newMusices1", newMusices.subList(0, 9));
            modelMap.addAttribute("newMusices2", newMusices.subList(9, 18));
            modelMap.addAttribute("newMusices3", newMusices.subList(18, 27));
            modelMap.addAttribute("newMusices4", newMusices.subList(27, 36));
        }
        if (redisService.get("newAlbums") != null) {
            List<Album> newAlbums = (List<Album>) redisService.get("newAlbums");
            modelMap.addAttribute("newAlbums", newAlbums);
        } else {
            List<Album> newAlbums = albumService.getNewAlbums();
            redisService.set("newAlbums", newAlbums, (long) 1, TimeUnit.DAYS);
            modelMap.addAttribute("newAlbums", newAlbums);
        }
        if (redisService.get("hotSearch") != null) {
            List<Song> hotSearch = (List<Song>) redisService.get("hotSearch");
            if (hotSearch.size() >= 5)
                modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
            else
                modelMap.addAttribute("hotSearch", hotSearch);
        } else {
            List<Song> hotSearch = indexService.getMoreSearchMusics();
            redisService.set("hotSearch", hotSearch, (long) 1, TimeUnit.DAYS);
            if (hotSearch.size() >= 5)
                modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
            else
                modelMap.addAttribute("hotSearch", hotSearch);
        }
        if (redisService.get("indexlist1") != null) {
            List<Song> indexlist1 = (List<Song>) redisService.get("indexlist1");
            if (indexlist1.size() >= 3)
                modelMap.addAttribute("indexlist1", indexlist1.subList(0, 3));
            else
                modelMap.addAttribute("indexlist1", indexlist1);
        } else {
            List<Song> indexlist1 = indexService.getMoreSearchMusics();
            redisService.set("indexlist1", indexlist1, (long) 1, TimeUnit.DAYS);
            if (indexlist1.size() >= 3)
                modelMap.addAttribute("indexlist1", indexlist1.subList(0, 3));
            else
                modelMap.addAttribute("indexlist1", indexlist1);
        }
        if (redisService.get("indexlist2") != null) {
            List<Song> indexlist2 = (List<Song>) redisService.get("indexlist2");
            if (indexlist2.size() >= 3)
                modelMap.addAttribute("indexlist2", indexlist2.subList(0, 3));
            else
                modelMap.addAttribute("indexlist2", indexlist2);
        } else {
            List<Song> indexlist2 = indexService.getMoreDownMusics();
            redisService.set("indexlist2", indexlist2, (long) 1, TimeUnit.DAYS);
            if (indexlist2.size() >= 3)
                modelMap.addAttribute("indexlist2", indexlist2.subList(0, 3));
            else
                modelMap.addAttribute("indexlist2", indexlist2);
        }
        if (redisService.get("indexlist3") != null) {
            List<Song> indexlist3 = (List<Song>) redisService.get("indexlist3");
            if (indexlist3.size() >= 3)
                modelMap.addAttribute("indexlist3", indexlist3.subList(0, 3));
            else
                modelMap.addAttribute("indexlist3", indexlist3);
        } else {
            List<Song> indexlist3 = indexService.getNewMusics();
            redisService.set("indexlist3", indexlist3, (long) 1, TimeUnit.DAYS);
            if (indexlist3.size() >= 3)
                modelMap.addAttribute("indexlist3", indexlist3.subList(0, 3));
            else
                modelMap.addAttribute("indexlist3", indexlist3);
        }

        if (redisService.get("indexlist4") != null) {
            List<Song> indexlist4 = (List<Song>) redisService.get("indexlist4");
            Collections.sort(indexlist4, new Comparator<Song>() {
                @Override
                public int compare(Song o1, Song o2) {
                    return -o1.getInfo().getInfo_plays().compareTo(o2.getInfo().getInfo_plays());
                }
            });
            if (indexlist4.size() >= 3)
                modelMap.addAttribute("indexlist4", indexlist4.subList(0, 3));
            else
                modelMap.addAttribute("indexlist4", indexlist4);
        } else {
            List<Song> indexlist4 = songService.findAllByLauguage("英语");
            Collections.sort(indexlist4, new Comparator<Song>() {
                @Override
                public int compare(Song o1, Song o2) {
                    return -o1.getInfo().getInfo_plays().compareTo(o2.getInfo().getInfo_plays());
                }
            });
            redisService.set("indexlist4", indexlist4, (long) 1, TimeUnit.DAYS);
            if (indexlist4.size() >= 3)
                modelMap.addAttribute("indexlist4", indexlist4.subList(0, 3));
            else
                modelMap.addAttribute("indexlist4", indexlist4);
        }

        if (redisService.get("indexlist5") != null) {
            List<Song> indexlist5 = (List<Song>) redisService.get("indexlist5");
            Collections.sort(indexlist5, new Comparator<Song>() {
                @Override
                public int compare(Song o1, Song o2) {
                    return -o1.getInfo().getInfo_plays().compareTo(o2.getInfo().getInfo_plays());
                }
            });
            if (indexlist5.size() >= 3)
                modelMap.addAttribute("indexlist5", indexlist5.subList(0, 3));
            else
                modelMap.addAttribute("indexlist5", indexlist5);
        } else {
            List<Song> indexlist5 = songService.findAllByLauguage("韩语");
            Collections.sort(indexlist5, new Comparator<Song>() {
                @Override
                public int compare(Song o1, Song o2) {
                    return -o1.getInfo().getInfo_plays().compareTo(o2.getInfo().getInfo_plays());
                }
            });
            redisService.set("indexlist5", indexlist5, (long) 1, TimeUnit.DAYS);
            if (indexlist5.size() >= 3)
                modelMap.addAttribute("indexlist5", indexlist5.subList(0, 3));
            else
                modelMap.addAttribute("indexlist5", indexlist5);
        }

        return "index";
    }
    @GetMapping("/guest/search")
    public String search(ModelMap modelMap, String info) {
        modelMap.addAttribute("info", info);
        if (redisService.get("hotSearch") != null) {
            List<Song> hotSearch = (List<Song>) redisService.get("hotSearch");
            if (hotSearch.size() >= 5)
                modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
            else
                modelMap.addAttribute("hotSearch", hotSearch);
        } else {
            List<Song> hotSearch = indexService.getMoreSearchMusics();
            redisService.set("hotSearch", hotSearch, (long) 1, TimeUnit.DAYS);
            if (hotSearch.size() >= 5)
                modelMap.addAttribute("hotSearch", hotSearch.subList(0, 5));
            else
                modelMap.addAttribute("hotSearch", hotSearch);
        }
        return "searchresult";
    }
    @GetMapping("/guest/SRtable")
    public String SRtable(ModelMap modelMap, String info, Integer pageId) {
        Page<Song> results = songService.findAllByInfo(info, pageId);
        if (results.getContent().size() > 0) {
            modelMap.addAttribute("resultList", results);
        }
        modelMap.addAttribute("info", info);
        return "songresult";
    }
    @GetMapping("/guest/singerresult")
    public String singerResult(ModelMap modelMap, String info, Integer pageId) {
        Page<Singer> results = singerService.findAllByInfo(info, pageId);
        if (results.getContent().size() > 0)
            modelMap.addAttribute("resultList", results);
        modelMap.addAttribute("info", info);
        return "singerresult";
    }
    @GetMapping("/guest/albumsearch")
    public String albumResult(ModelMap modelMap, String info, Integer pageId) {
        Page<Album> results = albumService.findAllByInfo(info, pageId);
        if (results.getContent().size() > 0)
            modelMap.addAttribute("resultList", results);
        modelMap.addAttribute("info", info);
        return "albumresult";
    }
    @GetMapping("/guest/sheetsearch")
    public String sheetSearch(ModelMap modelMap, String info, Integer pageId) {
        Page<SongSheet> results = songSheetService.findAllByInfo(info, pageId);
        if (results.getContent().size() > 0)
            modelMap.addAttribute("resultList", results);
        modelMap.addAttribute("info", info);
        return "sheetresult";
    }
    @GetMapping("/guest/userresult")
    public String userResult(ModelMap modelMap, String info, Integer pageId) {
        Page<User> results = userService.findAllByInfo(info, pageId);
        if (results.getContent().size() > 0)
            modelMap.addAttribute("resultList", results);
        modelMap.addAttribute("info", info);
        return "userresult";
    }
    @GetMapping("/guest/playindexrank")
    public String playIndexRank(ModelMap modelMap, Integer id, HttpSession session) {
        List<Song> playlist = (List<Song>) redisService.get("indexlist" + id);
        if (playlist != null)
            addSupport(playlist);
        User user = (User) session.getAttribute("user");
        if (user != null) {
            String key = "user" + "" + user.getId();
            List<Song> recentPlay = (List<Song>) redisService.get(key);
            for (int i = 0; i < playlist.size(); i++) {
                Song song = playlist.get(i);
                if (!recentPlay.contains(song)) {
                    recentPlay.add(song);
                }
                if (recentPlay.size() >= 101)
                    recentPlay.remove(0);
            }
            redisService.set(key, recentPlay);
        }
        if (playlist.size() >= 3)
            modelMap.addAttribute("playlist", playlist.subList(0, 3));
        else
            modelMap.addAttribute("playlist", playlist);
        return "play";
    }
    public void addSupport(List<Song> playlist) {
        for (int i = 0; i < playlist.size(); i++) {
            Song song = playlist.get(i);
            Singer singer = song.getSinger();
            singer.setSupport(singer.getSupport() + 1);
            singerService.save(singer);
            Info info = song.getInfo();
            info.setInfo_plays(info.getInfo_plays() + 1);
            infoService.save(info);
        }
    }
    @GetMapping("/guest/lokeother")
    public String lokeOther(ModelMap modelMap, Integer userId) {
        User user = userService.findById(userId);
        modelMap.addAttribute("user", user);
        List<Song> hotSeatch = (List<Song>) redisService.get("hotSearch");
        modelMap.addAttribute("hotSearch", hotSeatch);
        String key = "user" + userId;
        Integer count = 0;
        List<Song> recentPlay = (List<Song>) redisService.get(key);
        modelMap.addAttribute("recentPlay", recentPlay);
        List<SongSheet> allSongSheet = songSheetService.findAllLikeSheet(user.getId());
        Set<Integer> ans = new HashSet<>();
        for (int i = 0; i < allSongSheet.size(); i++) {
            List<SheetDetail> temp = allSongSheet.get(i).getDetails();
            for (int j = 0; j < temp.size(); j++) {
                ans.add(temp.get(j).getSongId());
            }
        }
        count = ans.size();
        List<SongSheet> myCreate = songSheetService.findMyCreate(user.getId());
        List<UserCollection> myCollection = userCollectionRepository.findAllByUserId(user.getId());
        if (myCreate.size() >= 10)
            modelMap.addAttribute("myCreate", myCreate.subList(0, 10));
        else {
            if (myCreate.size() > 0)
                modelMap.addAttribute("myCreate", myCreate);
        }
        if (myCollection.size() >= 10)
            modelMap.addAttribute("myCollection", myCollection.subList(0, 10));
        else if (myCollection.size() > 0)
            modelMap.addAttribute("myCollection", myCollection);
        return "home";
    }
}
