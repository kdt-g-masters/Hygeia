package edu.kdt.hygeia.disease;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import edu.kdt.hygeia.review.ReviewDTO;

@Mapper
@Repository("diseasedao")
public interface DiseaseDAO {
	public List<DiseaseDTO> diseaseList();
	public DiseaseDTO diseaseResult(int cntntsSn);
	//public List<ReviewDTO> diseaseReview(int cntntsSn);
}
