package com.rap.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	//״̬��
	private  int code;
	//��ʾ��Ϣ    100�ɹ� 200ʧ��
	private String msg;
	//�û�Ҫ���ظ������������
	private Map<String,Object> extend=new HashMap<String ,Object>();
	
	
	
	@Override
	public String toString() {
		return "Msg [code=" + code + ", msg=" + msg + ", extend=" + extend + "]";
	}

	public static Msg success() {
		Msg result= new Msg();
		result.setCode(100);
		result.setMsg("����ɹ�");
		return result;
	}
	
	public static Msg fail() {
		Msg result= new Msg();
		result.setCode(200);
		result.setMsg("����ʧ��");
		return result;
	}
	
	public Msg add(String key,Object value) {
		this.getExtend().put(key, value);  //��ǰ����Msg ����getextend�������أ�hashmap����ʵ��map�ӿڵ�extend�� map�ӿڿɵ���put
		return this;						//�����õ�key valueֵ��  ���ص�ǰ����Msg�����Msg
		
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
