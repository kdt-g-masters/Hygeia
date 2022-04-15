package edu.kdt.hygeia.disease;

import java.util.List;

import edu.kdt.hygeia.review.ReviewDTO;

public interface DiseaseService {
	//병 목록 페이지
	public List<DiseaseDTO> diseaseList();
	
	//병 상세 페이지 db
	public DiseaseDTO diseaseResult(int cntntsSn);
	
	//병 상세 페이지 open api
	public String openAPI(int cntntsSn);
	
	//병 리뷰
	public List<ReviewDTO> diseaseReview(int disease_cntntsSn);
	
	// 키워드가 포함된 병 이름 조회
	public List<String> keywordSearch(String keyword) throws Exception;
	
	// 검색창의 단어가 포함된 병 이름 조회
	public List<DiseaseDTO> searchDisease(String searchWord) throws Exception;
}
