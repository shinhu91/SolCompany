package com.shcompany.dao;

import com.shcompany.vo.Member;

public interface ShDAO {
	
	public int setMember(Member member);
	public String loginCheck(String id, String password);

}
