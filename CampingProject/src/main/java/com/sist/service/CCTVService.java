package com.sist.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.sist.vo.CCTVVO;

@Service
public class CCTVService {
    private final String API_KEY = "e4a2c119132949c385a1f0950f0e093a";

    public CCTVVO getNearestCCTV(double mapx, double mapy) {
    	
        String url = "https://openapi.its.go.kr:9443/cctvInfo";
        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url)
            .queryParam("apiKey", API_KEY)
            .queryParam("type", "all")
            .queryParam("cctvType", "1")
            .queryParam("minX", mapx - 0.1)
            .queryParam("maxX", mapx + 0.1) 
            .queryParam("minY", mapy - 0.1)
            .queryParam("maxY", mapy + 0.1)
            .queryParam("getType", "json");

        RestTemplate rest = new RestTemplate();
        String json = rest.getForObject(builder.toUriString(), String.class);

        return parseNearestCCTV(json, mapx, mapy);
    }

    private CCTVVO parseNearestCCTV(String json, double mapx, double mapy) {
        CCTVVO nearest = null;
        double minDist = Double.MAX_VALUE;

        try {
        	 JSONParser parser = new JSONParser();
             JSONObject obj = (JSONObject) parser.parse(json);
             JSONObject response = (JSONObject) obj.get("response");

             if (response == null || response.get("data") == null) {
                 //System.out.println("CCTV API 응답에 data 없음");
                 return null;
             }

             JSONArray arr = (JSONArray) response.get("data");

            for (Object o : arr) {
                JSONObject c = (JSONObject) o;
                double cx = Double.parseDouble(c.get("coordx").toString());
                double cy = Double.parseDouble(c.get("coordy").toString());

                double dist = Math.pow(mapx - cx, 2) + Math.pow(mapy - cy, 2);
                if (dist < minDist) {
                    minDist = dist;
                    nearest = new CCTVVO();
                    nearest.setCctvformat((String) c.get("cctvformat"));
                    nearest.setCctvname((String) c.get("cctvname"));
                    nearest.setCctvurl((String) c.get("cctvurl"));
                    nearest.setCoordx(cx);
                    nearest.setCoordy(cy);
                } 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       
       // System.out.println(json);
        return nearest;
    }
}
