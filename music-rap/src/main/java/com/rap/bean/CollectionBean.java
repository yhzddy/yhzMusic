package com.rap.bean;

public class CollectionBean {
    private Integer collId;

    private Integer usercId;

    private Integer songcId;
    
    
    private SongBean songBean;

    
    public Integer getCollId() {
        return collId;
    }

    public void setCollId(Integer collId) {
        this.collId = collId;
    }

    public Integer getUsercId() {
        return usercId;
    }

    public void setUsercId(Integer usercId) {
        this.usercId = usercId;
    }

    public Integer getSongcId() {
        return songcId;
    }

    public void setSongcId(Integer songcId) {
        this.songcId = songcId;
    }


	public SongBean getSongBean() {
		return songBean;
	}

	public void setSongBean(SongBean songBean) {
		this.songBean = songBean;
	}
}