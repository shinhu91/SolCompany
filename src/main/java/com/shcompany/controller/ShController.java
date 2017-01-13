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
	public String register() {
		return "register";
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
	public String login() {
		return "login";
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
		System.out.println("member"+member);

		if (member == null) {
			mv.addObject("loginOk", member);
			mv.setViewName("login");
			return mv;
		} else {
			if (member.getPassword().equals(password)) {
				System.out.println(member.getPassword());
				session.setAttribute("Sid", member.getId());
				System.out.println("bbbbb11111");
				if (member.getRank().equals("부장")) {
					System.out.println("bbbbb");
					session.setAttribute("Srank", member.getRank());
					mv.setViewName("login");
					return mv;
				} else {
					mv.addObject("loginOk", member);
					mv.setViewName("list");
					return mv;
				}
			}
		}
		return null;

	}

	// 내 정보 보기
	@RequestMapping(value = "/myInfo.sh")
	public ModelAndView myInfo(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Member member = new Member();
		String id = (String) session.getAttribute("Sid");
		member = shDAOImpl.getMember(id);
		mv.addObject("myInfo", member);
		mv.setViewName("myInfo");
		return mv;

	}

	// 아이디 찾기
	@RequestMapping(value = "/findId.sh")
	public String findId() {
		return "findId";
	}

	@RequestMapping(value = "/searchId.sh")
	public ModelAndView searchId(@RequestParam("name") String name, @RequestParam("birth") String birth) {
		ModelAndView mv = new ModelAndView();
		Member member = shDAOImpl.searchId_pw(name, birth);
		String id = member.getId();
		mv.addObject("searchId", id);
		mv.setViewName("searchId");
		return mv;
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/findPw.sh")
	public String findPw() {
		return "findPw";
	}

	@RequestMapping(value = "/searchPw.sh")
	public ModelAndView searchPw(@RequestParam("name") String name, @RequestParam("birth") String birth) {
		ModelAndView mv = new ModelAndView();
		Member member = shDAOImpl.searchId_pw(name, birth);
		String pw = member.getId();
		mv.addObject("searchPw", pw);
		mv.setViewName("searchPw");
		return mv;
	}
	// 정보 수정

}
