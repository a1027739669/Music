package com.example.music.demo.service;

import com.example.music.demo.entity.Song;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.service
 * @ClassName: RedisService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 11:41
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 11:41
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class RedisService {
    @Resource
    RedisTemplate<String,Object> redisTemplate;
    @Autowired
    private IndexService indexService;
    public void set(String key,Object value){
//        redisTemplate.setKeySerializer(new StringRedisSerializer());
        ValueOperations<String,Object> vo=redisTemplate.opsForValue();
        vo.set(key, value);
    }
    public void set(String key, Object value, Long time, TimeUnit unit){
//        redisTemplate.setKeySerializer(new StringRedisSerializer());
        ValueOperations<String,Object> vo=redisTemplate.opsForValue();
        vo.set(key,value,time,unit);
    }

    public Object get(String key){
        ValueOperations<String,Object> vo=redisTemplate.opsForValue();
        return vo.get(key);
    }

    public void remove(String key){
       redisTemplate.delete(key);
    }

    public List<Song> getHotSearch() {
        if (this.get("hotSearch") != null) {
            List<Song> hotSearch = (List<Song>) this.get("hotSearch");
            if (hotSearch.size() >= 5)
                return hotSearch.subList(0,5);
            else
                return hotSearch;
        } else {
            List<Song> hotSearch = indexService.getMoreSearchMusics();
            this.set("hotSearch", hotSearch, (long) 1, TimeUnit.DAYS);
            if (hotSearch.size() >= 5)
               return hotSearch.subList(0,5);
            else
                return hotSearch;
        }
    }
}
