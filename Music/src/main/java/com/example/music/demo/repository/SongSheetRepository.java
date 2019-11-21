package com.example.music.demo.repository;

import com.example.music.demo.entity.SongSheet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.repository
 * @ClassName: SongSheetRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/14 16:27
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/14 16:27
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Repository
public interface SongSheetRepository extends JpaRepository<SongSheet,Integer> {
    public List<SongSheet> findByIdIn(List<Integer> numbers);
    public SongSheet findSongSheetById(Integer id);
    @Query(nativeQuery = true,value = "select  c.* from songsheet c  order by support desc ")
    public List<SongSheet> findAll1();
    @Query(nativeQuery = true,value = "select  c.* from songsheet c  order by create_date desc ")
    public List<SongSheet> findAll2();
}
