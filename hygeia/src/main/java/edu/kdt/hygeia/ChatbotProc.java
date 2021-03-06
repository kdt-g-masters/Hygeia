package edu.kdt.hygeia;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.Timestamp;
import java.util.Date;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

import org.json.JSONArray;
import org.json.JSONObject;

public class ChatbotProc {
	public static void main(String args[]) {
		String result = main("생활습관병",
				"https://8gqo56nzsl.apigw.ntruss.com/custom/v1/6821/a7960ec5372a1ef0c47f06b709e720bca8cfe06f1575a86625407b5d4638c568",
				"VXdpS2tVaGxncGtESWlYSXFIRm9kS0dQSnlHUVVCdVE=");
		System.out.println(result);
  }

  public static String main(String voiceMessage, String apiURL, String secretKey) {//질문을 챗봇에게 전달-답변
	  
      String chatbotMessage = "";

      try {
          //String apiURL = "https://ex9av8bv0e.apigw.ntruss.com/custom_chatbot/prod/";

          URL url = new URL(apiURL);

          String message = getReqMessage(voiceMessage); //json으로 변경
          System.out.println("##" + message);

          String encodeBase64String = makeSignature(message, secretKey); // 암호화

          HttpURLConnection con = (HttpURLConnection)url.openConnection();
          con.setRequestMethod("POST");
          con.setRequestProperty("Content-Type", "application/json;UTF-8");
          con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

          // post request
          con.setDoOutput(true);
          DataOutputStream wr = new DataOutputStream(con.getOutputStream());
          wr.write(message.getBytes("UTF-8"));
          wr.flush();
          wr.close();
          int responseCode = con.getResponseCode();

          BufferedReader br;

          if(responseCode==200) { // Normal call
              System.out.println(con.getResponseMessage());

              BufferedReader in = new BufferedReader(
                      new InputStreamReader(
                              con.getInputStream()));
              String decodedString;
              while ((decodedString = in.readLine()) != null) {
                  chatbotMessage = decodedString;
              }
              //chatbotMessage = decodedString;
              in.close();

          } else {  // Error occurred
              chatbotMessage = con.getResponseMessage();
          }
      } catch (Exception e) {
          e.printStackTrace();
    	
      }
      return chatbotMessage;
  }

  public static String makeSignature(String message, String secretKey) { //암호화

      String encodeBase64String = "";

      try {
          byte[] secrete_key_bytes = secretKey.getBytes("UTF-8");

          SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
          Mac mac = Mac.getInstance("HmacSHA256");
          mac.init(signingKey);

          byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
          encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);

          return encodeBase64String;

      } catch (Exception e){
          System.out.println(e);
      }
      //-----------추가------------ 
      System.out.println("\n encodeBase64String : " + encodeBase64String);
      //-----------추가------------  
      return encodeBase64String;
  }

  public static String getReqMessage(String voiceMessage) { //요청 질문을 json으로 변환해주는 메서드

      String requestBody = "";

      try {

          JSONObject obj = new JSONObject();

          long timestamp = new Date().getTime();

          System.out.println("##"+timestamp);

          obj.put("version", "v2");
          obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
//=> userId is a unique code for each chat user, not a fixed value, recommend use UUID. use different id for each user could help you to split chat history for users.

          obj.put("timestamp", timestamp);

          JSONObject bubbles_obj = new JSONObject();

          bubbles_obj.put("type", "text");

          JSONObject data_obj = new JSONObject();
          data_obj.put("description", voiceMessage);

          bubbles_obj.put("type", "text");
          bubbles_obj.put("data", data_obj);

          JSONArray bubbles_array = new JSONArray();
          bubbles_array.put(bubbles_obj);

          obj.put("bubbles", bubbles_array);
          obj.put("event", "send"); // 기본메세지 모드
          //obj.put("event", "open"); // 웰컴메세지 모드 -> 질문무시
          
          requestBody = obj.toString();

      } catch (Exception e){
          System.out.println("## Exception : " + e);
      }  
      return requestBody;
  }
}
