package edu.kdt.hygeia.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	
	@Autowired
	@Qualifier("reviewservice")
	ReviewService service;
	
	@RequestMapping("/reviewlist")
	public ModelAndView reviewlist() {
		ModelAndView mv = new ModelAndView();
		List<ReviewDTO> list = service.reviewlist();
		mv.addObject("reviewlist", list);
		mv.setViewName("reviewlist");
		return mv;
	}
	
	@RequestMapping("/reviewresult")
	public ModelAndView reviewresult(int reviewid) {
		ModelAndView mv = new ModelAndView();
		ReviewDTO reviewresult = service.reviewresult(reviewid);
		mv.addObject("reviewresult", reviewresult);
		mv.setViewName("reviewresult");
		return mv;
	}
	
	@RequestMapping(value = "/reviewinput", method = RequestMethod.GET)
	public String reviewinputform() {
		return "reviewinput";
	}
	
	@RequestMapping(value = "/reviewinput", method = RequestMethod.POST)
	public ModelAndView reviewinput(ReviewDTO dto) {
		int result = service.reviewinput(dto);
		ModelAndView mv = new ModelAndView();
		mv.addObject(result);
		mv.setViewName("reviewlist");
		return mv;
	}
	
}
