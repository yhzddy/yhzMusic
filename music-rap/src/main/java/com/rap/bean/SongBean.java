package com.rap.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SongBean {
    private Integer sId;

    @Override
	public String toString() {
		return "SongBean [sId=" + sId + ", sName=" + sName + ", sIntro=" + sIntro + ", sIssuetime=" + sIssuetime
				+ ", sUrl=" + sUrl + ", sPlaytime=" + sPlaytime + ", sDownload=" + sDownload + ", serName=" + serName
				+ ", albmName=" + albmName + ", cId=" + cId ;
	}

	private String sName;

    private String sIntro;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date sIssuetime;

    private String sUrl;

    private String sPlaytime;

    private String sDownload;

    private String serName;

    private String albmName;
    
    private String sImgUrl;

  

	private Integer cId;
    //查询歌曲的同时 分类信息也查询
    private CategoryBean categoryBean;

    public String getsImgUrl() {
  		return sImgUrl;
  	}

  	public void setsImgUrl(String sImgUrl) {
  		this.sImgUrl = sImgUrl;
  	}
    
    public CategoryBean getCategoryBean() {
		return categoryBean;
	}

	public void setCategoryBean(CategoryBean categoryBean) {
		this.categoryBean = categoryBean;
	}

	public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public String getsIntro() {
        return sIntro;
    }

    public void setsIntro(String sIntro) {
        this.sIntro = sIntro == null ? null : sIntro.trim();
    }

    public Date getsIssuetime() {
        return sIssuetime;
    }

    public void setsIssuetime(Date sIssuetime) {
        this.sIssuetime = sIssuetime;
    }

    public String getsUrl() {
        return sUrl;
    }

    public void setsUrl(String sUrl) {
        this.sUrl = sUrl == null ? null : sUrl.trim();
    }

    public String getsPlaytime() {
        return sPlaytime;
    }

    public void setsPlaytime(String sPlaytime) {
        this.sPlaytime = sPlaytime == null ? null : sPlaytime.trim();
    }

    public String getsDownload() {
        return sDownload;
    }

    public void setsDownload(String sDownload) {
        this.sDownload = sDownload == null ? null : sDownload.trim();
    }

    public String getSerName() {
        return serName;
    }

    public void setSerName(String serName) {
        this.serName = serName == null ? null : serName.trim();
    }

    public String getAlbmName() {
        return albmName;
    }

    public void setAlbmName(String albmName) {
        this.albmName = albmName == null ? null : albmName.trim();
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }
}