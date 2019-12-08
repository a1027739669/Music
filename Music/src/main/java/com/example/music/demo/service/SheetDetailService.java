package com.example.music.demo.service;

import com.example.music.demo.entity.SheetDetail;
import com.example.music.demo.repository.SheetDetailRepository;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: SheetDetailService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/16 12:29
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/16 12:29
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class SheetDetailService {
    @Autowired
    private SheetDetailRepository sheetDetailRepository;
    public List<SheetDetail> findAllBySheetId(Integer sheetId){
        return sheetDetailRepository.findAllBySheetId(sheetId);
    }

    public void save(SheetDetail sheetDetail) {
        sheetDetailRepository.save(sheetDetail);
    }

    public SheetDetail findBySongIdAndSheetId(Integer sheetId, Integer songId) {
    return sheetDetailRepository.findSheetDetailBySongIdAndSheetId(sheetId, songId);
    }
}
