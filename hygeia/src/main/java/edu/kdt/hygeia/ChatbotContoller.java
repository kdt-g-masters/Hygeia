package edu.kdt.hygeia;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatbotContoller {
	@Autowired
	@Qualifier("chatbotservice")
	ChatbotService service;
	
	@RequestMapping("/chatbotrequest")
	public String chatbotinput() {
		return "chatbotrequest";
	}
	
	@RequestMapping("/chatbotresponse")
	public ModelAndView chatbotresponse(String request, String event) {
		ModelAndView mv = new ModelAndView();
		String response = "";
		if(event.equals("입력")) {
			response = service.test(request);
		}
		else if(event.equals("웰컴")) {
			response = service.test(request, "open");
		}
		mv.addObject("response", response);
		mv.setViewName("chatbotresponse");
		return mv;
	}
	
	@RequestMapping("/chatbotajax")
	public String chatbotajax() {
		return "chatbot";
	}
	
	@RequestMapping("/chatbotajax2")
	@ResponseBody
	public String chatbotajax2(String request, String event) {
		System.out.println(event);
		
		String response = "";
		if(event.equals("입력")) {
			response = service.test(request);
		}
		System.out.println("==> ");
		return response;
	}
	
}
