package edu.kdt.hygeia.review;

import java.util.List;

public interface ReviewService {
	//후기 목록
	public List<ReviewDTO> reviewList();
	
	//후기 상세
	public ReviewDTO reviewResult(int reviewid);
	
	//후기 작성
	public int reviewInput(ReviewDTO dto);
	
	//후기 조회수
	public int reviewCount(int reviewid);
}
