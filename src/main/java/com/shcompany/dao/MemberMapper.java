package com.shcompany.dao;

import org.apache.ibatis.annotations.Param;

import com.shcompany.vo.Member;

public interface MemberMapper {
	public int setMember(Member member);
	public String loginCheck(@Param("id") String id,@Param("password") String password);

}
