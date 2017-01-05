package com.shcompany.controller;

import javax.servlet.http.HttpServletRequest;

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
		ModelAndView mv = new ModelAndView();
		boolean flag;
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		if (shDAOImpl.loginCheck(id) == null) {
			flag=false;
			mv.addObject("result", flag);
			mv.setViewName("login");
			return mv;
		} else {
			if (shDAOImpl.loginCheck(id).equals(password)) {
				flag=true;
				mv.addObject("result", flag);
				mv.setViewName("login");
				return mv;
			}
		}
		return null;

	}

	//
	// @RequestMapping(value = "/reg.sh")
	// public ModelAndView save(@RequestParam("id") String id,
	// @RequestParam("password") String password,
	// @RequestParam("password2") String password2, @RequestParam("birth") int
	// birth) {
	// ModelAndView mv = new ModelAndView();
	// Member member = new Member();
	// member.setId(id);
	// member.setPassword(password);
	// member.setPassword2(password2);
	// member.setBirth(birth);
	// int result = shDAOImpl.getMember(member);
	// System.out.println(result);
	// mv.addObject("result", result);
	// mv.setViewName("1");
	// return mv;
	//
	// }
}
