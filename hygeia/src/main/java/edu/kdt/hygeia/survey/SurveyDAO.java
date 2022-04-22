package edu.kdt.hygeia.survey;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("SurveyDAO")
public interface SurveyDAO {
	
	public int saveResult(SurveyDTO dto); 
	
	public SurveyDTO loadSheet(SurveyDTO dto);
	
	public int changeValue1a(SurveyDTO dto); 

}
