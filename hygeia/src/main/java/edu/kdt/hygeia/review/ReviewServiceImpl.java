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
	public List<ReviewDTO> reviewlist() {
		return dao.reviewlist();
	}

	@Override
	public ReviewDTO reviewresult(int reviewid) {
		return dao.reviewresult(reviewid);
	}

	@Override
	public int reviewinput(ReviewDTO dto) {
		return dao.reviewinput(dto);
	}
	
}
