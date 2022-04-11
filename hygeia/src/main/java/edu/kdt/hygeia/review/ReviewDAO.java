package edu.kdt.hygeia.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("reviewdao")
public interface ReviewDAO {
	public List<ReviewDTO> reviewlist();
	public ReviewDTO reviewresult(int reviewid);
	public int reviewinput(ReviewDTO dto);
}
