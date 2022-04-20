package edu.kdt.hygeia.food;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("fooddao")
public interface FoodDAO {
	
	public List<FoodDTO> foodlist();//
	
	public FoodDTO food(int num);

	public List<String> selectKeywordSearch(String keyword);
	
	public List<FoodDTO> selectFoodBySearchWord(String searchWord);
	

}