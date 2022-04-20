package edu.kdt.hygeia.helpfulfood;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import edu.kdt.hygeia.food.FoodService;

@Service("helpfulfoodservice")
public class HelpfulfoodServiceImpl implements HelpfulfoodService {
	
	@Autowired
	@Qualifier("helpfulfooddao")
	HelpfulfoodDAO dao;
	
	@Override
	public List<HelpfulfoodDTO> helpfulfoodList(int disease_cntntsSn) {
		return dao.helpfulfoodList(disease_cntntsSn);
	}
	
}
