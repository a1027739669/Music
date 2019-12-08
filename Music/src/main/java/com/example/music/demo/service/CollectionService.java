package com.example.music.demo.service;

import com.example.music.demo.entity.UserCollection;
import com.example.music.demo.repository.UserCollectionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: CollectionService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/12/5 14:24
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/12/5 14:24
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class CollectionService {
    @Autowired
    private UserCollectionRepository userCollectionRepository;
    public void save(UserCollection userCollection) {
        userCollectionRepository.save(userCollection);
    }
}
