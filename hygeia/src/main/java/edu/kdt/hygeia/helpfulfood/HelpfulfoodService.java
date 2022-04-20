package edu.kdt.hygeia.helpfulfood;

import java.util.List;

public interface HelpfulfoodService {
	//병에 좋은 식재료 리스트
	public List<HelpfulfoodDTO> helpfulfoodList(int disease_cntntsSn);
}
