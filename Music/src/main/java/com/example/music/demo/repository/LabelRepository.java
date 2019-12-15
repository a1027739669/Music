package com.example.music.demo.repository;

import com.example.music.demo.entity.Label;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.repository
 * @ClassName: LabelRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 11:54
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 11:54
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Repository
@Transactional
public interface LabelRepository extends JpaRepository<Label,Integer> {
    public Label getLabelById(Integer id);
    public List<Label> findAll();
    @Query(nativeQuery = true,value = "select  * from label where "
            +
            "label_name=:labelName")
    public Label findLabelByLabel_name(String labelName);
    public void deleteLabelByIdIn(Integer [] ids);
}
