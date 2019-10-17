package com.example.music.demo.service;

import com.example.music.demo.entity.Comment;
import com.example.music.demo.entity.Song;
import com.example.music.demo.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: DetailService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/16 11:31
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/16 11:31
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class DetailService {
    @Autowired
    private CommentRepository commentRepository;
    public Page<Comment> getSongPages(Integer page,Integer songId){
        Pageable pageable= PageRequest.of(page-1,10, Sort.Direction.DESC,"commentDate");
        List<Comment> commentList=  commentRepository.findAllBySongId(songId);
        int start = (int)pageable.getOffset();
        int end = (start + pageable.getPageSize()) > commentList.size() ? commentList.size() : ( start + pageable.getPageSize());
        Page<Comment> commentPage=new PageImpl<>(commentList.subList(start,end),pageable,commentList.size());
        return commentPage;
    }
}
