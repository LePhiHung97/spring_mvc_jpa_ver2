package com.phihung.springmvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.phihung.springmvc.entities.Users;
import com.phihung.springmvc.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	// Đăng nhập - GET
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session,Model model) {
		session.getAttribute("user");
		System.out.println("Session :  " + session.getAttribute("user"));
		return "login";
	}
	
	// Đăng nhập - POST
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String doLogin(HttpSession session, @RequestParam String username, @RequestParam String password,
			Model model) {
		Users user = userService.findUserByAccount(username, password);
		if (user == null) {
			model.addAttribute("msgLogin", "Tên đăng nhập hoặc mật khẩu không chính xác !");
			return "login";
		} else {
			session.setAttribute("user", user);
			return "redirect:/home";
		}
	}
	
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String home(HttpSession session) {
		System.out.println("Session : "+ session.getAttribute("user"));
		return "home";
	}

	

	// Đăng xuất
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String doLogout(HttpSession session) {
		session.getAttribute("user");
		session.invalidate();
		return "home";
		
		
	}

}
