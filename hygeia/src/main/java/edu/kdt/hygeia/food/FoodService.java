package edu.kdt.hygeia.food;

import java.util.List;

public interface FoodService {
	// open api 식재료
	public String foodapi(int number);
	
	// db식재료 리스트
	public List<FoodDTO> foodlist(); 
	// db식재료 관련 상세페이지
	public FoodDTO food(int num);
}
