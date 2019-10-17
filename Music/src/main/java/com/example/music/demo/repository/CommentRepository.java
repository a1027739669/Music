package com.example.music.demo.repository;

import com.example.music.demo.entity.Comment;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

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
public interface CommentRepository extends JpaRepository<Comment,Integer> {
    public List<Comment> findAllBySongId(Integer songId);
}
