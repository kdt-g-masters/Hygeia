package edu.kdt.hygeia.food;

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

@Controller
public class FoodController {
	@Autowired
	@Qualifier("foodservice")
	FoodServiceImpl foodservice;
	
	// DB 식재료 + api 식재료 리스트.
	
	@RequestMapping("/foodlist")
	public ModelAndView foodlist() {
		//String json = foodservice.foodapi();//
		List<FoodDTO> list = foodservice.foodlist();
		ModelAndView mv = new ModelAndView();
		//mv.addObject("foodresult", json);//
		mv.addObject("foodlist", list);
		mv.addObject("apifoodlist", list);
		mv.setViewName("foodlist");
		return mv;
	}
	
	//식재료 상세페이지
	@RequestMapping("/food")
	public ModelAndView food(int num) {
		FoodDTO	dto = foodservice.food(num);
		String json = foodservice.foodapi(num);
		ModelAndView mv = new ModelAndView();
		mv.addObject("foodresult", json);
		mv.addObject("fooddto", dto);
		mv.setViewName("food");
		return mv;
	}

	// 키워드가 포함된 상품 제목 조회
	@RequestMapping(value="/food/keywordSearch.do", method=RequestMethod.GET, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String KeywordSearch(String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		if (keyword == null || keyword.equals("")) {
			return null;
		}

		// keyword = keyword.toUpperCase();
		List<String> keywordList = foodservice.keywordSearch(keyword);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		String jsonInfo = jsonObject.toString();
		return jsonInfo;
	}
	
	// 검색창의 단어가 포함된 상품 제목 조회
	@RequestMapping(value="/food/searchFood.do", method=RequestMethod.GET)
	public ModelAndView searchFood(String searchWord, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// String viewName = (String)request.getAttribute("viewName");
		List<FoodDTO> foodList = foodservice.searchFood(searchWord);
		ModelAndView mv = new ModelAndView("searchFood");
		mv.addObject("foodList", foodList);
		mv.addObject("cnt", foodList.size());
		return mv;
	}
	

}