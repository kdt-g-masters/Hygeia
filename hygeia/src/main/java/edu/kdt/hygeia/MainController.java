package edu.kdt.hygeia;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.kdt.hygeia.disease.DiseaseDTO;
import edu.kdt.hygeia.disease.DiseaseService;
import edu.kdt.hygeia.member.MemberService;

@Controller
public class MainController {
	@Autowired
	@Qualifier("diseaseservice")
	DiseaseService service;
	
	@Autowired
	@Qualifier("searchSTTService")
	SearchSTTService sttService;
	
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
	
	// 음성 파일 업로드
	@RequestMapping(value="/mp3Upload", method=RequestMethod.POST)
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
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public void mypage() {
		/* storage mappers : <select...>  sessionid가 같은 지 확인 후 전달 */
	}
	
	
	/* 나중에 삭제할 것 */ 
	@RequestMapping(value="/template")
	public void template() {	}
}
