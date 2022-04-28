package edu.kdt.hygeia.review;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView reviewPagingList(Criteria cri, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ReviewDTO> list = service.reviewPagingList(cri);
		mv.addObject("reviewlist", list);
		
		//페이징 인터페이스
		int total = service.reviewTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		mv.addObject("pageMaker", pageMake);
		
		//뒤로가기 버튼으로 목록 페이지 이동 시 조회수 반영
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
		
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
		mv.setViewName("template5");
		return mv;
	}
	
	//후기 작성 페이지 이동
	@RequestMapping(value = "/reviewinput", method = RequestMethod.GET)
	public ModelAndView reviewInputForm(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String memberid = (String)session.getAttribute("sessionid");
		if(memberid != null) {
			mv.addObject("memberid", memberid);
			mv.setViewName("template6");			
		}
		else {
			rttr.addFlashAttribute("result", "warning");
			mv.setViewName("redirect:/login");
		}
		return mv;
	}
	
	//후기 작성 완료
	@RequestMapping(value = "/reviewinput", method = RequestMethod.POST)
	public String reviewInput(ReviewDTO dto, RedirectAttributes rttr, MultipartFile file, HttpServletRequest request) throws Exception {
		//파일 저장 경로
		String savepath = System.getProperty("user.dir") + "\\WEB-INF\\classes\\static\\images\\reviewfiles";
		
		if(!file.isEmpty()) {
			//무작위 이름 만들기(식별자)
			UUID uuid = UUID.randomUUID();
			String filename = uuid + "_" + file.getOriginalFilename();
			
			//파일 저장
			File savefile = new File(savepath, filename);
			file.transferTo(savefile);
			
			//dto에 파일정보 주입
			dto.setFilename(filename);
			dto.setFilepath(savepath);
		}
		else {
			//dto에 null값 주입
			dto.setFilename(null);
			dto.setFilepath(null);
		}
		
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
		mv.setViewName("template7");
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
	
	//후기 추천 보여주기
	@RequestMapping(value = "/reviewrcmview", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public int reviewrcmview(RcmDTO dto) throws Exception{
		int rcmcheck = service.rcmCheck(dto);
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
