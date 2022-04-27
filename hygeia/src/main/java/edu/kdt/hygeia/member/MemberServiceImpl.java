package edu.kdt.hygeia.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	// 로그인
	@Override
	public MemberDTO loginMember(MemberDTO dto) {
		return dao.loginMember(dto);
	}
	
	// 회원가입
	@Override
	public int joinMember(MemberDTO dto) {
		return dao.joinMember(dto);
	}

	// 아이디 중복확인
	@Override
	public boolean checkId(String id) {
		String result = dao.checkId(id);
		System.out.println(result);
		if (result == null) {
			return true;
		}
		else {
			return false;
		}
	}
	
	// 회원정보 수정
	@Override
	public int updateMember(MemberDTO dto) {
		return dao.updateMember(dto);
	}

}
