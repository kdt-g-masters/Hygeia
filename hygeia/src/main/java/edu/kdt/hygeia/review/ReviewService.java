package edu.kdt.hygeia.review;

import java.util.List;

public interface ReviewService {
	//전체 후기 목록
	public List<ReviewDTO> reviewList();
	
	//후기 페이징 목록
	public List<ReviewDTO> reviewPagingList(Criteria cri);
	
	//전체 후기 개수
	public int reviewTotal();
	
	//후기 상세
	public ReviewDTO reviewResult(int reviewid);
	
	//후기 작성
	public int reviewInput(ReviewDTO dto);
	
	//후기 조회수
	public int reviewCount(int reviewid);
}
