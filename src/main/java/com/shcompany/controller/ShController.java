package com.shcompany.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shcompany.dao.ShDAOImpl;
import com.shcompany.vo.Member;

@Controller
public class ShController {

	@Autowired
	private ShDAOImpl shDAOImpl;

	// 회원가입 페이지
	@RequestMapping(value = "/register.sh")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");
		return mv;
	}

	// 회원가입 처리
	@RequestMapping(value = "/reg.sh")
	public ModelAndView reg(Member member) {
		ModelAndView mv = new ModelAndView();
		int result = shDAOImpl.setMember(member);
		mv.addObject("result", result);
		mv.setViewName("registerOk");
		return mv;
	}

	// 로그인 페이지
	@RequestMapping(value = "/login.sh")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	// 로그인 처리
	@RequestMapping(value = "/log.sh")
	public ModelAndView log(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		Member member = new Member();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		member = shDAOImpl.loginCheck(id);

		if (member == null) {
			mv.addObject("loginOk", member);
			mv.setViewName("login");
			return mv;
		} else {
			if (member.getPassword().equals(password)) {
				session.setAttribute("Sid", member.getId());
				mv.addObject("loginOk", member);
				mv.setViewName("login");
				return mv;
			}
		}
		return null;

	}
	@RequestMapping(value = "/myInfo.sh")
	public ModelAndView myInfo(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Member member = new Member();
		String id = (String) session.getAttribute("Sid");
		
		member = shDAOImpl.getMember(id);
		System.out.println("가져온 정보들"+member.getBirth()+member.getId()+member.getPassword());
		mv.addObject("myInfo",member);
		mv.setViewName("myInfo");
		return mv;
	}
	
}
