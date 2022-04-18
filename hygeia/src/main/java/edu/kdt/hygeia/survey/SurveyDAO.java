package edu.kdt.hygeia.survey;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("surveyDAO")
public interface SurveyDAO {
	
	public int saveResult(SurveyDTO dto); 

}
