package com.shcompany.dao;

import org.apache.ibatis.annotations.Param;

import com.shcompany.vo.Member;

public interface MemberMapper {
	public int setMember(Member member);

	public Member loginCheck(@Param("id") String id);

	public Member getMember(String id);

	public Member searchId_pw(@Param("name") String name,@Param("birth") String birth);

}
