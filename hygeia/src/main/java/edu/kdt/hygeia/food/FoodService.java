package edu.kdt.hygeia.food;

import java.util.List;

public interface FoodService {
	// 키워드가 포함된 상품 제목 조회
	public List<String> keywordSearch(String keyword) throws Exception;
	
	// 검색창의 단어가 포함된 상품 제목 조회
	public List<FoodDTO> searchFood(String searchWord) throws Exception;
}
