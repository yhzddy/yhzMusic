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
 * 处理与歌曲有关的操作
 * */

@Controller
public class SongController {
	
	@Autowired
	 SongService songService;
	
	/*专辑列表页面
	 * 
	 */
	@ResponseBody
	@RequestMapping(value="/ablmlist",method=RequestMethod.GET)
	public Msg getAblmlist(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		//传入查询的页码，以及显示的条数
		PageHelper.startPage(pnumber, 20);
		
		List<SongBean> ablms =songService.getAblmlist();
		//使用pageinfo包装查询的结果，只需要将pageinfo交给页面就行了
		//封装了详细的分页信息，包括了我们查询出来的数据
		PageInfo page = new PageInfo(ablms,5);//5是导航页
		return Msg.success().add("pageInfo", page);
		
	}
	
	
	/*
	 * 修改 更新
	 * */
	@ResponseBody
	@RequestMapping(value="/song/{sId}",method=RequestMethod.PUT)
	public Msg editSong(SongBean songBean) {
		System.out.println(songBean);
		songService.editSong(songBean);
		return Msg.success();
	}
	

	
	/*
	 * 播放次数 下载次数更新
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
	 * 根据歌手名查询
	 * */
	
	@ResponseBody
	@RequestMapping(value="/sername",method=RequestMethod.GET)
	public Msg getSongBySerName(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber,@RequestParam("serName")String serName) {
		PageHelper.startPage(pnumber, 5);
		//startpage后面紧跟的这个查询就是分页查询
		List<SongBean> songBean =songService.getSongBySerName(serName);
		//使用pageinfo包装查询的结果，只需要将pageinfo交给页面就行了
		//封装了详细的分页信息，包括了我们查询出来的数据
		PageInfo page = new PageInfo(songBean,5);//5是传入连续显示的页数
		return Msg.success().add("pageInfo", page);
	}
	
	/*
	 * 根据专辑名查询
	 * */
	
	@ResponseBody
	@RequestMapping(value="/albmname",method=RequestMethod.GET)
	public Msg getSongByAlbmName(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber,@RequestParam("albmName")String albmName) {
		PageHelper.startPage(pnumber, 5);
		//startpage后面紧跟的这个查询就是分页查询
		List<SongBean> songBean =songService.getSongByAlbmName(albmName);
		//使用pageinfo包装查询的结果，只需要将pageinfo交给页面就行了
		//封装了详细的分页信息，包括了我们查询出来的数据
		PageInfo page = new PageInfo(songBean,5);//5是传入连续显示的页数
		return Msg.success().add("pageInfo", page);
	}
	
	
	/*
	 * 根据编辑中id查询
	 * */
	
	@ResponseBody
	@RequestMapping(value="/song/{id}",method=RequestMethod.GET)
	public Msg getSongById(@PathVariable("id")Integer id) {
		SongBean songBean=songService.getSongById(id);
		
		return Msg.success().add("song", songBean);
		
	}

	/*
	 * 删除 value="/delcat/{Id}"
	 * */
	@ResponseBody
	@RequestMapping(value="/song/{Id}",method=RequestMethod.DELETE)
	public Msg delCat(@PathVariable("Id")Integer id) {
		songService.delSong(id);
		return Msg.success();
		
	}
	
	/*
	 * 上传歌曲/songadd
	 * */
	@ResponseBody
	@RequestMapping(value="/songadd",method=RequestMethod.POST)
	public Msg uploadSong(@RequestParam(value="songfile",required = false)MultipartFile songfile,
			@RequestParam(value="imgfile",required = false)MultipartFile imgfile,
			@RequestParam("sName") String sName,@RequestParam("sIntro") String sIntro,@RequestParam("serName") String serName,
			@RequestParam("albmName") String albmName,@RequestParam("cId") Integer cId,HttpServletRequest request) {
		if (!songfile.isEmpty()) {  
            try {  
                // 上传原文件名  
            	String fileName = songfile.getOriginalFilename();
            	String imgName=imgfile.getOriginalFilename();
            	//项目根路径
            	//String path = request.getSession().getServletContext().getRealPath("/");
            	//uploadpath上传文件路径   filepath传入数据库路径  tomcat配置了虚拟路径
            	//G:\jar\apache-tomcat-8.5.31-windows-x64\apache-tomcat-8.5.31\webapps\music-rap\
            	//项目根路径
            	String rootPath="G:\\eclipse-workspace\\music-rap\\src\\main\\webapp/";
            	//String filePath = path+"audio/" +fileName ;
                String sqlPath = "audio/" +fileName ;
                String imgSqlPath="img/" +imgName;
                String filePath =rootPath+sqlPath;
                String imgPath =rootPath+imgSqlPath;
                //System.out.println("打印根的路径"+request.getSession().getServletContext().getRealPath("/audio")+"/"+songfile.getOriginalFilename());
               // System.out.println("打印文件名"+songfile.getOriginalFilename());
                System.out.println("打印歌曲文件上传的路径"+filePath);
                System.out.println("打印封面文件上传的路径"+imgPath);
                File dir=new File(filePath);
                File imgdir=new File(imgPath);
                System.out.println("歌曲文件"+dir);
                System.out.println("封面文件"+imgdir);
                if (!dir.exists()){//如果dir代表的文件不存在，则创建它，
                    dir.mkdirs();//
                }
                if (!imgdir.exists()){//如果dir代表的文件不存在，则创建它，
                    imgdir.mkdirs();//
                }
                Date current_date = new Date();
                
                // 转存音乐文件                 
                try {  
                	songfile.transferTo(dir);
                } catch (Exception e) {  
                    e.printStackTrace(); 
                    System.out.println("转存失败");
                }  
                
             // 转存封面文件                 
                try {  
                	imgfile.transferTo(imgdir);
                } catch (Exception e) {  
                    e.printStackTrace(); 
                    System.out.println("转存失败");
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
                System.out.println("歌曲相关信息"+songbean);
                
                songService.uploadSong(songbean);
                
            	} catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
		return Msg.success();
		
	}
		
	/*
	 * 查询所有歌曲相关属性
	 * */
	@ResponseBody
	@RequestMapping(value="/songs",method = RequestMethod.GET)
	public Msg getAllSong(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		//引入PageHelper分页插件
		//在查询之前只需要调用 传入页码 以及分页大小
		PageHelper.startPage(pnumber, 5);
		//startpage后面紧跟的这个查询就是分页查询
		List<SongBean> songs =songService.getAllSong();
		//使用pageinfo包装查询的结果，只需要将pageinfo交给页面就行了
		//封装了详细的分页信息，包括了我们查询出来的数据
		//增加一个model类型  保存在model的数据都会给带给页面 放在请求域中
		PageInfo page = new PageInfo(songs,5);//5是传入连续显示的页数
		return Msg.success().add("pageInfo", page);
		
			
	}
	//搜索框查询
	@ResponseBody
	@RequestMapping(value="/songSelect",method = RequestMethod.GET)
	public Msg selectLike(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber,@RequestParam("sName") String sName) {
		//引入PageHelper分页插件
		//在查询之前只需要调用 传入页码 以及分页大小
		System.out.println("huoqu"+sName);
		PageHelper.startPage(pnumber, 5);
		//startpage后面紧跟的这个查询就是分页查询
		List<SongBean> songs=songService.selectLike(sName);
		PageInfo page = new PageInfo(songs,5);//5是传入连续显示的页数
		return Msg.success().add("pageInfo", page);
		
	}
	
	/*
	 * 进行排序查询rank1
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value="/songRank",method = RequestMethod.GET)
	public Msg getByRank(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		//引入PageHelper分页插件
		//在查询之前只需要调用 传入页码 以及分页大小
		PageHelper.startPage(pnumber, 5);
		//startpage后面紧跟的这个查询就是分页查询
		List<SongBean> songs =songService.getByRank();
		//使用pageinfo包装查询的结果，只需要将pageinfo交给页面就行了
		//封装了详细的分页信息，包括了我们查询出来的数据
		//增加一个model类型  保存在model的数据都会给带给页面 放在请求域中
		PageInfo page = new PageInfo(songs,5);//5是传入连续显示的页数
		return Msg.success().add("pageInfo", page);
					
	}
	
	/*
	 * 进行排序查询rank2
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value="/songRankTwo",method = RequestMethod.GET)
	public Msg getByRankTwo(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		//引入PageHelper分页插件
		//在查询之前只需要调用 传入页码 以及分页大小
		PageHelper.startPage(pnumber, 5);
		//startpage后面紧跟的这个查询就是分页查询
		List<SongBean> songs =songService.getByRankTwo();
		//使用pageinfo包装查询的结果，只需要将pageinfo交给页面就行了
		//封装了详细的分页信息，包括了我们查询出来的数据
		//增加一个model类型  保存在model的数据都会给带给页面 放在请求域中
		PageInfo page = new PageInfo(songs,5);//5是传入连续显示的页数
		return Msg.success().add("pageInfo", page);
					
	}
	
	/*
	 * 进行排序查询rank3
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value="/songRankThree",method = RequestMethod.GET)
	public Msg getByRankThree(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		//引入PageHelper分页插件
		//在查询之前只需要调用 传入页码 以及分页大小
		PageHelper.startPage(pnumber, 5); //第一页 5页
		//startpage后面紧跟的这个查询就是分页查询
		List<SongBean> songs =songService.getByRankThree();
		//使用pageinfo包装查询的结果，只需要将pageinfo交给页面就行了
		//封装了详细的分页信息，包括了我们查询出来的数据
		//增加一个model类型  保存在model的数据都会给带给页面 放在请求域中
		PageInfo page = new PageInfo(songs,5);//5是传入连续显示的页数
		return Msg.success().add("pageInfo", page);
					
	}
}
