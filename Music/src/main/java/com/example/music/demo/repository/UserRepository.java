package com.example.music.demo.repository;

import java.util.Queue;

import com.example.music.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.repository
 * @ClassName: UserRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/17 10:22
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/17 10:22
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    public User findByUsernameAndPassword(String username, String password);
    public User findUserByUsername(String username);
    public User findByMobile(String username);
    @Query(nativeQuery = true, value = "select * from myuser c " +
            "where c.is_super !=1 order by reported desc ")
    public List<User> findWithNotSuper();
    public User findUserById(Integer userId);
    public List<User> findAllByNichengLike(String name);
    public User findUserByMobile(String mobile);
}
