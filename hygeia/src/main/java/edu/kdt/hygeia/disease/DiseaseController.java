package edu.kdt.hygeia.disease;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.kdt.hygeia.review.ReviewDTO;

@Controller
public class DiseaseController {
	
	@Autowired
	@Qualifier("diseaseservice")
	DiseaseService service;
	
	//병 목록 페이지
	@RequestMapping("/diseaselist")
	public ModelAndView diseaseList() {
		ModelAndView mv = new ModelAndView();
		List<DiseaseDTO> list = service.diseaseList();
		mv.addObject("diseaselist", list);
		mv.setViewName("diseaselist");
		return mv;
	}
	
	//병 상세 페이지
	@RequestMapping("/diseaseresult")
	public ModelAndView diseaseResult(int cntntsSn) {
		ModelAndView mv = new ModelAndView();
		String diseaseresult = service.openAPI(cntntsSn);//open api 정보
		mv.addObject("diseaseresult", diseaseresult);
		mv.setViewName("diseaseresult");
		return mv;
	}
	
	//병 리뷰
	/*
	@RequestMapping(value = "/diseasereview", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<ReviewDTO> diseaseReview(int cnttnsSn){
		List<ReviewDTO> list = service.diseaseReview(cnttnsSn);
		return list;
	}*/
}
