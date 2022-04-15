package edu.kdt.hygeia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.kdt.hygeia.disease.DiseaseDTO;
import edu.kdt.hygeia.disease.DiseaseService;
import edu.kdt.hygeia.member.MemberService;

@Controller
public class MainController {
	@Autowired
	@Qualifier("diseaseservice")
	DiseaseService service;
	
	// 메인 화면
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView start() {
		ModelAndView mv = new ModelAndView();
		List<DiseaseDTO> list = service.diseaseList();
		mv.addObject("diseaseList", list);
		mv.setViewName("index");
		return mv;
	}
	
	// 메인 화면
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		List<DiseaseDTO> list = service.diseaseList();
		mv.addObject("diseaseList", list);
		mv.setViewName("index");
		return mv;
	}
}
