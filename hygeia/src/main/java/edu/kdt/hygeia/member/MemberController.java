package edu.kdt.hygeia.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("MemberServiceImpl")
	MemberService service;
	
	// 로그인 페이지
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginForm() {}
	
	// 로그인 시도
	@RequestMapping(value="/login", method=RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public String loginAction(HttpServletRequest request, MemberDTO dto) throws Exception {
		MemberDTO loginMemberDTO = service.loginMember(dto);
		
		if(loginMemberDTO != null) {
			// 세션 아이디 가져오기
			HttpSession session = request.getSession();
			session.setAttribute("sessionid", loginMemberDTO.getId());
			return "1";//{\"process\":\"정상로그인\" , \"role\":\"user\"}";	
		}
		else {
			return "2";//"{\"process\":\"비정상로그인\" , \"role\":\"admin\"}";		
		}
	}
	
	// 회원가입 페이지
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinForm() {}
	
	// 회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView joinAction(MemberDTO dto) {
		int row = service.joinMember(dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", row);
		mv.setViewName("joinResult");
		return mv;
	}
	
	// 회원가입 아이디 중복확인 ajax
	@RequestMapping(value="/join/checkid", method=RequestMethod.POST, produces={"application/json; charset=utf-8"})
	@ResponseBody
	public String checkId(String id) {
		boolean result = service.checkId(id);
		if (result == true) {
			return "{\"result\": \"사용 가능한 아이디입니다.\", \"state\": \"available\"}";
		}
		else {			
			return "{\"result\": \"이미 존재하는 아이디 입니다. 다시 입력해주세요.\", \"state\": \"notAvailable\"}";
		}
	}
	
}
