package edu.kdt.hygeia.survey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SurveyController {
	
	@Autowired 
	@Qualifier("surveyservice") 
	SurveyService service; 
	
	@RequestMapping(value="/survey1", method=RequestMethod.GET) 
		public String surveyMain() {
			return "surveyMain"; 
		}

	@RequestMapping(value="/survey2", method=RequestMethod.GET)
		public String surveyDoing() {
			return "surveyDoing"; 
		}

	@RequestMapping(value="/survey3", method=RequestMethod.GET)
		public String surveyResult() {
			return "surveyResult"; 
		}
	
	@RequestMapping(value="/survey3", method=RequestMethod.POST)
		public ModelAndView surveyAction(SurveyDTO dto) { 
			int row = service.saveResult(dto); 
		
			ModelAndView mv = new ModelAndView();
			mv.addObject("result", row);
			mv.setViewName("surveyResultResult"); 
			return mv;
		}
	
	@RequestMapping(value="/survey4", method=RequestMethod.GET) 
		public String surveyResultResult() {
			return "surveyResultResult"; 
		}
	


	// Test 1
	// Test 2
	// Test 3
	// Test 4
	// Test 5
	
}
