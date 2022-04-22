package edu.kdt.hygeia.disease;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.kdt.hygeia.review.ReviewDTO;

@Controller
public class DiseaseController {
	
	@Autowired
	@Qualifier("diseaseservice")
	DiseaseService service;
	
	//병 목록 페이지
	@RequestMapping("/diseaselist")
	public ModelAndView diseaseList() {
		ModelAndView mv = new ModelAndView();
		List<DiseaseDTO> list = service.diseaseList();
		mv.addObject("diseaselist", list);
		mv.setViewName("template2");
		return mv;
	}
	
	//병 상세 페이지
	@RequestMapping("/diseaseresult")
	public ModelAndView diseaseResult(int cntntsSn) {
		ModelAndView mv = new ModelAndView();
		String diseaseresult = service.openAPI(cntntsSn);//open api 정보
		mv.addObject("diseaseresult", diseaseresult);
		mv.setViewName("template3");
		return mv;
	}
	
	//병 리뷰
	@RequestMapping(value = "/diseasereview", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<ReviewDTO> diseaseReview(int disease_cntntsSn){
		List<ReviewDTO> list = service.diseaseReview(disease_cntntsSn);
		return list;
	}
	
	// 키워드가 포함된 병 이름 조회
	@RequestMapping(value="/disease/keywordSearch.do", method=RequestMethod.GET, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String KeywordSearch(String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		if (keyword == null || keyword.equals("")) {
			return null;
		}

		// keyword = keyword.toUpperCase();
		List<String> keywordList = service.keywordSearch(keyword);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		String jsonInfo = jsonObject.toString();
		return jsonInfo;
	}
	
	// 검색창의 단어가 포함된 병 이름 조회
	@RequestMapping(value="/disease/searchDisease.do", produces={"application/json; charset=utf-8"})
	@ResponseBody
	public List<DiseaseDTO> searchDisease(String searchWord, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<DiseaseDTO> diseaseList = service.searchDisease(searchWord);
		return diseaseList;
	}
}
