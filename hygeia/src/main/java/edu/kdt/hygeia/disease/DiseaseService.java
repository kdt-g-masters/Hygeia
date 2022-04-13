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
}
