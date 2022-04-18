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
	}

}
