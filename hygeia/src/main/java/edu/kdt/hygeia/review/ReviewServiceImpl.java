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
	public List<ReviewDTO> reviewList(String memberid) {
		return dao.reviewList(memberid);
	}
	
	@Override
	public List<ReviewDTO> reviewPagingList(Criteria cri) {
		return dao.reviewPagingList(cri);
	}

	@Override
	public int reviewTotal(Criteria cri) {
		return dao.reviewTotal(cri);
	}

	@Override
	public ReviewDTO reviewResult(int reviewid) {
		return dao.reviewResult(reviewid);
	}

	@Override
	public int reviewInput(ReviewDTO dto) {
		return dao.reviewInput(dto);
	}

	@Override
	public int reviewCount(int reviewid) {
		return dao.reviewCount(reviewid);
	}

	@Override
	public int reviewModify(ReviewDTO dto) {
		return dao.reviewModify(dto);
	}

	@Override
	public int rcmCheck(RcmDTO dto) {
		return dao.rcmCheck(dto);
	}

	@Override
	public int rcmInsert(RcmDTO dto) {
		return dao.rcmInsert(dto);
	}

	@Override
	public int rcmDelete(RcmDTO dto) {
		return dao.rcmDelete(dto);
	}

	@Override
	public int rcmCount(int reviewid) {
		return dao.rcmCount(reviewid);
	}
	
}
