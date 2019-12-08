package com.example.music.demo.service;

import com.example.music.demo.entity.Singer;
import com.example.music.demo.entity.User;
import com.example.music.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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

    public List<User> findWithNotSuper() {
        return userRepository.findWithNotSuper();
    }

    public User findById(Integer userId) {
        return userRepository.findUserById(userId);
    }

    public User saveUser(User user){
        return userRepository.save(user);
    }

    public Page<User> findAllByInfo(String info, Integer pageId) {
        List<User> userList=userRepository.findAllByNichengLike("%"+info+"%");
        Pageable pageable = PageRequest.of(pageId - 1, 60);
        int start = (int) pageable.getOffset();
        int end = (start + pageable.getPageSize()) > userList.size() ? userList.size() : (start + pageable.getPageSize());
        Page<User> userPage= new PageImpl<>(userList.subList(start, end), pageable, userList.size());
        return userPage;
    }

    public List<User> findAll(){
        return userRepository.findAll();
    }

    public User findByTelephone(String telephone) {
        return userRepository.findUserByMobile(telephone);
    }
}
