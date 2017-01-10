package com.shcompany.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shcompany.vo.Member;

@Service
public class ShDAOImpl implements ShDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int setMember(Member member) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.setMember(member);

	}

	@Override
	public Member loginCheck(String id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.loginCheck(id);
	}

	public Member getMember(String id) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.getMember(id);
	}

	@Override
	public Member searchId_pw(String name, String birth) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.searchId_pw(name,birth);
	}
}
