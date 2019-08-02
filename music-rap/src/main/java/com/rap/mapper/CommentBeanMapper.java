package com.rap.mapper;

import com.rap.bean.CommentBean;
import com.rap.bean.CommentBeanExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommentBeanMapper {
    long countByExample(CommentBeanExample example);

    int deleteByExample(CommentBeanExample example);

    int deleteByPrimaryKey(Integer cmtId);

    int insert(CommentBean record);

    int insertSelective(CommentBean record);

    List<CommentBean> selectByExample(CommentBeanExample example);

    CommentBean selectByPrimaryKey(Integer cmtId);
    //通过userid songid 查找其他两个表数据
    List<CommentBean> selectByExampleWithUser(CommentBeanExample example);

    CommentBean selectByPrimaryKeyWithUser(Integer cmtId);

    int updateByExampleSelective(@Param("record") CommentBean record, @Param("example") CommentBeanExample example);

    int updateByExample(@Param("record") CommentBean record, @Param("example") CommentBeanExample example);

    int updateByPrimaryKeySelective(CommentBean record);

    int updateByPrimaryKey(CommentBean record);
}