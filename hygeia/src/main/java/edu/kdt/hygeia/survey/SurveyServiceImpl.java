package edu.kdt.hygeia.survey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("SurveyServiceImpl")
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	@Qualifier("SurveyDAO")
	SurveyDAO dao;
	
	@Override 
	public int saveResult(SurveyDTO dto) { 
		return dao.saveResult(dto);
	};
	
	@Override
	public SurveyDTO loadSheet(SurveyDTO dto) {
		return dao.loadSheet(dto);
	};
	
	@Override 
	public int changeValue1(SurveyDTO dto) { 
		return dao.changeValue1(dto);
	};
	
	@Override 
	public int changeValue2(SurveyDTO dto) { 
		return dao.changeValue2(dto);
	};

}
