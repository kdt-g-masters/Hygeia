package edu.kdt.hygeia.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	@Override
	public MemberDTO loginMember(MemberDTO dto) {
		return dao.loginMember(dto);
	}

	@Override
	public int joinMember(MemberDTO dto) {
		return dao.joinMember(dto);
	}

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

}
