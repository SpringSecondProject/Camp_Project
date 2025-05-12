package com.sist.manager;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;

import java.net.URLEncoder;
import java.util.*;
import com.sist.vo.*;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.*;
@Component
public class YoutubeManager {
	public String youtubeJsonData(String fd) {
		String result="";
		String key="";
		try {
			String strUrl="https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=4&q="+URLEncoder.encode(fd,"UTF-8")+"&type=video&key="+key;
			URL url=new URL(strUrl);
			HttpURLConnection conn=(HttpURLConnection)url.openConnection();
			StringBuffer sb=new StringBuffer();
			if(conn!=null) {
				BufferedReader in=new BufferedReader(new InputStreamReader(conn.getInputStream()));
				while(true) {
					String s=in.readLine();
					if(s==null) break;
					sb.append(s);
				}
				
				result=sb.toString();
				
				in.close();
				conn.disconnect();
			}
		} catch (Exception e) {}
		return result;
	}
	public List<VideoVO> videoListData(String fd) {
		List<VideoVO> list=new ArrayList<VideoVO>();
		try {
			String json=youtubeJsonData(fd);
			JSONParser jp=new JSONParser();
			JSONObject root=(JSONObject)jp.parse(json);
			JSONArray items=(JSONArray)root.get("items");
			for(int i=0;i<items.size();i++) {
				VideoVO vo=new VideoVO();
				
				JSONObject obj=(JSONObject)items.get(i);
				JSONObject id=(JSONObject)obj.get("id");
				String key=(String)id.get("videoId");
				JSONObject sni=(JSONObject)obj.get("snippet");
				String title=(String)sni.get("title");
				//snippet.thumbnails.default.url
				JSONObject thumbnails=(JSONObject)obj.get("thumbnails");
				
				vo.setVideoid(key);
				vo.setTitle(title);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
