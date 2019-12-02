package com.example.music.demo.repository;

import com.example.music.demo.entity.UserCollection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.repository
 * @ClassName: UserCollectionRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/12/2 13:59
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/12/2 13:59
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Repository
public interface UserCollectionRepository extends JpaRepository<UserCollection,Integer> {
    public List<UserCollection> findAllByUserId(Integer userId);
}
