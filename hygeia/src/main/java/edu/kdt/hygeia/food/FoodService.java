package edu.kdt.hygeia.food;

import java.util.List;

public interface FoodService {
	public List<String> keywordSearch(String keyword) throws Exception;
	public List<FoodDTO> searchFood(String searchWord) throws Exception;
}
