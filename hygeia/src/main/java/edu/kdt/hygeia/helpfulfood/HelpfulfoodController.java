package edu.kdt.hygeia.helpfulfood;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelpfulfoodController {
	
	@Autowired
	@Qualifier("helpfulfoodservice")
	HelpfulfoodService service;
	
	//병에 좋은 식재료 리스트
	@RequestMapping(value = "/helpfulfoodlist", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<HelpfulfoodDTO> helpfulfoodList(int disease_cntntsSn){
		List<HelpfulfoodDTO> list = service.helpfulfoodList(disease_cntntsSn);
		return list;
	}
}
