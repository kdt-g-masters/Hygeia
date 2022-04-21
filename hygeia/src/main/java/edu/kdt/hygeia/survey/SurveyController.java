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
	@Qualifier("SurveyServiceImpl") 
	SurveyService service; 
	
	
	
	// 메인 페이지 호출 
	@RequestMapping(value="/survey1", method=RequestMethod.GET) 
		public String surveyMain() {
			return "surveyMain"; 
		}
	
	// 설문 페이지로 이동 및 문항들 호출 (원본) 
	@RequestMapping(value="/survey1", method=RequestMethod.POST)
		public ModelAndView surveyAction20(SurveyDTO dto) { 
		
			SurveyDTO surveydata = service.loadSheet(dto);
				
			ModelAndView mv2 = new ModelAndView();	
			mv2.addObject("survey", surveydata);
			mv2.setViewName("surveyDoing");
			return mv2;
		
	}
	
	// 설문 페이지로 이동 및 문항들 호출 및 DB 스택 값 변경 (답변 별 함수) 
	@RequestMapping(value="/survey1a", method=RequestMethod.POST)
	public ModelAndView surveyAction1a(SurveyDTO dto) { 
	
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}
	
	@RequestMapping(value="/survey1b", method=RequestMethod.POST)
	public ModelAndView surveyAction1b(SurveyDTO dto) { 
	
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey1c", method=RequestMethod.POST)
	public ModelAndView surveyAction1c(SurveyDTO dto) { 
	
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey1d", method=RequestMethod.POST)
	public ModelAndView surveyAction1d(SurveyDTO dto) { 
	
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey1e", method=RequestMethod.POST)
	public ModelAndView surveyAction1e(SurveyDTO dto) { 
	
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey2a", method=RequestMethod.POST)
	public ModelAndView surveyAction2a(SurveyDTO dto) { 
	
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey2b", method=RequestMethod.POST)
	public ModelAndView surveyAction2b(SurveyDTO dto) { 
	
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey2c", method=RequestMethod.POST)
	public ModelAndView surveyAction2c(SurveyDTO dto) { 
	
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey2d", method=RequestMethod.POST)
	public ModelAndView surveyAction2d(SurveyDTO dto) { 
	
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey2e", method=RequestMethod.POST)
	public ModelAndView surveyAction2e(SurveyDTO dto) { 
	
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}
	
	

	// 설문 페이지 호출 
	@RequestMapping(value="/survey2", method=RequestMethod.GET)
		public String surveyDoing() {
			return "surveyDoing"; 
		}

	
	
	// 결과 페이지 호출  
	@RequestMapping(value="/survey3", method=RequestMethod.GET)
		public String surveyResult() {
			return "surveyResult"; 
		}
	
	// 결과 저장 
	@RequestMapping(value="/survey3", method=RequestMethod.POST)
		public ModelAndView surveyAction10(SurveyDTO dto) { 
			int row = service.saveResult(dto); 
		
			ModelAndView mv = new ModelAndView();
			mv.addObject("result", row);
			mv.setViewName("surveyResultResult"); 
			return mv;
		}
	
	
	
	// 마지막 페이지 호출 
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
