package edu.kdt.hygeia.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	public MemberDTO loginMember(MemberDTO dto);
	public int joinMember(MemberDTO dto);
	public String checkId(String id);
}
