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
		int result;
		result = memberMapper.getMember(member);
		return result;
		
	}

	public void loginMem(Member member) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.lo
	}
}
