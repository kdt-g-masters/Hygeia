package edu.kdt.hygeia.food;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FoodController {

	@Autowired
	@Qualifier("foodservice")
	FoodService foodservice;
	
	// DB 식재료 + api 식재료 리스트
	
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
	
	//식재료 db 상세페이지
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
	
	//테스트
	/*
	@RequestMapping("/food")
	public ModelAndView foodimage(String image) {
		List<FoodDTO> foodimage = foodservice.foodimage(image);
		ModelAndView mv = new ModelAndView();
		mv.addObject("foodimage", foodimage);
		mv.setViewName("foodlist");
		return mv;
	}*/
	
	
	//식재료 api 상세페이지 테스트용
	/*
	@RequestMapping("/foodapi")
		public ModelAndView foodapi(int number) {
			String json = foodservice.foodapi(number);
			ModelAndView mv = new ModelAndView();
			mv.addObject("foodresult", json);
			mv.setViewName("foodapi");
			return mv;
		}*/
}








