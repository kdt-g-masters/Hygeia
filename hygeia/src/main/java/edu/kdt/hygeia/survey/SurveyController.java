package edu.kdt.hygeia.survey;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SurveyController {
	
	@RequestMapping(value="/survey1", method=RequestMethod.GET) 
		public String surveyMain() {
			return "surveyMain"; 
		}

	@RequestMapping(value="/survey2", method=RequestMethod.GET) 
		public String surveyDoing() {
			return "surveyDoing"; 
		}

	@RequestMapping(value="/survey1", method=RequestMethod.GET) 
		public String surveyResult() {
			return "surveyResult"; 
		}


	// Test 1
	// Test 2
	// Test 3
	// Test 4
	// Test 5
	
}
