package edu.kdt.hygeia.survey;

public interface SurveyService {
	// !!!
	// !!!
	// !!!!!!!!!!!!!!!!
	
	// 설문결과 저장 
	public int saveResult(SurveyDTO dto); 
	
	// 설문문항 불러오기 
	public SurveyDTO loadSheet(SurveyDTO dto);
	
	// DB 스택 값 변경
	public int changeValue1a(SurveyDTO dto); 
		
}
