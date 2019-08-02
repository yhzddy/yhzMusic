package com.rap.bean;

import java.util.Date;

public class UserBean {
    private Integer uId;

    private String uSex;

    private String uPhone;

    private String uName;

    private String uPassword;

    private Date uDate;

    private Integer uRight;

    @Override
	public String toString() {
		return "UserBean [uId=" + uId + ", uSex=" + uSex + ", uPhone=" + uPhone + ", uName=" + uName + ", uPassword="
				+ uPassword + ", uDate=" + uDate + ", uRight=" + uRight + "]";
	}

	public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuSex() {
        return uSex;
    }

    public void setuSex(String uSex) {
        this.uSex = uSex == null ? null : uSex.trim();
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone == null ? null : uPhone.trim();
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName == null ? null : uName.trim();
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword == null ? null : uPassword.trim();
    }

    public Date getuDate() {
        return uDate;
    }

    public void setuDate(Date uDate) {
        this.uDate = uDate;
    }

    public Integer getuRight() {
        return uRight;
    }

    public void setuRight(Integer uRight) {
        this.uRight = uRight;
    }
}