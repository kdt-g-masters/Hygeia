package edu.kdt.hygeia.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
}
