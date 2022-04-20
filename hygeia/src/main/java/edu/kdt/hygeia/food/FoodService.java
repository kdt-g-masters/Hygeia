package edu.kdt.hygeia.food;

import java.util.List;

public interface FoodService {
	// open api 식재료.
	public String foodapi(int number);
	
	// db 식재료 리스트
	public List<FoodDTO> foodlist();
	
	// db 식재료 상세페이지
	public FoodDTO food(int num);
	
	// 키워드가 포함된 상품 제목 조회
	public List<String> keywordSearch(String keyword) throws Exception;
	
	// 검색창의 단어가 포함된 상품 제목 조회
	public List<FoodDTO> searchFood(String searchWord) throws Exception;
	
	
}