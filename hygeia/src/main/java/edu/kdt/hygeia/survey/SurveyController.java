package edu.kdt.hygeia.survey;

import java.util.List;

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
	
	
	
	// 설문 페이지 호출 
	@RequestMapping(value="/survey2", method=RequestMethod.GET)
		public String surveyDoing() {
			return "surveyDoing"; 
		}
	
	
	
	// 설문 페이지로 이동 및 문항들 호출 (원본)(시작) 
	@RequestMapping(value="/survey1", method=RequestMethod.POST)
		public ModelAndView surveyAction20(SurveyDTO dto) { 
		
			// surveycalc 테이블 reset
			service.resetTable(); 
		
			// 설문 문항 로딩 
			SurveyDTO surveydata = service.loadSheet(dto);
				
			ModelAndView mv2 = new ModelAndView();	
			mv2.addObject("survey", surveydata);
			mv2.setViewName("surveyDoing");
			return mv2;
		
	}
	
	// 설문 페이지로 이동 및 문항들 호출 및 DB 스택 값 변경 (답변 별 함수) 
	@RequestMapping(value="/survey1a", method=RequestMethod.POST)
	public ModelAndView surveyAction1a(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue1(dto); 
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}
	
	@RequestMapping(value="/survey1b", method=RequestMethod.POST)
	public ModelAndView surveyAction1b(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성
		service.changeValue1(dto);
		service.changeValue2(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey1c", method=RequestMethod.POST)
	public ModelAndView surveyAction1c(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue3(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey1d", method=RequestMethod.POST)
	public ModelAndView surveyAction1d(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue3(dto);
		service.changeValue4(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey1e", method=RequestMethod.POST)
	public ModelAndView surveyAction1e(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey2a", method=RequestMethod.POST)
	public ModelAndView surveyAction2a(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue4(dto);
		service.changeValue5(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey2b", method=RequestMethod.POST)
	public ModelAndView surveyAction2b(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue5(dto);
		service.changeValue6(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey2c", method=RequestMethod.POST)
	public ModelAndView surveyAction2c(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue1(dto);
		service.changeValue7(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey2d", method=RequestMethod.POST)
	public ModelAndView surveyAction2d(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue5(dto);
		service.changeValue7(dto);
		service.changeValue8(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey2e", method=RequestMethod.POST)
	public ModelAndView surveyAction2e(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}
	
	@RequestMapping(value="/survey3a", method=RequestMethod.POST)
	public ModelAndView surveyAction3a(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue7(dto);
		service.changeValue9(dto);
		service.changeValue10(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey3b", method=RequestMethod.POST)
	public ModelAndView surveyAction3b(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue10(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey3c", method=RequestMethod.POST)
	public ModelAndView surveyAction3c(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue11(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey3d", method=RequestMethod.POST)
	public ModelAndView surveyAction3d(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue6(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey3e", method=RequestMethod.POST)
	public ModelAndView surveyAction3e(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey4a", method=RequestMethod.POST)
	public ModelAndView surveyAction4a(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue1(dto);
		service.changeValue2(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey4b", method=RequestMethod.POST)
	public ModelAndView surveyAction4b(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue2(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey4c", method=RequestMethod.POST)
	public ModelAndView surveyAction4c(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue3(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey4d", method=RequestMethod.POST)
	public ModelAndView surveyAction4d(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue4(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey4e", method=RequestMethod.POST)
	public ModelAndView surveyAction4e(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey5a", method=RequestMethod.POST)
	public ModelAndView surveyAction5a(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue5(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey5b", method=RequestMethod.POST)
	public ModelAndView surveyAction5b(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue6(dto);
		service.changeValue7(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey5c", method=RequestMethod.POST)
	public ModelAndView surveyAction5c(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue8(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey5d", method=RequestMethod.POST)
	public ModelAndView surveyAction5d(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue9(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey5e", method=RequestMethod.POST)
	public ModelAndView surveyAction5e(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey6a", method=RequestMethod.POST)
	public ModelAndView surveyAction6a(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성
		service.changeValue10(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey6b", method=RequestMethod.POST)
	public ModelAndView surveyAction6b(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue11(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey6c", method=RequestMethod.POST)
	public ModelAndView surveyAction6c(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue1(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey6d", method=RequestMethod.POST)
	public ModelAndView surveyAction6d(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue2(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey6e", method=RequestMethod.POST)
	public ModelAndView surveyAction6e(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey7a", method=RequestMethod.POST)
	public ModelAndView surveyAction7a(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue2(dto);
		service.changeValue3(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey7b", method=RequestMethod.POST)
	public ModelAndView surveyAction7b(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue4(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey7c", method=RequestMethod.POST)
	public ModelAndView surveyAction7c(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue5(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey7d", method=RequestMethod.POST)
	public ModelAndView surveyAction7d(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue11(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey7e", method=RequestMethod.POST)
	public ModelAndView surveyAction7e(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey8a", method=RequestMethod.POST)
	public ModelAndView surveyAction8a(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue5(dto);
		service.changeValue6(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey8b", method=RequestMethod.POST)
	public ModelAndView surveyAction8b(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue6(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey8c", method=RequestMethod.POST)
	public ModelAndView surveyAction8c(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue7(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey8d", method=RequestMethod.POST)
	public ModelAndView surveyAction8d(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue11(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey8e", method=RequestMethod.POST)
	public ModelAndView surveyAction8e(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey9a", method=RequestMethod.POST)
	public ModelAndView surveyAction9a(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue8(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey9b", method=RequestMethod.POST)
	public ModelAndView surveyAction9b(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue9(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey9c", method=RequestMethod.POST)
	public ModelAndView surveyAction9c(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue10(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey9d", method=RequestMethod.POST)
	public ModelAndView surveyAction9d(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue11(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey9e", method=RequestMethod.POST)
	public ModelAndView surveyAction9e(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey10a", method=RequestMethod.POST)
	public ModelAndView surveyAction10a(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue1(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey10b", method=RequestMethod.POST)
	public ModelAndView surveyAction10b(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue2(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey10c", method=RequestMethod.POST)
	public ModelAndView surveyAction10c(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue3(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey10d", method=RequestMethod.POST)
	public ModelAndView surveyAction10d(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue4(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey10e", method=RequestMethod.POST)
	public ModelAndView surveyAction10e(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey11a", method=RequestMethod.POST)
	public ModelAndView surveyAction11a(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue5(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey11b", method=RequestMethod.POST)
	public ModelAndView surveyAction11b(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue6(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey11c", method=RequestMethod.POST)
	public ModelAndView surveyAction11c(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue8(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey11d", method=RequestMethod.POST)
	public ModelAndView surveyAction11d(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue9(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey11e", method=RequestMethod.POST)
	public ModelAndView surveyAction11e(SurveyDTO dto) { 
	
		// 설문 문항 로딩 
		SurveyDTO surveydata = service.loadSheet(dto);
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		ModelAndView mv2 = new ModelAndView();	
		mv2.addObject("survey", surveydata);
		mv2.setViewName("surveyDoing");
		return mv2;
	
	}

	@RequestMapping(value="/survey12a", method=RequestMethod.POST)
	public ModelAndView surveyAction12a(SurveyDTO dto) { 
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue10(dto);
			
		// 결과 확인 페이지 로 이동 
		ModelAndView mv3 = new ModelAndView();	
		mv3.setViewName("surveyCheck");
		return mv3;
	
	}

	@RequestMapping(value="/survey12b", method=RequestMethod.POST)
	public ModelAndView surveyAction12b(SurveyDTO dto) { 
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue6(dto);
			
		// 결과 확인 페이지 로 이동 
		ModelAndView mv3 = new ModelAndView();	
		mv3.setViewName("surveyCheck");
		return mv3;
	
	}

	@RequestMapping(value="/survey12c", method=RequestMethod.POST)
	public ModelAndView surveyAction12c(SurveyDTO dto) { 
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue8(dto);
			
		// 결과 확인 페이지 로 이동 
		ModelAndView mv3 = new ModelAndView();	
		mv3.setViewName("surveyCheck");
		return mv3;
	
	}

	@RequestMapping(value="/survey12d", method=RequestMethod.POST)
	public ModelAndView surveyAction12d(SurveyDTO dto) { 
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue9(dto);
			
		// 결과 확인 페이지 로 이동 
		ModelAndView mv3 = new ModelAndView();	
		mv3.setViewName("surveyCheck");
		return mv3;
	
	}

	@RequestMapping(value="/survey12e", method=RequestMethod.POST)
	public ModelAndView surveyAction12e(SurveyDTO dto) { 
	
		// DB 스택 값 변경 메소드 실행 구문 작성 
		service.changeValue12(dto);
			
		// 결과 확인 페이지 로 이동 
		ModelAndView mv3 = new ModelAndView();	
		mv3.setViewName("surveyCheck");
		return mv3;
		
	}
	
	
	
	// 결과 확인 페이지 호출 
	@RequestMapping(value="/surveyC", method=RequestMethod.GET) 
		public String surveyChecking() { 
			return "surveyCheck"; 
	}
	
	// 결과 확인 페이지 실행 
	@RequestMapping(value="/surveyC", method=RequestMethod.POST)
		public ModelAndView surveyAction15(SurveyDTO dto) { 

		// 설문 결과값 로딩 
		List<SurveyDTO> resultdata = service.loadResult(); 
		
		// 병-추천식재료 정보 로딩 
		List<SurveyDTO> infodata = service.loadInfo();
				
		// 설문 결과값 전송 
		ModelAndView mv4 = new ModelAndView();	
		mv4.addObject("result", resultdata);
		mv4.addObject("info", infodata);
		mv4.setViewName("surveyResult");
		return mv4;
	
	}

	
	
	// 결과 페이지 호출  
	@RequestMapping(value="/survey3", method=RequestMethod.GET)
		public String surveyResult() {
			return "surveyResult"; 
		}
	
	// 결과 저장 
	@RequestMapping(value="/survey3", method=RequestMethod.POST)
		public ModelAndView surveyAction10(SurveyDTO dto) { 
		
			// surveycalc 테이블 reset 
			service.resetTable();		

			// DB에 아이디 존재 여부 확인 
			int checkdata = service.checkDuplication(dto); 
			
			ModelAndView mv = new ModelAndView();
			
			// 아이디 및 의심성인병 저장 
			if (checkdata == 0) { 
				int row = service.saveResult(dto);
				mv.addObject("result", row);
			}
			if (checkdata != 0) {
				int row2 = service.updateResult(dto);
				mv.addObject("result2", row2); 
			}
			
			mv.setViewName("surveyResultResult");
			return mv;
		
		}
	
	// 다시 테스트하기 
	@RequestMapping(value="/survey0", method=RequestMethod.POST)
		public ModelAndView surveyAction0(SurveyDTO dto) {
		
		// surveycalc 테이블 reset
		service.resetTable();
		
		ModelAndView mv0 = new ModelAndView();
		mv0.setViewName("surveyMain");
		return mv0;
		
	}
	
	// 마지막 페이지로 이동하기 
	@RequestMapping(value="/surveynext", method=RequestMethod.POST)
		public ModelAndView surveyActionNext(SurveyDTO dto) { 
		
		// surveycalc 테이블 reset
		service.resetTable();
		
		ModelAndView mv0 = new ModelAndView();
		mv0.setViewName("surveyResultResult");
		return mv0;
		
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
