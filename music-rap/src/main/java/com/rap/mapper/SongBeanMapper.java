package com.rap.mapper;

import com.rap.bean.SongBean;
import com.rap.bean.SongBeanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SongBeanMapper {
    long countByExample(SongBeanExample example);

    int deleteByExample(SongBeanExample example);

    int deleteByPrimaryKey(Integer sId);

    int insert(SongBean record);

    int insertSelective(SongBean record);

    List<SongBean> selectByExample(SongBeanExample example);

    SongBean selectByPrimaryKey(Integer sId);
    
    List<SongBean> selectByExampleWithCat(SongBeanExample example);

    SongBean selectByPrimaryKeyWithCat(Integer sId);
    
    List<SongBean> selectByExampleWithRankOne(SongBeanExample example);
    
    List<SongBean> selectByExampleWithRankTwo(SongBeanExample example);
    
    List<SongBean> selectByExampleWithRankThree(SongBeanExample example);
    
    List<SongBean> selectByExampleWithLike(SongBeanExample example);
    
    List<SongBean> selectByExampleWithAblm(SongBeanExample example);
    

    int updateByExampleSelective(@Param("record") SongBean record, @Param("example") SongBeanExample example);

    int updateByExample(@Param("record") SongBean record, @Param("example") SongBeanExample example);

    int updateByPrimaryKeySelective(SongBean record);

    int updateByPrimaryKey(SongBean record);

	
}