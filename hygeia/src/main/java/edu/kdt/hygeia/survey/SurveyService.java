package edu.kdt.hygeia.survey;

import java.util.List;

public interface SurveyService {
	
	// !!!
	// !!!
	// !!!!!!!!!!!!!!!!
	
	// 설문 결과 저장 (insert) 
	public int saveResult(SurveyDTO dto); 
	
	// 설문 결과 저장 2 (update) 
	public int updateResult(SurveyDTO dto);
	
	// 설문 문항 불러오기 
	public SurveyDTO loadSheet(SurveyDTO dto);
	
	// DB 스택 값 변경
	public int changeValue1(SurveyDTO dto); // 고혈압 
	
	public int changeValue2(SurveyDTO dto); // 뇌졸중 
	
	public int changeValue3(SurveyDTO dto); // 당뇨병 
	
	public int changeValue4(SurveyDTO dto); // 동맥경화증 
	
	public int changeValue5(SurveyDTO dto); // 급성심근경색 
	
	public int changeValue6(SurveyDTO dto); // 위염 
	
	public int changeValue7(SurveyDTO dto); // 비만 
	
	public int changeValue8(SurveyDTO dto); // 만성폐쇄성 폐질환 
	
	public int changeValue9(SurveyDTO dto); // 골다공증 
	
	public int changeValue10(SurveyDTO dto); // 관절염 
	
	public int changeValue11(SurveyDTO dto); // 고지혈증 
	
	public int changeValue12(SurveyDTO dto); // 건강함 
	
	// 설문 결과 불러오기 
	public List<SurveyDTO> loadResult(); 
	
	// 병 정보 불러오기  
	public List<SurveyDTO> loadInfo(); 
	
	// 연산 테이블 초기화 
	public int resetTable();
	
	// DB 에 아이디 존재 여부 확인 
	public int checkDuplication(SurveyDTO dto);
		
}
