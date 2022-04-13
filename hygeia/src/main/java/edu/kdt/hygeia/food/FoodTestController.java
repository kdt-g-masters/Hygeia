package edu.kdt.hygeia.food;

import java.io.IOException;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FoodTestController {
	@Autowired
	@Qualifier("foodTestService")
	FoodTestService service;
	
	@RequestMapping("/testFood")
	public ModelAndView testFood() throws IOException, ParseException {
		ModelAndView mv = new ModelAndView();
		mv.addObject("foodData", service.test());
		mv.setViewName("foodTest");
		return mv;
	}
}
