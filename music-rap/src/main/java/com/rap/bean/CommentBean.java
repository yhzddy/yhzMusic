package com.rap.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CommentBean {
    private Integer cmtId;

    private Integer userId;

    private Integer songId;

    private String cmtContent;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date cmtDate;
    
    //加入userbean属性 通过userid查找user里的用户id 
    private UserBean userBean;
    

    public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	public Integer getCmtId() {
        return cmtId;
    }

    public void setCmtId(Integer cmtId) {
        this.cmtId = cmtId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getSongId() {
        return songId;
    }

    public void setSongId(Integer songId) {
        this.songId = songId;
    }

    public String getCmtContent() {
        return cmtContent;
    }

    public void setCmtContent(String cmtContent) {
        this.cmtContent = cmtContent == null ? null : cmtContent.trim();
    }

    public Date getCmtDate() {
        return cmtDate;
    }

    public void setCmtDate(Date cmtDate) {
        this.cmtDate = cmtDate;
    }
}