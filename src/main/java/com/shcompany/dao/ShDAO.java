package com.shcompany.dao;

import com.shcompany.vo.Member;

public interface ShDAO {

	public int setMember(Member member);

	public Member loginCheck(String id);

	public Member getMember(String id);
	
	public Member searchId_pw(String name, String birth);

}
