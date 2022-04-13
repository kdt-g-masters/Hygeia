package edu.kdt.hygeia.food;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

@Service("foodTestService")
public class FoodTestService {
    public JSONObject test() throws IOException, ParseException {
        StringBuilder urlBuilder = new StringBuilder("http://211.237.50.150:7080/openapi/2b04e7ada7739de3744b81e941e5ec2942f2b862ebb67895ec6ef7679f537867/json/Grid_20171128000000000572_1/175/175"
                + ""); /*URL*/
          URL url = new URL(urlBuilder.toString());
          HttpURLConnection conn = (HttpURLConnection) url.openConnection();
          conn.setRequestMethod("GET");
          conn.setRequestProperty("Content-type", "application/json");
          System.out.println("Response code: " + conn.getResponseCode());
          BufferedReader rd;
          if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
              rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
          } else {
              rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
          }
          StringBuilder sb = new StringBuilder();
          String line;
          while ((line = rd.readLine()) != null) {
              sb.append(line);
          }
          rd.close();
          conn.disconnect();
          System.out.println(sb.toString());
          
          // 1. 문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성.
          JSONParser parser = new JSONParser();
          // 2. 문자열을 JSON 형태로 JSONObject 객체에 저장. 	
          JSONObject obj = (JSONObject)parser.parse(sb.toString());

          return obj;          
    }
}
