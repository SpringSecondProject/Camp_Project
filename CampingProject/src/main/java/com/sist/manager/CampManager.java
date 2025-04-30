package com.sist.manager;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;
@Component
public class CampManager {
	public String CampJsonData(String title) {
		String result="";
		String key="%2B3GDI2HtVF%2B07n8P7V6V%2F63Q21Mh4LTQw%2FO9ghb0%2FL4N4XbE2JdMrUpjUH1%2FojqNxJnSQx9J3o3Z9n0nyyJX0A%3D%3D";
		try {
			String strUrl="https://apis.data.go.kr/B551011/GoCamping/searchList?numOfRows=1&pageNo=1&MobileOS=WIN&MobileApp=camp&serviceKey="+key+"&_type=json&keyword="+URLEncoder.encode(title,"UTF-8");
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
	public String CampImagesData(int cno) {
		String result="";
		String key="%2B3GDI2HtVF%2B07n8P7V6V%2F63Q21Mh4LTQw%2FO9ghb0%2FL4N4XbE2JdMrUpjUH1%2FojqNxJnSQx9J3o3Z9n0nyyJX0A%3D%3D";
		try {
			String strUrl="https://apis.data.go.kr/B551011/GoCamping/imageList?numOfRows=1000&pageNo=1&MobileOS=WIN&MobileApp=images&serviceKey="+key+"&_type=json&contentId="+cno;
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
}
