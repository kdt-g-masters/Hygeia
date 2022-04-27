package edu.kdt.hygeia.member;

public interface MemberService {
	// 로그인
	public MemberDTO loginMember(MemberDTO dto);
	
	// 회원가입
	public int joinMember(MemberDTO dto);
	
	// 아이디 중복 확인
	public boolean checkId(String id);
	
	// 회원정보 수정
	public int updateMember(MemberDTO dto);
}
