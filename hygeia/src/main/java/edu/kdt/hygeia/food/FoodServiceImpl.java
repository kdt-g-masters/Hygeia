package edu.kdt.hygeia.food;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import edu.kdt.hygeia.review.ReviewDTO;

@Service("foodservice")
public class FoodServiceImpl implements FoodService {

	//	Food db
	
	@Autowired
	@Qualifier("fooddao")
	FoodDAO dao;
	
	//식재료 리스트
	@Override
	public List<FoodDTO> foodlist(){
		return dao.foodlist();
	}

	@Override
	public FoodDTO food(int num) {
		return dao.food(num);
	}
	
	//open api 미완성
	@Override
	public String foodapi(int number) {
		 BufferedReader br = null;
	        String result = "";//결과변수 선언
	        try{
	        	//open api url부분
	            String urlstr = "http://211.237.50.150:7080/openapi/2b04e7ada7739de3744b81e941e5ec2942f2b862ebb67895ec6ef7679f537867/json/Grid_20171128000000000572_1/" + number  +"/"+ number ;
	            URL url = new URL(urlstr);
	            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
	            urlconnection.setRequestMethod("GET");
	            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
	            String line;
	            while((line = br.readLine()) != null) {
	                result = result + line + "\n";
	            }
	            System.out.println(result);
	        }catch(Exception e){
	            System.out.println(e.getMessage());
	        }
	        return result;//String 리턴
	    }
	
	@Override
	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list = dao.selectKeywordSearch("%"+keyword+"%");
		return list;
	}
	
	@Override
	public List<FoodDTO> searchFood(String searchWord) throws Exception{
		List<FoodDTO> foodList = dao.selectFoodBySearchWord("%"+searchWord+"%");
		return foodList;
	}
	
	@Override
	public List<ReviewDTO> foodReview(String title) {
		return dao.foodReview(title);
	}
	
} // end