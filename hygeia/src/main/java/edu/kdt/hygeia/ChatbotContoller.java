package edu.kdt.hygeia;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatbotContoller {
	@Autowired
	@Qualifier("chatbotservice")
	ChatbotService service;
	
//	@RequestMapping("/")
}
