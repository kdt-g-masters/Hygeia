package edu.kdt.hygeia.food;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("foodservice")
public class FoodServiceImpl implements FoodService {

	@Autowired
	FoodDAO foodDAO;
	
	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list = foodDAO.selectKeywordSearch("%"+keyword+"%");
		return list;
	}
	
	public List<FoodDTO> searchFood(String searchWord) throws Exception{
		List<FoodDTO> foodList = foodDAO.selectFoodBySearchWord("%"+searchWord+"%");
		return foodList;
	}
}
