package edu.kdt.hygeia.disease;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import edu.kdt.hygeia.review.ReviewDTO;

@Service("diseaseservice")
public class DiseaseServiceImpl implements DiseaseService{
	
	@Autowired
	@Qualifier("diseasedao")
	DiseaseDAO dao;
	
	@Override
	public List<DiseaseDTO> diseaseList() {
		return dao.diseaseList();
	}

	@Override
	public DiseaseDTO diseaseResult(int cntntsSn) {
		return dao.diseaseResult(cntntsSn);
	}

	@Override
	public String openAPI(int cntntsSn) {
		BufferedReader br = null;
        String result = "";//결과변수 선언
        try{ 
        	//open api url부분
            String urlstr = "https://www.kdca.go.kr/api/provide/healthInfo?TOKEN=17ff7dc7a425&cntntsSn=" + cntntsSn;
            URL url = new URL(urlstr);
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            urlconnection.setRequestMethod("GET");
            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            String line;
            while((line = br.readLine()) != null) {
                result = result + line + "\n";
            }
            
        }catch(Exception e){
        	//에러 표시
            System.out.println(e.getMessage());
        }
        //xml파일 json 형태로 변환하는 곳
        JSONObject jsonresult = XML.toJSONObject(result);
        return jsonresult.toString();//String 리턴
	}

	/*
	@Override
	public List<ReviewDTO> diseaseReview(int cntntsSn) {
		return dao.diseaseReview(cntntsSn);
	}
	*/
}
