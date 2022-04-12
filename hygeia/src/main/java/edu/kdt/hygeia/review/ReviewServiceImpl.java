package edu.kdt.hygeia.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("reviewservice")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	@Qualifier("reviewdao")
	ReviewDAO dao;
	
	@Override
	public List<ReviewDTO> reviewList() {
		return dao.reviewList();
	}

	@Override
	public ReviewDTO reviewResult(int reviewid) {
		return dao.reviewResult(reviewid);
	}

	@Override
	public int reviewInput(ReviewDTO dto) {
		return dao.reviewInput(dto);
	}
	
}
