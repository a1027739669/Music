package com.example.music.demo.service;

import com.example.music.demo.entity.User;
import com.example.music.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: UserService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/8 8:01
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/8 8:01
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    public User getUser(String username,String password){
        User user=userRepository.findByUsernameAndPassword(username, password);
        if(user!=null){
            if(user.getIsAlive()==1)
                return user;
        }
        return null;
    }

    public User findByUserName(String username) {
        return userRepository.findUserByUsername(username);
    }

    public User findByPhone(String username) {
        return userRepository.findByMobile(username);
    }
}
