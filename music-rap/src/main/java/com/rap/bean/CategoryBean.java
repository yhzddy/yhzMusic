package com.rap.bean;

public class CategoryBean {


	private Integer catId;

    private String catName;

    public Integer getCatId() {
        return catId;
    }

    public void setCatId(Integer catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName == null ? null : catName.trim();
    }
    
    @Override
	public String toString() {
		return "CategoryBean [catId=" + catId + ", catName=" + catName + "]";
	}
}