package com.example.music.demo.repository;

import com.example.music.demo.entity.Singer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.repository
 * @ClassName: SingerRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/8 20:57
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/8 20:57
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Repository
public interface SingerRepository extends JpaRepository<Singer,Integer> {
    public Singer findSingerById(Integer singerId);
}
