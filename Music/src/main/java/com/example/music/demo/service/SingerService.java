package com.example.music.demo.service;

import com.example.music.demo.entity.Album;
import com.example.music.demo.entity.Singer;
import com.example.music.demo.repository.SingerRepository;
import org.dom4j.util.SimpleSingleton;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: SingerService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/21 14:23
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/21 14:23
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class SingerService {
    @Autowired
    private SingerRepository singerRepository;

    public Singer getSingerById(Integer singerId) {
        return singerRepository.findSingerById(singerId);
    }

    public Page<Singer> getSingerList(String country, String sex, String label, Integer pageId) {
        Pageable pageable = PageRequest.of(pageId - 1, 80);
        List<Singer> singerList = new ArrayList<>();
        if (label.equals("全部"))
            singerList = singerRepository.findAll();
        else{
            singerList = singerRepository.findByLabelsLike("%" + label + "%");}
        if (!country.equals("全部")) {
            for (int i = singerList.size() - 1; i >= 0; i--) {
                if (!singerList.get(i).getCountry().equals(country))
                    singerList.remove(i);
            }
        }
        if (!sex.equals("全部")) {
            for (int i = singerList.size() - 1; i >= 0; i--) {
                if (!singerList.get(i).getSex().equals(sex))
                    singerList.remove(i);
            }
        }
        Collections.sort(singerList, new Comparator<Singer>() {
            @Override
            public int compare(Singer o1, Singer o2) {
                return -o1.getSupport().compareTo(o2.getSupport());
            }
        });
        for (int i = singerList.size()-1; i>=0 ; i--) {
            if(singerList.get(i).getId().equals(0))
                singerList.remove(i);
        }
        int start = (int) pageable.getOffset();
        int end = (start + pageable.getPageSize()) > singerList.size() ? singerList.size() : (start + pageable.getPageSize());
        Page<Singer> singerPage = new PageImpl<>(singerList.subList(start, end), pageable, singerList.size());
        return singerPage;
    }

    public List<Singer> findLikes(String label) {
        return singerRepository.findByLabelsLike("%"+label+"%");
    }
}
