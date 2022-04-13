package edu.kdt.hygeia.food;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FoodController {
//test 1
	@RequestMapping(value="/keywordSearch.do", method=RequestMethod.GET, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String KeywordSearch(String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		if (keyword == null || keyword.equals("")) {
			return null;
		}
		
		/*
		// keyword = keyword.toUpperCase();
		List keywordList = service.keywordSearch(keyword);
		JSONObject jsonObject = new JSONObject();
		*/
		return null;
	}
}
