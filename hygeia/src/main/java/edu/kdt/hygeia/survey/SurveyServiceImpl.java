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
	
	@Override 
	public int changeValue3(SurveyDTO dto) { 
		return dao.changeValue3(dto);
	};
	
	@Override 
	public int changeValue4(SurveyDTO dto) { 
		return dao.changeValue4(dto);
	};

	@Override 
	public int changeValue5(SurveyDTO dto) { 
		return dao.changeValue5(dto);
	};

	@Override 
	public int changeValue6(SurveyDTO dto) { 
		return dao.changeValue6(dto);
	};

	@Override 
	public int changeValue7(SurveyDTO dto) { 
		return dao.changeValue7(dto);
	};

	@Override 
	public int changeValue8(SurveyDTO dto) { 
		return dao.changeValue8(dto);
	};

	@Override 
	public int changeValue9(SurveyDTO dto) { 
		return dao.changeValue9(dto);
	};

	@Override 
	public int changeValue10(SurveyDTO dto) { 
		return dao.changeValue10(dto);
	};

	@Override 
	public int changeValue11(SurveyDTO dto) { 
		return dao.changeValue11(dto);
	};

	@Override 
	public int changeValue12(SurveyDTO dto) { 
		return dao.changeValue12(dto);
	};
	
	
	
	@Override 
	public SurveyDTO loadResult(SurveyDTO dto) { 
		return dao.loadResult(dto);
	}; 

}
