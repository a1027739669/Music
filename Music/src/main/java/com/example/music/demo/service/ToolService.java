package com.example.music.demo.service;

import com.example.music.demo.entity.Song;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: ToolService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/12/6 16:14
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/12/6 16:14
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class ToolService {
    @Autowired
    private static RedisService redisService;

    public static void addRecent(Integer userId, List<Song> playlist){
        String key="user"+""+userId;
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
}
