package edu.kdt.hygeia;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.kdt.hygeia.disease.DiseaseDTO;
import edu.kdt.hygeia.disease.DiseaseService;
import edu.kdt.hygeia.member.MemberDTO;
import edu.kdt.hygeia.member.MemberService;
import edu.kdt.hygeia.review.ReviewDTO;
import edu.kdt.hygeia.review.ReviewService;
import edu.kdt.hygeia.survey.SurveyDTO;
import edu.kdt.hygeia.survey.SurveyService;

@Controller
public class MainController {
	@Autowired
	@Qualifier("diseaseservice")
	DiseaseService service;

	@Autowired
	@Qualifier("searchSTTService")
	SearchSTTService sttService;

	@Autowired
	@Qualifier("MemberServiceImpl")
	MemberService memberService;

	@Autowired
	@Qualifier("reviewservice")
	ReviewService reviewService;
	
	@Autowired 
	@Qualifier("SurveyServiceImpl") 
	SurveyService surveyService;

	// 메인 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView start() {
		ModelAndView mv = new ModelAndView();
		List<DiseaseDTO> list = service.diseaseList();
		mv.addObject("diseaseList", list);
		mv.setViewName("index");
		return mv;
	}

	// 메인 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		List<DiseaseDTO> list = service.diseaseList();
		mv.addObject("diseaseList", list);
		mv.setViewName("index");
		return mv;
	}

	// 음성 파일 업로드
	@RequestMapping(value = "/mp3Upload", method = RequestMethod.POST)
	@ResponseBody
	public String mp3Upload(MultipartFile file1) throws IOException {
		String fileName = file1.getOriginalFilename(); // csr.mp3
		String path = "c:/kdt-venture/upload/";

		File saveFile = new File(path + fileName);
		file1.transferTo(saveFile);
		return "성공";
	}

	@RequestMapping("/searchSTT")
	@ResponseBody
	// 1. fileName 요청 파라미터를 전달 받기
	// 2. searchSTTService test 전달
	// 3. 값을 리턴 받는다.
	// 4. 요청했던 view로 리턴 받은 값 전달
	public String chatbotSTT(String fileName) {
		String text = sttService.test(fileName);
		return text;
	}
	@RequestMapping("/my")
	public String my(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String memberid = (String)session.getAttribute("sessionid");
		List<ReviewDTO> list = reviewService.reviewList(memberid);
		
		model.addAttribute("reviewlist", list);
		
		// 병-추천식재료 정보
		List<SurveyDTO> infodata = surveyService.loadInfo();
		
		// 설문 결과값
		List<SurveyDTO> resultdata = surveyService.loadResult();
		
		// surveyresult 설문 결과
		SurveyDTO memberResultdata = surveyService.selectMemberSurveyResult(memberid);
		
		model.addAttribute("info", infodata);
		model.addAttribute("result", resultdata);
		model.addAttribute("memberResult", memberResultdata);
		
		return "my";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/editinfo", method = RequestMethod.POST)
	@ResponseBody
	public int editinfo(HttpServletRequest request, MemberDTO dto) {
		int row = memberService.updateMember(dto);
		
		// 수정된 회원 정보 세션에 저장
		if (row == 1) {
			MemberDTO loginMemberDTO = memberService.loginMember(dto);
			HttpSession session = request.getSession();
			session.setAttribute("memberInfo", loginMemberDTO);
		}
		return row;
	}
	
	/* 나중에 삭제할 것 */
	@RequestMapping(value = "/template2")
	public void template() {
	}
}
