package com.sist.sist;

import java.io.PrintWriter;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.songlist.SonglistDAO;
import com.sist.songlist.SonglistVO;
import com.sist.train.TrainDAO;
import com.sist.train.TrainVO;

import java.util.*;

import javax.servlet.http.HttpServletResponse;
@Controller
public class SearchController {
   @Autowired
   private TrainDAO tdao;
   @Autowired
   private SonglistDAO sdao;
   @RequestMapping("search.do")
   public String search_main(Model model)
   {
	   return "search/search";
   }
   @RequestMapping(value = "search_music.do", produces = "application/json; charset=utf8")
   public void search_music(String music_Name,Model model,HttpServletResponse res){
	   res.setContentType("text/html;charset=UTF-8"); 
		try{
			String URL = "http://www.melon.com/search/song/index.htm?q=";   //����Ʈ �ּ�
			String subURL = music_Name; // request�� ���޹��� �˻���
			subURL =  URLEncoder.encode(subURL, "UTF-8");
			String endURL="&section=song&searchGnbYn=Y&ipath=srch_form";
			URL = URL + subURL + endURL;    //URL UTF ���ڵ�
			Document doc = Jsoup.connect(URL).get();     //JSOUP�� �̿��� ����Ʈ ���� �� DOM����
			Elements title_elem = doc.select("a.fc_gray");   //�����͸� �̿��� �˻� �� �Ľ�
			Elements artist_elem =doc.select("span.checkEllipsisSongdefaultList a.fc_mgray");
			
			 JSONObject jobj = new JSONObject();
			 JSONArray ja = new JSONArray();
			 int num=0;
			 if(title_elem.size()>=artist_elem.size()){
				 num=artist_elem.size();
			 }else{
				 num =title_elem.size();
			 }
			 for(int i=0;i<num;i++){
				
				 Element title_El=title_elem.get(i);
				 String title = title_El.attr("title");
				 Element artist_El=artist_elem.get(i);
				 String artist = artist_El.text();
/*				 String result = "{\"title\":\""+title+
						 "\",\"artist\":\""+artist+"\"}";*/
				 System.out.println(title+"|"+artist);
				 if(title!=null&&artist!=null){
				 ja.add(title+"|"+artist);
				 }
			 }

			    res.setContentType("application/json; charset=UTF-8");

			    PrintWriter pw = res.getWriter();
			    pw.print(ja.toJSONString());
			    pw.flush();
				
			}catch(Exception e){System.out.println("�˻� ����� �����ϴ�.");}
   }
   
   @RequestMapping(value = "search_artist.do", produces = "application/json; charset=utf8")
   public void search_artist(String artist_Name,Model model,HttpServletResponse res){
	   res.setContentType("text/html;charset=UTF-8"); 
		try{
			String URL = "http://www.melon.com/search/song/index.htm?q=";   //����Ʈ �ּ�
			String subURL = artist_Name; // request�� ���޹��� �˻���
			subURL =  URLEncoder.encode(subURL, "UTF-8");
			String endURL="&section=artist&searchGnbYn=Y&ipath=srch_form";
			URL = URL + subURL + endURL;    //URL UTF ���ڵ�
			Document doc = Jsoup.connect(URL).get();     //JSOUP�� �̿��� ����Ʈ ���� �� DOM����
			Elements title_elem = doc.select("a.fc_gray");   //�����͸� �̿��� �˻� �� �Ľ�
			Elements artist_elem =doc.select("#artistName span a.fc_mgray");
			
			 JSONObject jobj = new JSONObject();
			 JSONArray ja = new JSONArray();
			 int num=0;
			 if(title_elem.size()>=artist_elem.size()){
				 num=artist_elem.size();
			 }else{
				 num =title_elem.size();
			 }
			 for(int i=0;i<num;i++){
				
				 Element title_El=title_elem.get(i);
				 String title = title_El.attr("title");
				 Element artist_El=artist_elem.get(i);
				 String artist = artist_El.text();
/*				 String result = "{\"title\":\""+title+
						 "\",\"artist\":\""+artist+"\"}";*/
				 System.out.println(title+"|"+artist);
				 if(title!=null&&artist!=null){
				 ja.add(title+"|"+artist);
				 }
			 }

			    res.setContentType("application/json; charset=UTF-8");

			    PrintWriter pw = res.getWriter();
			    pw.print(ja.toJSONString());
			    pw.flush();
			}catch(Exception e){System.out.println("�˻� ����� �����ϴ�.");}
   }
   
   @RequestMapping(value = "search_profile.do", produces = "application/json; charset=utf8")
   public void search_profile(String profile_Name,Model model,HttpServletResponse res){
	   res.setContentType("text/html;charset=UTF-8"); 
		try{
			String URL = "http://www.melon.com/search/artist/index.htm?q=";   //����Ʈ �ּ�
			String subURL = profile_Name; // request�� ���޹��� �˻���
			subURL =  URLEncoder.encode(subURL, "UTF-8");
			String endURL="&section=&searchGnbYn=Y&ipath=srch_form";
			URL = URL + subURL + endURL;    //URL UTF ���ڵ�
			Document doc = Jsoup.connect(URL).get();     //JSOUP�� �̿��� ����Ʈ ���� �� DOM����
			Elements poster_elem = doc.select("div.wrap_atist12 a.thumb img");
			Elements artist_elem =doc.select(".atist_info dt a");
			
			 JSONObject jobj = new JSONObject();
			 JSONArray ja = new JSONArray();
			 int num=0;
			 if(poster_elem.size()>=artist_elem.size()){
				 num=artist_elem.size();
			 }else{
				 num =poster_elem.size();
			 }
			 for(int i=0;i<num;i++){
				
				 Element poster_El=poster_elem.get(i);
				 String poster = poster_El.attr("src");
				 Element artist_El=artist_elem.get(i);
				 String artist = artist_El.text();
/*				 String result = "{\"title\":\""+title+
						 "\",\"artist\":\""+artist+"\"}";*/
				 System.out.println(poster+"|"+artist);
				 if(poster!=null&&artist!=null){
				 ja.add(poster+"|"+artist);
				 }
			 }

			    res.setContentType("application/json; charset=UTF-8");

			    PrintWriter pw = res.getWriter();
			    pw.print(ja.toJSONString());
			    pw.flush();
			}catch(Exception e){System.out.println("�˻� ����� �����ϴ�.");}
   }
   @RequestMapping("searchtrain.do")
   public String searchtrain(String id,Model model){
	   List<TrainVO> list=tdao.trainAllData(id);
	   model.addAttribute("list",list);
	   return "mytrain/maketrain";
   }
   @RequestMapping("songlistadd.do")
   public String songlistadd(String id,String no,String song_title,String song_artist,Model model){
	   int train_no=Integer.parseInt(no);
	   sdao.songlistInsert(train_no, id, song_title, song_artist);
	   List<SonglistVO> list=sdao.songListAllData(train_no, id);
	   model.addAttribute("list",list);
	   
	   return "mytrain/songlist";
   }
   
}
