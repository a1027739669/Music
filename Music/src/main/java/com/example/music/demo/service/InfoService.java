package com.example.music.demo.service;

import com.example.music.demo.entity.Info;
import com.example.music.demo.repository.InfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: InfoService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/12/4 11:09
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/12/4 11:09
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class InfoService {
    @Autowired
    private InfoRepository infoRepository;

    public void save(Info info) {
        infoRepository.save(info);
    }
}
