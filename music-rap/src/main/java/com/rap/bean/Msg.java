package com.rap.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	//状态码
	private  int code;
	//提示信息    100成功 200失败
	private String msg;
	//用户要返回给浏览器的数据
	private Map<String,Object> extend=new HashMap<String ,Object>();
	
	
	
	@Override
	public String toString() {
		return "Msg [code=" + code + ", msg=" + msg + ", extend=" + extend + "]";
	}

	public static Msg success() {
		Msg result= new Msg();
		result.setCode(100);
		result.setMsg("处理成功");
		return result;
	}
	
	public static Msg fail() {
		Msg result= new Msg();
		result.setCode(200);
		result.setMsg("处理失败");
		return result;
	}
	
	public Msg add(String key,Object value) {
		this.getExtend().put(key, value);  //当前对象Msg 调用getextend方法返回（hashmap类型实现map接口的extend） map接口可调用put
		return this;						//方法拿到key value值。  返回当前对象Msg，输出Msg
		
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

}
