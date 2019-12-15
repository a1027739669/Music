package com.example.music.demo.repository;

import com.example.music.demo.entity.Comment;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.repository
 * @ClassName: CommentRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/16 11:34
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/16 11:34
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Repository
@Transactional
public interface CommentRepository extends JpaRepository<Comment,Integer> {
    @Query(nativeQuery = true,value = "select * from comment where" +
            " song_id=:songId order by comment_date desc ")
    public List<Comment> findAllBySongId(Integer songId);
    @Query(value = "delete from comment where comment_id in (?1)",
            nativeQuery = true)
    @Modifying
    public void deleteAllByIds( Integer[] ids);
    @Query(value = "delete from comment where comment_id=:id",
            nativeQuery = true)
    @Modifying
    public void deleteOneById(Integer id);
}
