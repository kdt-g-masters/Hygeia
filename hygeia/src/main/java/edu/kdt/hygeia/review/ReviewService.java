package edu.kdt.hygeia.review;

import java.util.List;

public interface ReviewService {
	public List<ReviewDTO> reviewlist();
	public ReviewDTO reviewresult(int reviewid);
	public int reviewinput(ReviewDTO dto);
}
