package com.example.music.demo.service;

import com.example.music.demo.entity.Label;
import com.example.music.demo.repository.LabelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: LabelService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/20 12:11
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/20 12:11
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class LabelService {
    @Autowired
    private LabelRepository labelRepository;

    public Label getLabelById(Integer labelId) {
        return
                labelRepository.getLabelById(labelId);
    }

    public List<Label> findAll(){
        return
                labelRepository.findAll();
    }

    public Label findByLabelName(String labelname) {
        return
                labelRepository.findLabelByLabel_name(labelname);
    }

    public void save(Label label) {

        labelRepository.save(label);
    }

    public void deleteById(Integer labelId) {

        labelRepository.deleteById(labelId);
    }

    public void deleteByIds(Integer[] ids) {

        labelRepository.deleteLabelByIdIn(ids);
    }
}
