package com.example.music.demo.service;

import com.example.music.demo.entity.Singer;
import com.example.music.demo.repository.SingerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: SingerService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/21 14:23
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/21 14:23
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class SingerService {
    @Autowired
    private SingerRepository singerRepository;
    public Singer getSingerById(Integer singerId){
           return singerRepository.findSingerById(singerId);
    }

}
