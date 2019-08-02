package com.rap.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rap.bean.CategoryBean;
import com.rap.bean.Msg;
import com.rap.bean.SongBean;
import com.rap.service.SongService;

/*
 * ����������йصĲ���
 * */

@Controller
public class SongController {
	
	@Autowired
	 SongService songService;
	
	/*ר���б�ҳ��
	 * 
	 */
	@ResponseBody
	@RequestMapping(value="/ablmlist",method=RequestMethod.GET)
	public Msg getAblmlist(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		//�����ѯ��ҳ�룬�Լ���ʾ������
		PageHelper.startPage(pnumber, 20);
		
		List<SongBean> ablms =songService.getAblmlist();
		//ʹ��pageinfo��װ��ѯ�Ľ����ֻ��Ҫ��pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������
		PageInfo page = new PageInfo(ablms,5);//5�ǵ���ҳ
		return Msg.success().add("pageInfo", page);
		
	}
	
	
	/*
	 * �޸� ����
	 * */
	@ResponseBody
	@RequestMapping(value="/song/{sId}",method=RequestMethod.PUT)
	public Msg editSong(SongBean songBean) {
		System.out.println(songBean);
		songService.editSong(songBean);
		return Msg.success();
	}
	

	
	/*
	 * ���Ŵ��� ���ش�������
	 * */
	@ResponseBody
	@RequestMapping(value="/songtime",method=RequestMethod.PUT)
	public Msg editSongPlayTime(SongBean songBean ) {
		System.out.println(songBean);
		//SongBean songbean=new SongBean();
		//songbean.setsId(sId);
		//songbean.setsPlaytime(sPlaytime);
		songService.editSong(songBean);
		return Msg.success();
	}
	
	/*
	 * ���ݸ�������ѯ
	 * */
	
	@ResponseBody
	@RequestMapping(value="/sername",method=RequestMethod.GET)
	public Msg getSongBySerName(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber,@RequestParam("serName")String serName) {
		PageHelper.startPage(pnumber, 5);
		//startpage��������������ѯ���Ƿ�ҳ��ѯ
		List<SongBean> songBean =songService.getSongBySerName(serName);
		//ʹ��pageinfo��װ��ѯ�Ľ����ֻ��Ҫ��pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������
		PageInfo page = new PageInfo(songBean,5);//5�Ǵ���������ʾ��ҳ��
		return Msg.success().add("pageInfo", page);
	}
	
	/*
	 * ����ר������ѯ
	 * */
	
	@ResponseBody
	@RequestMapping(value="/albmname",method=RequestMethod.GET)
	public Msg getSongByAlbmName(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber,@RequestParam("albmName")String albmName) {
		PageHelper.startPage(pnumber, 5);
		//startpage��������������ѯ���Ƿ�ҳ��ѯ
		List<SongBean> songBean =songService.getSongByAlbmName(albmName);
		//ʹ��pageinfo��װ��ѯ�Ľ����ֻ��Ҫ��pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������
		PageInfo page = new PageInfo(songBean,5);//5�Ǵ���������ʾ��ҳ��
		return Msg.success().add("pageInfo", page);
	}
	
	
	/*
	 * ���ݱ༭��id��ѯ
	 * */
	
	@ResponseBody
	@RequestMapping(value="/song/{id}",method=RequestMethod.GET)
	public Msg getSongById(@PathVariable("id")Integer id) {
		SongBean songBean=songService.getSongById(id);
		
		return Msg.success().add("song", songBean);
		
	}

	/*
	 * ɾ�� value="/delcat/{Id}"
	 * */
	@ResponseBody
	@RequestMapping(value="/song/{Id}",method=RequestMethod.DELETE)
	public Msg delCat(@PathVariable("Id")Integer id) {
		songService.delSong(id);
		return Msg.success();
		
	}
	
	/*
	 * �ϴ�����/songadd
	 * */
	@ResponseBody
	@RequestMapping(value="/songadd",method=RequestMethod.POST)
	public Msg uploadSong(@RequestParam(value="songfile",required = false)MultipartFile songfile,
			@RequestParam(value="imgfile",required = false)MultipartFile imgfile,
			@RequestParam("sName") String sName,@RequestParam("sIntro") String sIntro,@RequestParam("serName") String serName,
			@RequestParam("albmName") String albmName,@RequestParam("cId") Integer cId,HttpServletRequest request) {
		if (!songfile.isEmpty()) {  
            try {  
                // �ϴ�ԭ�ļ���  
            	String fileName = songfile.getOriginalFilename();
            	String imgName=imgfile.getOriginalFilename();
            	//��Ŀ��·��
            	//String path = request.getSession().getServletContext().getRealPath("/");
            	//uploadpath�ϴ��ļ�·��   filepath�������ݿ�·��  tomcat����������·��
            	//G:\jar\apache-tomcat-8.5.31-windows-x64\apache-tomcat-8.5.31\webapps\music-rap\
            	//��Ŀ��·��
            	String rootPath="G:\\eclipse-workspace\\music-rap\\src\\main\\webapp/";
            	//String filePath = path+"audio/" +fileName ;
                String sqlPath = "audio/" +fileName ;
                String imgSqlPath="img/" +imgName;
                String filePath =rootPath+sqlPath;
                String imgPath =rootPath+imgSqlPath;
                //System.out.println("��ӡ����·��"+request.getSession().getServletContext().getRealPath("/audio")+"/"+songfile.getOriginalFilename());
               // System.out.println("��ӡ�ļ���"+songfile.getOriginalFilename());
                System.out.println("��ӡ�����ļ��ϴ���·��"+filePath);
                System.out.println("��ӡ�����ļ��ϴ���·��"+imgPath);
                File dir=new File(filePath);
                File imgdir=new File(imgPath);
                System.out.println("�����ļ�"+dir);
                System.out.println("�����ļ�"+imgdir);
                if (!dir.exists()){//���dir������ļ������ڣ��򴴽�����
                    dir.mkdirs();//
                }
                if (!imgdir.exists()){//���dir������ļ������ڣ��򴴽�����
                    imgdir.mkdirs();//
                }
                Date current_date = new Date();
                
                // ת�������ļ�                 
                try {  
                	songfile.transferTo(dir);
                } catch (Exception e) {  
                    e.printStackTrace(); 
                    System.out.println("ת��ʧ��");
                }  
                
             // ת������ļ�                 
                try {  
                	imgfile.transferTo(imgdir);
                } catch (Exception e) {  
                    e.printStackTrace(); 
                    System.out.println("ת��ʧ��");
                } 
                
                SongBean songbean=new SongBean();
				songbean.setsName(sName);;          
                songbean.setsIntro(sIntro);
                songbean.setsIssuetime(current_date);
                songbean.setsUrl(sqlPath); 
                songbean.setsImgUrl(imgSqlPath);
                songbean.setSerName(serName);
                songbean.setAlbmName(albmName);
                songbean.setcId(cId);
                System.out.println("���������Ϣ"+songbean);
                
                songService.uploadSong(songbean);
                
            	} catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
		return Msg.success();
		
	}
		
	/*
	 * ��ѯ���и����������
	 * */
	@ResponseBody
	@RequestMapping(value="/songs",method = RequestMethod.GET)
	public Msg getAllSong(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		//����PageHelper��ҳ���
		//�ڲ�ѯ֮ǰֻ��Ҫ���� ����ҳ�� �Լ���ҳ��С
		PageHelper.startPage(pnumber, 5);
		//startpage��������������ѯ���Ƿ�ҳ��ѯ
		List<SongBean> songs =songService.getAllSong();
		//ʹ��pageinfo��װ��ѯ�Ľ����ֻ��Ҫ��pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������
		//����һ��model����  ������model�����ݶ��������ҳ�� ������������
		PageInfo page = new PageInfo(songs,5);//5�Ǵ���������ʾ��ҳ��
		return Msg.success().add("pageInfo", page);
		
			
	}
	//�������ѯ
	@ResponseBody
	@RequestMapping(value="/songSelect",method = RequestMethod.GET)
	public Msg selectLike(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber,@RequestParam("sName") String sName) {
		//����PageHelper��ҳ���
		//�ڲ�ѯ֮ǰֻ��Ҫ���� ����ҳ�� �Լ���ҳ��С
		System.out.println("huoqu"+sName);
		PageHelper.startPage(pnumber, 5);
		//startpage��������������ѯ���Ƿ�ҳ��ѯ
		List<SongBean> songs=songService.selectLike(sName);
		PageInfo page = new PageInfo(songs,5);//5�Ǵ���������ʾ��ҳ��
		return Msg.success().add("pageInfo", page);
		
	}
	
	/*
	 * ���������ѯrank1
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value="/songRank",method = RequestMethod.GET)
	public Msg getByRank(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		//����PageHelper��ҳ���
		//�ڲ�ѯ֮ǰֻ��Ҫ���� ����ҳ�� �Լ���ҳ��С
		PageHelper.startPage(pnumber, 5);
		//startpage��������������ѯ���Ƿ�ҳ��ѯ
		List<SongBean> songs =songService.getByRank();
		//ʹ��pageinfo��װ��ѯ�Ľ����ֻ��Ҫ��pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������
		//����һ��model����  ������model�����ݶ��������ҳ�� ������������
		PageInfo page = new PageInfo(songs,5);//5�Ǵ���������ʾ��ҳ��
		return Msg.success().add("pageInfo", page);
					
	}
	
	/*
	 * ���������ѯrank2
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value="/songRankTwo",method = RequestMethod.GET)
	public Msg getByRankTwo(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		//����PageHelper��ҳ���
		//�ڲ�ѯ֮ǰֻ��Ҫ���� ����ҳ�� �Լ���ҳ��С
		PageHelper.startPage(pnumber, 5);
		//startpage��������������ѯ���Ƿ�ҳ��ѯ
		List<SongBean> songs =songService.getByRankTwo();
		//ʹ��pageinfo��װ��ѯ�Ľ����ֻ��Ҫ��pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������
		//����һ��model����  ������model�����ݶ��������ҳ�� ������������
		PageInfo page = new PageInfo(songs,5);//5�Ǵ���������ʾ��ҳ��
		return Msg.success().add("pageInfo", page);
					
	}
	
	/*
	 * ���������ѯrank3
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value="/songRankThree",method = RequestMethod.GET)
	public Msg getByRankThree(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		//����PageHelper��ҳ���
		//�ڲ�ѯ֮ǰֻ��Ҫ���� ����ҳ�� �Լ���ҳ��С
		PageHelper.startPage(pnumber, 5); //��һҳ 5ҳ
		//startpage��������������ѯ���Ƿ�ҳ��ѯ
		List<SongBean> songs =songService.getByRankThree();
		//ʹ��pageinfo��װ��ѯ�Ľ����ֻ��Ҫ��pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������
		//����һ��model����  ������model�����ݶ��������ҳ�� ������������
		PageInfo page = new PageInfo(songs,5);//5�Ǵ���������ʾ��ҳ��
		return Msg.success().add("pageInfo", page);
					
	}
}
