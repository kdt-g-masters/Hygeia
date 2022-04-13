package edu.kdt.hygeia.review;

import java.util.List;

public interface ReviewService {
	//후기 목록
	public List<ReviewDTO> reviewlist();
	
	//후기 상세
	public ReviewDTO reviewresult(int reviewid);
	
	//후기 작성
	public int reviewinput(ReviewDTO dto);
}
