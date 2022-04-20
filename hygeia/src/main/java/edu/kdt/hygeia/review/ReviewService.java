package edu.kdt.hygeia.review;

import java.util.List;

public interface ReviewService {
	//전체 후기 목록
	public List<ReviewDTO> reviewList();
	
	//후기 페이징 목록
	public List<ReviewDTO> reviewPagingList(Criteria cri);
	
	//전체 후기 개수
	public int reviewTotal(Criteria cri);
	
	//후기 상세
	public ReviewDTO reviewResult(int reviewid);
	
	//후기 작성
	public int reviewInput(ReviewDTO dto);
	
	//후기 조회수
	public int reviewCount(int reviewid);
	
	//후기 수정
	public int reviewModify(ReviewDTO dto);
	
	//동일 후기 추천 여부 검색
	public int rcmCheck(RcmDTO dto);
	
	//후기 추천
	public int rcmInsert(RcmDTO dto);
	
	//후기 추천 취소
	public int rcmDelete(RcmDTO dto);
	
	//후기 추천수
	public int rcmCount(int reviewid);
}
