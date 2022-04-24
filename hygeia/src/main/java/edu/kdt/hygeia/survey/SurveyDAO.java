package edu.kdt.hygeia.survey;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("SurveyDAO")
public interface SurveyDAO {
	
	public int saveResult(SurveyDTO dto); 
	
	public SurveyDTO loadSheet(SurveyDTO dto);
	
	public int changeValue1(SurveyDTO dto); 
	
	public int changeValue2(SurveyDTO dto);
	
	public int changeValue3(SurveyDTO dto);
	
	public int changeValue4(SurveyDTO dto); 
	
	public int changeValue5(SurveyDTO dto); 
	
	public int changeValue6(SurveyDTO dto); 
	
	public int changeValue7(SurveyDTO dto); 
	
	public int changeValue8(SurveyDTO dto); 
	
	public int changeValue9(SurveyDTO dto); 
	
	public int changeValue10(SurveyDTO dto); 
	
	public int changeValue11(SurveyDTO dto); 
	
	public int changeValue12(SurveyDTO dto); 
	
	public List<SurveyDTO> loadResult(); 

}
