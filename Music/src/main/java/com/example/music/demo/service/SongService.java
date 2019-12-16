package com.example.music.demo.service;


import com.example.music.demo.entity.Info;
import com.example.music.demo.entity.Singer;
import com.example.music.demo.entity.Song;
import com.example.music.demo.entity.UserCollection;
import com.example.music.demo.repository.InfoRepository;
import com.example.music.demo.repository.SongRepository;
import com.example.music.demo.repository.UserCollectionRepository;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: SongService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/16 13:26
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/16 13:26
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class SongService {
    @Autowired
    private SongRepository songRepository;
    @Autowired
    private UserCollectionRepository userCollectionRepository;
    @Autowired
    private InfoRepository infoRepository;

    public List<UserCollection> getMyCollection(Integer id) {

        return userCollectionRepository.findAllByUserId(id);
    }

    public Song getOneDetail(Integer id) {

        return songRepository.getOne(id);
    }

    public List<Song> getNewMusicies() {
        return
                songRepository.getNewMusics();
    }

    public Page<Song> getSongPages(Integer page, Integer singerId) {
        Pageable pageable = PageRequest.of(page - 1, 20);
        List<Song> songList = songRepository.findAllBySingerId(singerId);
        int start = (int) pageable.getOffset();
        int end = Math.min((start + pageable.getPageSize()), songList.size());
        Page<Song> songPage = new PageImpl<>(songList.subList(start, end), pageable, songList.size());
        return songPage;
    }

    public Integer getTotalSongNumber(Integer singerId) {
        return
                songRepository.findAllBySingerId(singerId).size();
    }

    public List<Song> findAllByLabelsLike(String label) {
        return songRepository.findAllBySongLabelLikeAndIsOnlineNot("%" + label + "%",0);
    }

    public List<Song> findAllByLauguage(String language) {
        return songRepository.findAllBySongLanguagesAndIsOnlineNot(language,0);
    }

    public Page<Song> findAllByInfo(String key, Integer page) {
        Pageable pageable = PageRequest.of(page - 1, 60);
        List<Song> songList = songRepository.findAll(this.getWhereClause(key));
        if (songList.size() > 0) {
            for (int i = 0; i < songList.size(); i++) {
                Info info = songList.get(i).getInfo();
                info.setInfo_search(info.getInfo_search() + 1);
                infoRepository.save(info);
            }
            Collections.sort(songList, new Comparator<Song>() {
                @Override
                public int compare(Song o1, Song o2) {
                    return -o1.getInfo().getInfo_plays().compareTo(o2.getInfo().getInfo_plays());
                }
            });
            int start = (int) pageable.getOffset();
            int end = Math.min((start + pageable.getPageSize()), songList.size());
            Page<Song> songPage = new PageImpl<>(songList.subList(start, end), pageable, songList.size());
            return songPage;
        }
        return null;
    }

    public Specification<Song> getWhereClause(String keyword) {
        return new Specification<Song>() {
            @Override
            public Predicate toPredicate(Root<Song> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicates = new ArrayList<>();
                Join<Song, Singer> sroot = root.join("singer", JoinType.LEFT);
                if (StringUtils.isNotBlank(keyword)) {
                    predicates.add(
                            criteriaBuilder.and(
                                    criteriaBuilder.or(
                                            criteriaBuilder.like(root.get("song_name"), "%" + keyword + "%"),
                                            criteriaBuilder.like(sroot.get("singerName"), "%" + keyword + "%")
                                    )
                            )
                    );
                }
                Predicate[] pre = new Predicate[predicates.size()];
                return criteriaQuery.where(predicates.toArray(pre)).getRestriction();
            }
        };
    }

    public List<Song> findAllByIds(Integer[] ids) {
        return
                songRepository.findAllBySongIdIsInAndIsOnlineNot(ids,0);
    }

    public List<Song> findAllbySingerId(Integer singerId) {
        return
                songRepository.findAllBySingerId(singerId);
    }

    public List<Song> findAll() {
        return songRepository.findAll();
    }

    public Song save(Song song) {
        return songRepository.save(song);
    }
}
