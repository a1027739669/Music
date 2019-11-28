package com.example.music.demo.repository;

import com.example.music.demo.entity.AlbumDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.repository
 * @ClassName: AlbumDetailRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/26 14:11
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/26 14:11
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Repository
public interface AlbumDetailRepository extends JpaRepository<AlbumDetail,Integer> {
}
