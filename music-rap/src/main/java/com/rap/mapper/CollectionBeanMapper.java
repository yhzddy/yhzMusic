package com.rap.mapper;

import com.rap.bean.CollectionBean;
import com.rap.bean.CollectionBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollectionBeanMapper {
    long countByExample(CollectionBeanExample example);

    int deleteByExample(CollectionBeanExample example);

    int deleteByPrimaryKey(Integer collId);

    int insert(CollectionBean record);

    int insertSelective(CollectionBean record);

    List<CollectionBean> selectByExample(CollectionBeanExample example);
    //通过用户id查询
    List<CollectionBean> selectByExampleWithUserAndSong(Integer usercId);

    CollectionBean selectByPrimaryKey(Integer collId);


    int updateByExampleSelective(@Param("record") CollectionBean record, @Param("example") CollectionBeanExample example);

    int updateByExample(@Param("record") CollectionBean record, @Param("example") CollectionBeanExample example);

    int updateByPrimaryKeySelective(CollectionBean record);

    int updateByPrimaryKey(CollectionBean record);

	
}