package edu.kdt.hygeia.survey;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SurveyController {
	
	@RequestMapping("/survey1")
		public String surveyMain() {
			return "surveyMain"; 
		}

	@RequestMapping("/survey2")
		public String surveyDoing() {
			return "surveyDoing"; 
		}

	@RequestMapping("/survey3")
		public String surveyResult() {
			return "surveyResult"; 
		}


	// Test 1
	// Test 2
	// Test 3
	// Test 4
	// Test 5
	
}
