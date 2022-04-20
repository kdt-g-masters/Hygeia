package edu.kdt.hygeia.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ReviewController {
	
	@Autowired
	@Qualifier("reviewservice")
	ReviewService service;
	
	//후기 목록 페이지
	/*
	@RequestMapping("/reviewlist")
	public ModelAndView reviewList() {
		ModelAndView mv = new ModelAndView();
		List<ReviewDTO> list = service.reviewList();
		mv.addObject("reviewlist", list);
		mv.setViewName("reviewlist");
		return mv;
	}
	*/
	
	//후기 페이징 목록 페이지
	@RequestMapping("/reviewlist")
	public ModelAndView reviewPagingList(Criteria cri, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ReviewDTO> list = service.reviewPagingList(cri);
		mv.addObject("reviewlist", list);
		
		HttpSession session = request.getSession();
		String name = "b";
		session.setAttribute("memberInfo", name);
		
		//페이징 인터페이스
		int total = service.reviewTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		mv.addObject("pageMaker", pageMake);
		
		mv.setViewName("reviewlist");
		return mv;
	}
	
	//후기 상세 페이지
	@RequestMapping("/reviewresult")
	public ModelAndView reviewResult(int reviewid) {
		ModelAndView mv = new ModelAndView();
		int count = service.reviewCount(reviewid);
		ReviewDTO reviewresult = service.reviewResult(reviewid);
		mv.addObject("reviewresult", reviewresult);
		mv.setViewName("reviewresult");
		return mv;
	}
	
	//후기 작성 페이지 이동
	@RequestMapping(value = "/reviewinput", method = RequestMethod.GET)
	public ModelAndView reviewInputForm(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String memberid = (String)session.getAttribute("memberInfo");
		mv.addObject("memberid", memberid);
		mv.setViewName("reviewinput");
		return mv;
	}
	
	//후기 작성 완료
	@RequestMapping(value = "/reviewinput", method = RequestMethod.POST)
	public String reviewInput(ReviewDTO dto, RedirectAttributes rttr) {
		service.reviewInput(dto);
		//일회성 데이터 전달
		rttr.addFlashAttribute("result", "input success");
		return "redirect:/reviewlist";
	}
	
	//후기 수정 페이지 이동
	@RequestMapping(value = "/reviewmodify", method = RequestMethod.GET)
	public ModelAndView reviewModifyForm(int reviewid) {
		ModelAndView mv = new ModelAndView();
		ReviewDTO reviewmodify = service.reviewResult(reviewid);
		mv.addObject("reviewmodify", reviewmodify);
		mv.setViewName("reviewmodify");
		return mv;
	}
	
	//후기 수정 완료
	@RequestMapping(value = "/reviewmodify", method = RequestMethod.POST)
	public String reviewModify(ReviewDTO dto, RedirectAttributes rttr) {
		service.reviewModify(dto);
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/reviewlist";
	}
	
	//후기 추천 기능
	@RequestMapping(value = "/reviewrcm", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public int reviewrcm(RcmDTO dto) throws Exception{
		//후기 중복 확인
		int rcmcheck = service.rcmCheck(dto);
		if(rcmcheck == 0) {
			service.rcmInsert(dto);
		}
		else if(rcmcheck == 1) {
			service.rcmDelete(dto);
		}
		return rcmcheck;
	}
	
	//후기 추천수
	@RequestMapping(value = "/rcmcount", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public int reviewrcmCount(int reviewid) {
		int rcmcount = service.rcmCount(reviewid);
		return rcmcount;
	}
}
