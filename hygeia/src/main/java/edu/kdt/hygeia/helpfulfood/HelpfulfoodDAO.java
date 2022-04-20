package edu.kdt.hygeia.helpfulfood;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("helpfulfooddao")
public interface HelpfulfoodDAO {
	public List<HelpfulfoodDTO> helpfulfoodList(int cntntsSn);
}
