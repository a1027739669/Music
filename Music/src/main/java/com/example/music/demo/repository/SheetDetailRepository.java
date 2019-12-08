package com.example.music.demo.repository;

import com.example.music.demo.entity.SheetDetail;
import com.example.music.demo.entity.Song;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.repository
 * @ClassName: SheetDetailRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/14 16:28
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/14 16:28
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Repository
public interface SheetDetailRepository extends JpaRepository<SheetDetail,Integer> {
    public List<SheetDetail> findAllBySheetId(Integer sheetId);

    public SheetDetail findSheetDetailBySongIdAndSheetId(Integer sheetId,Integer songId);
}
