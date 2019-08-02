package com.rap.mapper;

import com.rap.bean.CategoryBean;
import com.rap.bean.CategoryBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CategoryBeanMapper {
    long countByExample(CategoryBeanExample example);

    int deleteByExample(CategoryBeanExample example);

    int deleteByPrimaryKey(Integer catId);

    int insert(CategoryBean record);

    int insertSelective(CategoryBean record);

    List<CategoryBean> selectByExample(CategoryBeanExample example);

    CategoryBean selectByPrimaryKey(Integer catId);

    int updateByExampleSelective(@Param("record") CategoryBean record, @Param("example") CategoryBeanExample example);

    int updateByExample(@Param("record") CategoryBean record, @Param("example") CategoryBeanExample example);

    int updateByPrimaryKeySelective(CategoryBean record);

    int updateByPrimaryKey(CategoryBean record);
}