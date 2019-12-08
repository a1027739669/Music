package com.example.music.demo.service;

import com.example.music.demo.entity.Comment;
import com.example.music.demo.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: CommentService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/12/6 19:30
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/12/6 19:30
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public List<Comment> allComment() {
        return commentRepository.findAll();
    }

    public void deleteBatch(Integer[] ids) {
        commentRepository.deleteAllByIds(ids);
    }

    public void deleteOne(Integer id) {
        commentRepository.deleteOneById(id);
    }

    public void save(Comment comment) {
        commentRepository.save(comment);
    }
}
